require 'rails_helper'

RSpec.describe LotoEvent, type: :model do
  describe 'リレーション' do
    it { is_expected.to have_many :loto_six_numbers }
    it { is_expected.to have_many :loto_seven_numbers }
  end

  describe 'バリデーション' do
    describe 'uniqueness' do
      subject { build :loto_event, :loto_six }

      it { is_expected.to validate_uniqueness_of(:lottery_id).scoped_to(:lottery_type) }
    end

    describe 'presence' do
      it { is_expected.to validate_presence_of :lottery_id }
      it { is_expected.to validate_presence_of :lottery_date }
      it { is_expected.to validate_presence_of :lottery_type }
    end

    describe 'numericality' do
      it { is_expected.to validate_numericality_of(:lottery_id).only_integer.is_greater_than(0) }
    end
  end

  describe '.lottery_date_order' do
    subject { described_class.lottery_date_order }

    let!(:event1) { create :loto_event, :loto_six, lottery_date: 2.days.ago }
    let!(:event2) { create :loto_event, :loto_six, lottery_date: 2.days.since }
    let!(:event3) { create :loto_event, :loto_six, lottery_date: Date.today }

    it { is_expected.to eq [event2, event3, event1] }
  end
end
