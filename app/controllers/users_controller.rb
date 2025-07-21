class UsersController < ApplicationController
  def index
    render json: { users: User.all.map(&:as_json) }, status: :ok
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user.as_json, status: :created
    else
      render json: { message: "User could not be created.", errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :username)
  end
end
