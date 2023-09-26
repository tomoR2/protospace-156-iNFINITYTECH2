class PrototypesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # prototype.create(prototype_params) #{ストロングﾊﾟﾗﾒｰﾀｰ作成メソッドの名前が引数}
    # 保存できた場合とできなかった場合での分岐処理
    #if @prototype.save
      #redirect_to room_messages_path(@room)
      #else
     #render :index, status: :unprocessable_entity
    #end
  end
  
  def destroy
  
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def show
    # @user = User.find(params[:id]) ←一回非表示
  end
  
  private
  # ＜ピックツイートのコントローラー記述をコピペしました、適宜変更していきましょう＞
  # def tweet_params
  #   params.require(:tweet).permit( :image, :text).merge(user_id: current_user.id)
  # end
  
  # def set_tweet
  #   @tweet = Tweet.find(params[:id])
  # end
  
  def prototype_params
    params.require(:prototype).permit(:name, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end


