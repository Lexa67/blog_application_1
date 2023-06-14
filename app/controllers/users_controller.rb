class UsersController < ApplicationController
  before_action :set_user
  def profile
    @user.update(views: @user.views + 1)
  end

  def index
    @users = User.all    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "Пользователь успешно удален."
  end

  private

  def set_user
    @user = User
  end
end
