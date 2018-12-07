class TopicsController < ApplicationController
  before_action :authenticate_user! #ログインしてないとログイン画面にリダイレクトする

  def index
    @topics = Topic.page(params[:page]).per(3)
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

  def purchase
    Payjp.api_key = "sk_test_06347736dcae0e04c57f3457"
    Payjp::Charge.create(:amount => 3000, :card => params['payjp-token'],:currency => 'jpy')
    redirect_to root_path, notice: "支払いが完了しました"
  end





  private
    def topic_params
      params.require(:topic).permit(:cafe_name,:content,:picture)
    end
end
