class BreakdownsController < ApplicationController

  def index
    @question = Question.find params[:question_id]
    @response = @question.responses
    @piechart_data = @question.responses.joins(:answer).select("count(answer_id), answer_id").group(:answer_id).map {|x| [x.answer.answer, x.count] }
  end
end
