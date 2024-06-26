if Rails.env.development? || Rails.env.test?
  require "factory_bot"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      create(
        :user,
        email: "user@example.com",
        password: "password",
        phone_number: "+966512345678"
      )
    end
  end
end
