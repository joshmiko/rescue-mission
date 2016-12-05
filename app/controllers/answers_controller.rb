class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers.order('created_at DESC')
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer was successfully posted"
      redirect_to @question
    else
      render :new
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:description)
    end
end
