FactoryBot.define do
  factory :schedule do
    title { Faker::Lorem.unique.word }
    date { "2025-01-20" }
    user { nil }
  end
end
