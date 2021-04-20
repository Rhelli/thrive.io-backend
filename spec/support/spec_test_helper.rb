module SpecTestHelper
  def login(user)
    user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    request.authorize[:user] = user.id
  end

  def current_user
    User.find(request.authorize[:user])
  end
end
