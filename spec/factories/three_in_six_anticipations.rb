FactoryBot.define do
  factory :three_in_six_anticipation do
    association :event, strategy: :build
  end
end
