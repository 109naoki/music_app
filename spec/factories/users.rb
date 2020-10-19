FactoryBot.define do
 factory :user do
 name "Bob"

  sequence(:email) { |n| "example#{n}@example.com" }
 password "dottle-nouveau-pavilion-tights-furze"
  end
 end
