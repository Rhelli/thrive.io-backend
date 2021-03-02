class Api::V1::AuthController < ApplicationController
  before_action :authorized, only: [:auto_login]
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.authenticate(user_login_params[:email], user_login_params[:password])
    if @user
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email address or password. Please try again.' }, status: :unauthorized
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password)
  end
end
