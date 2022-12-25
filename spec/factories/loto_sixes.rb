FactoryBot.define do
  factory :loto_six do
    sequence(:lottery_id) { |n| n + 1 }
    lottery_date { Date.today }
    lottery_number { [*1..43].sample }
    priority { [*1..7].sample }
    is_bonus { false }
  end
end
