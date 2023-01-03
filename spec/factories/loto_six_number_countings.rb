FactoryBot.define do
  factory :loto_six_number_counting do
    number { [*1..43].sample }
  end
end
