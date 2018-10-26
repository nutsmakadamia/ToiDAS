class QuestionsController < ApplicationController
  def create
    @url = Url.find(params[:url_id])
    @question = @url.questions.create(question_params)
    redirect_to url_path(@url)
  end

  def destroy
    @url = Url.find(params[:url_id])
    @question = @url.questions.find(params[:id])
    @question.destroy
    redirect_to url_path(@url)
  end

  def increment_yes
    @url = Url.find(params[:url_id])
    @question = @url.questions.find(params[:question_id])
    @question.increment(:yes)
    @question.save
    redirect_to url_path(@url)
  end

  def increment_no
    @url = Url.find(params[:url_id])
    @question = @url.questions.find(params[:question_id])
    @question.increment(:no)
    @question.save
    redirect_to url_path(@url)
  end

  private
    def question_params
      params.require(:question).permit(:content, :url_id)
    end
end
