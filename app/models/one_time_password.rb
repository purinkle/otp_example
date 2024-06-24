module OneTimePassword
  def self.build
    if Rails.env.test?
      FakeOneTimePassword.new
    else
      ROTP::TOTP.new("base32secret3232")
    end
  end
end
