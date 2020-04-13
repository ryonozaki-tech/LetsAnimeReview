class CommentsController < ApplicationController
  
  def create
    # comment = Comment.create(comment_params)
    # redirect_to "/posts/#{comment.post.id}"

    @comment = Comment.create(comment_params)

    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id]) }
      format.json
    end
  end

  # def edit
  #   @post = Post.find(params[:id])
  #   @comment = Comment.find(params[:id])
    
  # end

  # def update
  #   @comment = Comment.find(params[:id])
  #   @comment.update(comment_params)
  #   if @comment.save
  #     redirect_to "/posts/#{@comment.post.id}"
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to "/posts/#{comment.post.id}"
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end


