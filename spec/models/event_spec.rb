require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'リレーション' do
    it { is_expected.to have_many :winning_numbers }
    it { is_expected.to have_one :bonus_number }
    it { is_expected.to have_one :three_in_six_anticipation }
  end

  describe 'バリデーション' do
    describe 'uniqueness' do
      subject { build :event }

      it { is_expected.to validate_uniqueness_of(:lottery_id) }
    end

    describe 'presence' do
      it { is_expected.to validate_presence_of :lottery_id }
      it { is_expected.to validate_presence_of :lottery_date }
    end

    describe 'numericality' do
      it { is_expected.to validate_numericality_of(:lottery_id).only_integer.is_greater_than(0) }
    end
  end

  describe '.lottery_date_order' do
    subject { described_class.lottery_date_order }

    let!(:event1) { create :event, lottery_date: Date.yesterday }
    let!(:event2) { create :event, lottery_date: Date.tomorrow }
    let!(:event3) { create :event, lottery_date: Date.today }

    it { is_expected.to eq [event2, event3, event1] }
  end
end
