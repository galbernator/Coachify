class ResponsesController < ApplicationController

  def new
    @evaluation = Evaluation.find(params[:evaluation_id])
    @questions = Question.where(evaluation: @evaluation)
    @observation = Observation.where(observer_id: current_user.id).last
  end

  def create
    response_params = params.require(:response).permit([:answer_id, :observation_id, :question_id, :evaluation_id])
    @response = Response.new(response_params)
    @response.save
    head :created
  end
end
