class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
    @users = User.all
    if @users
      render json: { users: @users }
    else
      render json: { status: 500, errors: ['No users found.'] }
    end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'Failed to create new user! Please try again.' }, status: :not_acceptable
    end
  end

  def show
    @user = User.find(user_params[:id])
    if @user
      render json: { user: @user }
    else
      render json: {
        status: 500,
        errors: ['User not found.']
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type)
  end
end
