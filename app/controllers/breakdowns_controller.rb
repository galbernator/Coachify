class BreakdownsController < ApplicationController

  def index
    @question = Question.find params[:question_id]
    @response = @question.responses
    
  end
end
