FactoryBot.define do
  factory :loto_six_number do
    association :loto_six_event, strategy: :build
    lottery_number { [*1..43].sample }
    priority { [*1..6].sample }
  end
end
