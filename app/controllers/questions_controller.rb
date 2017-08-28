class QuestionsController < ApplicationController
  def index
    @questions = Question.all
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
      flash[:notice] = "Question added successfully"
      redirect_to question_path(@question)
    else
      flash[:errors] = @question.errors.full_messages.join(', ')
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
