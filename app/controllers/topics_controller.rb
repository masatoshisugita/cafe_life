class TopicsController < ApplicationController
  before_action :authenticate_user! #ログインしてないとログイン画面にリダイレクトする

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render 'topic/new'
    end
  end

  def destroy
  end





  private
    def topic_params
      params.require(:topic).permit(:cafe_name,:content,:picture)
    end
end
