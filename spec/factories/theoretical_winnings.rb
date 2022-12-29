FactoryBot.define do
  factory :theoretical_winning do
    sequence(:grade) { |n| n + 1 }
    winning { 1000 }
  end
end
