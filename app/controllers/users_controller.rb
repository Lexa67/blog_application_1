class UsersController < ApplicationController
  before_action :set_user, only: %i[profile edit update destroy]
  def profile
    @user.update(views: @user.views + 1)
  end

  def index
    @users = User.all    
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "Пользователь успешно удален."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

   def user_params
    params.require(:user).permit(:name, :phone, :role, :email, :password, :password_confirmation)
  end
end
