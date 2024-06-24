class OtpVerificationsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @otp_verification = OtpVerification.new(@user)

    if @otp_verification.verify_token(params[:token])
      sign_in @user
      redirect_to root_path
    else
      flash[:error] = "Bad one-time password"
      render :new
    end
  end
end
