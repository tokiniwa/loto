class Event < ApplicationRecord
  has_many :loto_sixes

  validates :lottery_id, presence: true,
             numericality: { only_integer: true, greater_than: 0 },
             uniqueness: true
  validates :lottery_date, presence: true
end
