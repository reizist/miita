# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Forgery('internet').email_address }
    provider { 'twitter' }
    uid { Forgery(:basic).number(:at_least => 100000, :at_most => 999999).to_s }
    screen_name { Forgery(:internet).user_name }
    name { Forgery(:name).first_name }
    icon_url { }
    admin { false }
  end
end
