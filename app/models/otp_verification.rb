class OtpVerification
  TOKEN_EXPIRATION = 5.minutes

  def initialize(user)
    @user = user
    @one_time_password = OneTimePassword.build
    @sms_client = SmsClient.build
  end

  def send_token
    @one_time_password.now.tap do |token|
      Rails.cache.write(cache_key, token, expires_in: TOKEN_EXPIRATION)
      @sms_client.send_sms(
        recipient: @user.phone_number,
        message: "Your OTP is #{token}"
      )
    end
  end

  def verify_token(token)
    token == Rails.cache.read(cache_key)
  end

  private

  def cache_key
    "otp_verification_token_#{@user.id}"
  end
end
