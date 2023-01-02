FactoryBot.define do
  factory :loto_event do
    sequence(:lottery_id) { |n| n + 1 }
    lottery_date { Date.today }

    trait :loto_six do
      lottery_type { :loto_six }
    end

    trait :loto_seven do
      lottery_type { :loto_seven }
    end
  end
end
