class OtpTokensController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])

    @otp_verification = OtpVerification.new(@user)
    @otp_verification.send_token

    render "otp_verifications/new"
  end
end
