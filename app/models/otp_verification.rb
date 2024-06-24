class OtpVerification
  def initialize(user)
    @user = user
    @one_time_password = OneTimePassword.build
    @sms_client = SmsClient.build
  end

  def send_token
    @one_time_password.now.tap do |token|
      Rails.cache.write("otp_verification_token", token)
      @sms_client.send_sms(
        recipient: @user.phone_number,
        message: "Your OTP is #{token}"
      )
    end
  end

  def verify_token(token)
    token == Rails.cache.read("otp_verification_token")
  end
end
