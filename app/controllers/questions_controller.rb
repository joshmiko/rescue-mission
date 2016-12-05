class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question was successfully posted"
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      flash[:notice] = "Question was successfully updated."
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @questions = Question.all.order(created_at: :desc)
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question was successfully deleted."
    redirect_to questions_path
  end



  private
    def question_params
      params.require(:question).permit(:title, :description)
    end



end
