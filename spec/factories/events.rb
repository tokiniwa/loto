FactoryBot.define do
  factory :event do
    sequence(:lottery_id) { |n| n + 1 }
    lottery_date { Date.today }
  end
end
