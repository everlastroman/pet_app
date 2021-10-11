FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.email }
    
    trait :role_admin do
      role      { User::ADMIN }
      password  { 'test1111' }
    end

    trait :role_member do
      role     { User::MEMBER }
      password { 'test2222' }
    end

    trait :role_moderator do
      role      { User::MODERATOR }
      password  { 'test3333' }
    end
  end
end
