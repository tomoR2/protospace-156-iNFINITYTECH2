class CommentsController < ApplicationController

  def create
    @comments = Comment.all
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to prototype_comments_path(@comment.id)
    else
      @prototype = Prototype.find(params[:prototype_id])

     render :'prototypes/show', status: :unprocessable_entity
    end

  end


  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
