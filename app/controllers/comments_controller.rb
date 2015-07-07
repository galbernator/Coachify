class CommentsController < ApplicationController

  def create
    @blogpost = Blogpost.find params[:blogpost_id]
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.blogpost_id = @blogpost.id
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @blogpost}
        format.js { render }
      else
        format.html { redirect_to "/blogposts/show" }
        format.js { render :create_failure }
      end
    end
  end

  def destroy
    blogpost = Blogpost.find params[:blogpost_id]
    @comment = Comment.find params[:id]
    respond_to do |format|
      @comment.destroy
      format.html {redirect_to "blogposts/show"}
      format.js   { render }
    end
  end
end
