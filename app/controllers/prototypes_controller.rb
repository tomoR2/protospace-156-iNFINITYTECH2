class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ,:destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # 保存できた場合とできなかった場合での分岐処理
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      redirect_to root_path(@prototype.id)
    else
     render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
  
  end
  
  def edit
    
  end
  
  def update
    prototype = Prototype.find(params[:id])     
    prototype.destroy
    redirect_to root_path
  end
  
  def edit
    @prototype = Prototype.find(params[:id]) 
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end
  end
  
  def update
    prototype = Prototype.find(params[:id])     
    if prototype.update(prototype_params)
      redirect_to root_path(prototype.id)
    else
     render :edit, status: :unprocessable_entity
    end
  end
  
  def show
    @prototype = Prototype.find(params[:id]) 
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
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

