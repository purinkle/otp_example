class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)

    if @user.present?
      render "otp_verifications/new"
    else
      flash.now.alert = "Bad email or password."
      render template: "sessions/new", status: :unauthorized
    end
  end
end
