class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in?, only: [:index,:show,:edit,:update]
  before_action :logged_in_user, only: [:show,:edit,:update,:destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit,:update]
  before_action :admin_user, only: [:index, :destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: :show
  before_action :admin_or_correct_user, only: :show
  
  EDIT_ERROR_MESSAGE = "入力内容に問題があります。"
  
  def new
  @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録が完了しました。"
      redirect_to @user
    else
      render new_user_path
    end
  end
  
  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end
  
  def index
    @users = User.all
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success]  ="情報を更新しました。"
      redirect_to @user
    else
      flash[:danger] = EDIT_ERROR_MESSAGE
      render :edit
    end
  end
  
  def destroy
    @user.destroy
  end
  
  def edit_basic_info
  end
  
  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success]="#{@user.name}さんの基本情報を更新しました。"
    else
      flash[:danger]="#{@user.name}さんの更新は失敗しました。<br>" + @user.errors.full_messages.join('<br>')
    end
    redirect_to users_url
  end

  def destroy
    @user.destroy
    flash[:success]  ="#{@user.name}さんの情報を削除しました。"
    redirect_to users_path
  end
  
  def import
    User.import(params[:file])
    redirect_to users_url
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:affiliation)
    end
    
    def basic_info_params
      params.require(:user).permit(:affiliation,:basic_time, :designated_work_start_time,:designated_work_finish_time)
    end

end
