FactoryBot.define do
  factory :match do
    donor { create(:user) }
    match_type { %i[donor dollar].sample }
    end_date { 5.days.from_now }
    pledge_limit { Faker::Number.between(from: 50, to: 100) }
    pledge_amount { Faker::Number.between(from: 1, to: 5) }
  end
end
