FactoryBot.define do
  factory :loto_six_number do
    association :loto_event, factory: [:loto_event, :loto_six]
    lottery_number { [*1..43].sample }
    priority { [*1..6].sample }
  end
end
