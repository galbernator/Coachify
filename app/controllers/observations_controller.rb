class ObservationsController < ApplicationController

  before_action :authorize_user!

  def new
    @observation = Observation.new
    @evaluations = current_user.company.evaluations
  end

  def create
    if cookies[:observation_id]
      cookies[:observation_id] = nil
    end
    observation_params = params.require(:observation).permit(:subject_id, :evaluation_id )
    @observation = Observation.new(observation_params)
    @observation.observer = current_user
    if @observation.save
      cookies[:observation_id] = { value: @observation.id, :expires => 2.hours.from_now }
      redirect_to new_evaluation_response_path(params[:observation][:evaluation_id].to_i)
    else
      render :new
    end
  end

  def show
    @observations  = current_user.company.observations
  end
end
