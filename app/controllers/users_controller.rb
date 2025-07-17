class UsersController < ApplicationController
  def create
    render json: { message: 'User was successfully created.'}, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
