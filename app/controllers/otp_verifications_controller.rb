class OtpVerificationsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])

    sign_in @user
    redirect_to root_path
  end
end
