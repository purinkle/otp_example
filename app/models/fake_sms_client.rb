class FakeSmsClient
  def self.send_sms(recipient:, message:)
    FakeSmsMessage.create!(phone_number: recipient, message:)
  end
end
