class TheoreticalWinning < ApplicationRecord
  validates :grade, presence: true,
                    numericality: { only_integer: true, greater_than: 0, less_than: 6 },
                    uniqueness: true
  validates :winning, presence: true,
                      numericality: { only_integer: true, greater_than: 0 }
end
