FactoryBot.define do
  factory :loto_six do
    association :event, strategy: :build
    lottery_number { [*1..43].sample }
    priority { [*1..7].sample }
    is_bonus { false }
  end
end
