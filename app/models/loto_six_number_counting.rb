class LotoSixNumberCounting < ApplicationRecord
  validates :number, presence: true,
             numericality: { only_integer: true, greater_than: 0, less_than: 44 },
             uniqueness: true
  validates :lottery_number1, presence: true
  validates :lottery_number2, presence: true
  validates :lottery_number3, presence: true
  validates :lottery_number4, presence: true
  validates :lottery_number5, presence: true
  validates :lottery_number6, presence: true
  validates :lottery_number_rate1, presence: true
  validates :lottery_number_rate2, presence: true
  validates :lottery_number_rate3, presence: true
  validates :lottery_number_rate4, presence: true
  validates :lottery_number_rate5, presence: true
  validates :lottery_number_rate6, presence: true

  scope :number_order, -> { order(number: :asc) }

  def self.set_lottery_numbers lottery_count: 52
    event_ids = LotoEvent.loto_six.lottery_date_order.limit(lottery_count).ids
    LotoSevenNumber.where(loto_event_id: event_ids)
                   .group([:priority, :lottery_number])
                   .count
                   .each do |k, v|
      counting = LotoSixNumberCounting.find_by(number: k.second)
      counting.update("lottery_number#{k.first}": v, "lottery_number_rate#{k.first}": v.to_f / lottery_count)
    end
  end
end
