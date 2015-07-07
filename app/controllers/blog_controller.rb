class BlogController < ApplicationController

  def index
    #
    #   # find blogs posts
    query = params[:query]
        if params[:query].present?
          @blogs = Blogpost.where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%")
        else
          @blogs = Blogpost.all
        end
    # else
    #   # get all blogs
    # end
    @topics = ["Sales", "CSAT", "Observing", "Coaching", "Motivation", "Video"]
    # render json: Blogpost.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def search

  end

end
