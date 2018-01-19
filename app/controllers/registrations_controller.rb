class RegistrationsController < Devise::RegistrationsController

  skip_before_filter :require_no_authentication, only: [:new]

  def new
    @user = User.new
  end
  def add_user
    @user = User.new(user_params)
     if @user.save!
       redirect_to root_path
     end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end