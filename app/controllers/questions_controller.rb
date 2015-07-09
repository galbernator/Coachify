class QuestionsController < ApplicationController

  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @evaluation = Evaluation.find params[:evaluation_id]
    @question = Question.new
    2.times { @question.answers.build}
  end

  def create
    evaluation = Evaluation.find params[:evaluation_id]
    @question = Question.new(question_params)
    @question.evaluation = evaluation
    @question.answers.each do |a|
      a.evaluation = evaluation
    end
    debugger
    if @question.save
      redirect_to evaluation_path(evaluation)
    else
      render :new, alert: "Questions was not saved"
    end
  end

  def show
  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to evaluation_question_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to evaluation_question_path
  end

  private

  def find_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit([:text, :kind, {answers_attributes:
                                        [:answer, :id, :_destroy]}])
  end

end
