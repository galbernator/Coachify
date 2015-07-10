class ObservationsController < ApplicationController

  def new
    @observation = Observation.new
    @evaluations = current_user.company.evaluations
  end

  def create
    observation_params = params.require(:observation).permit(:subject_id, )
    @observation = Observation.new(observation_params)
    @observation.observer = current_user
    @observation.evaluation = current_user.company.evaluations
    if @observation.save
      redirect_to new_observation_response_path(@observation)
    else
      render :new
    end
  end
end
