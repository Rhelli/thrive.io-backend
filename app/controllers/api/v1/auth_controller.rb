class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :authorized, only: [:auto_login]

  def create
    @user = User.authenticate(user_login_params[:email], user_login_params[:password])
    if @user
      current_user = @user
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { error: 'Invalid email address or password. Please try again.' }, status: :unauthorized
    end
  end

  def auto_login
    render json: @user
  end

  def check_credentials
    @user = User.authenticate(user_login_params[:email], user_login_params[:password])
    if @user
      render json: { message: 'Authenticated' }, status: :accepted
    else
      render json: { error: ['Invalid login credentials. Please try again.'] }, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password, :id)
  end
end
