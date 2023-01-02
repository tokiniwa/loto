FactoryBot.define do
  factory :loto_seven_number do
    association :loto_event, factory: [:loto_event, :loto_seven]
    lottery_number { [*1..37].sample }
    priority { [*1..7].sample }
  end
end
