require 'rails_helper'

RSpec.describe LotoSixNumber, type: :model do
  describe 'リレーション' do
    it { is_expected.to belong_to(:loto_six_event).required }
  end

  describe 'バリデーション' do
    describe 'uniqueness' do
      subject { build :loto_six_number }

      it { is_expected.to validate_uniqueness_of(:lottery_number).scoped_to(:loto_six_event_id) }
      it { is_expected.to validate_uniqueness_of(:priority).scoped_to(:loto_six_event_id) }
    end

    describe 'presence' do
      it { is_expected.to validate_presence_of :lottery_number }
      it { is_expected.to validate_presence_of :priority }
    end

    describe 'numericality' do
      it { is_expected.to validate_numericality_of(:lottery_number).only_integer.is_greater_than(0).is_less_than(44) }
      it { is_expected.to validate_numericality_of(:priority).only_integer.is_greater_than(0).is_less_than(7) }
    end
  end

  describe '.priority_order' do
    subject { described_class.priority_order }

    let!(:number1) { create :loto_six_number, priority: 3 }
    let!(:number2) { create :loto_six_number, priority: 1 }
    let!(:number3) { create :loto_six_number, priority: 2 }

    it { is_expected.to eq [number2, number3, number1] }
  end
end
