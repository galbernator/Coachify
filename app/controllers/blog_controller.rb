class BlogController < ApplicationController

  def index
    query = params[:query]
    if params[:query].present?
      @blogs = Blogpost.where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%")
    else
      @blogs = Blogpost.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
