class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
    @new_answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question updated successfully"
      redirect_to question_path(@question)
    else
      flash[:errors] = @questions.errors.full_messages.join(', ')
      render :edit
    end
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = "Question added successfully"
      redirect_to question_path(@question)
    else
      flash[:errors] = @question.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers
    @question.destroy
    @answers.each do |answer|
      answer.destroy
    end
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
