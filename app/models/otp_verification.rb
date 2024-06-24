class OtpVerification
  def initialize
    @one_time_password = OneTimePassword.build
  end

  def send_token
    @one_time_password.now.tap do |token|
      Rails.cache.write("otp_verification_token", token)
      Rails.logger.info("#{"*" * 10} [token] #{token.inspect}")
    end
  end

  def verify_token(token)
    token == Rails.cache.read("otp_verification_token")
  end
end
