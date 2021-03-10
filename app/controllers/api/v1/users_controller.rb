class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def profile
    render json: current_user, serializer: UserSerializer, status: :accepted
  end

  def index
    users = User.all
    @users = users.where(user_type: 'Looking').order(created_at: :asc)
    if @users
      render json: @users, each_serializer: UserSerializer
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
      render json: { errors: ['Failed to create new user! Please try again.'] }, status: :not_acceptable
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
