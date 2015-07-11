class ResponsesController < ApplicationController

  def new
    @questions = Question.where(evaluation: params[:evaluation_id])
    @observation = Observation.where(observer_id: current_user.id).last
  end

  def create
    response_params = params.require(:response).permit([:answer, :observation, :question])
    @response = Response.new(response_params)
    if @response.save
      render notice: "Answer saved"
    else
      render alert: "Please select response again"
    end
  end
end
