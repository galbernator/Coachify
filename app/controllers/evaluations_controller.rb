class EvaluationsController < ApplicationController

  before_action :find_evaluation, only: [:show, :edit, :update, :destroy]

  def index
    company = current_user.company.id
    if Evaluation.all.length > 0
      @evaluations = Evaluation.where(company: company)
    else
      @evaluations = Evaluation.all
    end
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.company = current_user.company
    if @evaluation.save(evaluation_params)
      redirect_to new_evaluation_question_path(@evaluation)
    else
      render :new
    end
  end

  def show
    @evaluation = Evaluation.find params[:id]
    @question = Question.new
  end

  def edit
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to @evaluation
    else
      render :edit
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to evaluations_path
  end

  private

  def find_evaluation
    @evaluation = Evaluation.find params[:id]
  end

  def evaluation_params
    params.require(:evaluation).permit([:title])
  end

end
