module SmsClient
  def self.build
    unless Rails.env.production?
      FakeSmsClient
    end
  end
end
