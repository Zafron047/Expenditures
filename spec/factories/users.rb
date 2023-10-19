FactoryBot.define do
  factory :user do
    name { 'Jack Dawson' }
    email { 'jack@email.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
