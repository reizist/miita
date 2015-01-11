# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    user { create(:user) } 
    title { Forgery(:basic).text } 
    content { Forgery(:lorem_ipsum).words(10) } 
  end
end
