class CreateFakeSmsMessage < ActiveRecord::Migration[7.1]
  def change
    create_table :fake_sms_messages do |t|
      t.string :phone_number
      t.string :message

      t.timestamps
    end
  end
end
