module SpecTestHelper
  def login(_user)
    @user = User.authenticate(user_login_params[:email], user_login_params[:password])
    return unless @user

    token = encode_token({ user_id: @user.id })
    render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
  end

  def current_user
    User.find(request.authorize[:user])
  end
end
