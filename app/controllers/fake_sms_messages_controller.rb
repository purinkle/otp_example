class FakeSmsMessagesController < ApplicationController
  def index
    @fake_sms_messages = FakeSmsMessage.order(created_at: :desc)
  end
end
