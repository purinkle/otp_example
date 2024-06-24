class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)

    if @user.present?
      @otp_verification = OtpVerification.new(@user)
      @otp_verification.send_token

      render "otp_verifications/new"
    else
      flash.now.alert = "Bad email or password."
      render template: "sessions/new", status: :unauthorized
    end
  end
end
