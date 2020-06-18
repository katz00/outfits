FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@sample.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    introduction { "80年代ファッションが好きです！" }
    sex { "男性" }
  end
end