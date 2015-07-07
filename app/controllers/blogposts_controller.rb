class BlogpostsController < ApplicationController

  def index
    @blogposts = Blogpost.all
    render json: Blogpost.all
  end

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(blogpost_params)
    @blogpost.user = current_user
    @topics = ["Sales", "Customer Service", "Observation", "Coaching Tips", "Motivation", "Video"]
    if @blogpost.save
      redirect_to blog_index_path, notice: "Post added successfully."
    else
      render :new
    end
  end

  def show
    @blogpost = Blogpost.find params[:id]
    @comment = Comment.new
    @comments = Comment.where(blogpost_id: @blogpost.id)
  end

  def edit
    @blogpost = Blogpost.find params[:id]
  end

  def update
    @blogpost = Blogpost.find params[:id]
    if @blogpost.update(blogpost_params)
      redirect_to blog_index_path, notice: "Updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @blogpost = Blogpost.find params[:id]
    @blogpost.destroy
    redirect_to blog_index_path
  end

  private

  def   blogpost_params
    params.require(:blogpost).permit([:title, :body, :image])
  end

end
