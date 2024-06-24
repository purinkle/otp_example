class OtpVerification
  VALID_TOKEN = "123456"

  def send_token
    Rails.cache.write("otp_verification_token", VALID_TOKEN)
  end

  def verify_token(token)
    token == Rails.cache.read("otp_verification_token")
  end
end
