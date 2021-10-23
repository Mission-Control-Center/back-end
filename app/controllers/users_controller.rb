class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(params[:id])
    if @user
      render json: @user
    else
      render json: { 'Error': 'User not found' }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { 'Error': @user.errors.full_message }
    end
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: { 'Error': @user.errors.full_message }
    end
  end
  
  def destroy
    @user = User.find_by(params[:id])
    @user&.destroy
  end

  private 
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
