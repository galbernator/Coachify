class QuestionsController < ApplicationController

  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @evaluation = Evaluation.find params[:evaluation_id]
    @question = Question.new
    @types = ['Scale', 'Grade', 'True or False', 'Single Answer', 'Multiple Answers', 'Short Answer']
  end

  def create
    evaluation = Evaluation.find params[:evaluation_id]
    @question = Question.new(question_params)
    @question.evauation = evaluation
    continue = params[:commit]
    if continue == "Add Another Question"
      if @question.save
        redirect_to new_question_path
      else
        render :new, alert: "Questions was not saved"
      end
    else
      if @question.save
        redirect_to evaluation_questions_path
      else
        render :new
      end
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
    params.require(:question).permit([:text, :type, :continue])
  end

end
