class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: %i[create index]

  def profile
    render json: current_user, serializer: UserSerializer, status: :accepted
  end

  def index
    @users = User.looking_users
    if @users
      render json: @users, each_serializer: UserSerializer
    else
      render json: { status: 500, error: ['No users found.'] }
    end
  end

  def create
    @user = User.create!(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: ['Failed to create new user! Please try again.'] }, status: :not_acceptable
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

  def update
    @user = User.find(user_params[:id])
    if @user.update!(user_params)
      render json: current_user, serializer: UserSerializer, status: :accepted
    else
      render json: { error: ['Failed to update user! Please try again.'] }, status: :not_acceptable
    end
  end

  def destroy
    @user = User.find_by(email: user_params[:email])
    if @user.destroy!
      render json: { message: 'Account deleted successfully.', status: :ok }
    else
      render json: { error: ['An error occurred whilst deleting this account. Please try again.'] }, status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :id, :name, :dob, :email, :password, :user_type, :advertiser_type, :occupation, :about, :gender, :couple,
      :smoking, :min_budget, :max_budget, areas_looking: [], pets: []
    )
  end
end
