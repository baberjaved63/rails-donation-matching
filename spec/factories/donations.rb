FactoryBot.define do
  factory :donation do
    donor { create(:user) }
    amount { Faker::Number.between(from: 1, to: 5) }
  end
end
