class Admin::UsersController < ApplicationController
  #skip_before_action :login_required

  def index
    @users = User.all
  end

  def show
   @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ようこそ！　ユーザー登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation, :image, :image_cache, :remove_image)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end

end
