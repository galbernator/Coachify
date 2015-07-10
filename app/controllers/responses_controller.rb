class ResponsesController < ApplicationController

  def new
    @questions = Question.where(evaluation: params[:evaluation_id])
  end

  def create

  end
end
