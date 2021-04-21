module SpecTestHelper
  def login(user)
    @user = User.authenticate(user_login_params[:email], user_login_params[:password])
    if @user
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    end
  end

  def current_user
    User.find(request.authorize[:user])
  end
end
