class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
    @quiz.questions.build
  end

  def create
    @quiz = Quiz.new quiz_params
    if @quiz.save
      flash[:success] = "Quiz Created"
      redirect_to quizzes_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def quiz_params
    params
      .require(:quiz).permit(
      :title,
      questions_attributes: [
        :id,
        :text,
        :_destroy
      ]
    )
  end
end
