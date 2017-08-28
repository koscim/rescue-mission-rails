class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params["answer"]["question_id"])
    if @answer.save
      flash[:notice] = "Answer added successfully"
      redirect_to question_path(@question)
    else
      flash[:notice] = @answer.errors.full_messages.join(', ')
      redirect_to question_path(@question)
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description, :user_id, :question_id)
  end
end
