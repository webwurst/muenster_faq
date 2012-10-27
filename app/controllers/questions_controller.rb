class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    submitted = params[:question]

    @question = Question.create(
      :question => submitted[:question],
      :context  => submitted[:context],
      :urgency  => submitted[:urgency],
      :name     => submitted[:name],
      :email    => submitted[:email],
      :location => submitted[:location]
    )
    # @question.save!

    flash[:success] = "Thanks for submitting a question! We'll review it and try to answer it as best as we can."
    redirect_to :root
  end

  def working
    @questions = Question.where(:status => 'working')
  end

  def answered
    @questions = Question.where(:status => 'answered')
  end
end
