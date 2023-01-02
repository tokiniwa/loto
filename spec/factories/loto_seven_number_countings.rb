FactoryBot.define do
  factory :loto_seven_number_counting do
    number { [*1..37].sample }
  end
end
