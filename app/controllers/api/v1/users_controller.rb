class API::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'Failed to create new user! Please try again.' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type, :avatar, :about)
  end
end
