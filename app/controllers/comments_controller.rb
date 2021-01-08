class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    if comment_params[:user_id].empty?
      user = User.new(comment_params[:user_attributes])
      user.comments << comment
    else 
      User.find(comment_params[:user_id]).comments << comment
    end
    redirect_to comment.post
  end



  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
