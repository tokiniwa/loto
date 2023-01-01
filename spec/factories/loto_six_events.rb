FactoryBot.define do
  factory :loto_six_event do
    sequence(:lottery_id) { |n| n + 1 }
    lottery_date { Date.today }
  end
end
