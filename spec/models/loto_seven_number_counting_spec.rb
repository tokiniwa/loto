require 'rails_helper'

RSpec.describe LotoSevenNumberCounting, type: :model do
  describe 'バリデーション' do
    describe 'uniqueness' do
      subject { build :loto_seven_number_counting }

      it { is_expected.to validate_uniqueness_of(:number) }
    end

    describe 'presence' do
      it { is_expected.to validate_presence_of :number }
      it { is_expected.to validate_presence_of :lottery_number1 }
      it { is_expected.to validate_presence_of :lottery_number2 }
      it { is_expected.to validate_presence_of :lottery_number3 }
      it { is_expected.to validate_presence_of :lottery_number4 }
      it { is_expected.to validate_presence_of :lottery_number5 }
      it { is_expected.to validate_presence_of :lottery_number6 }
      it { is_expected.to validate_presence_of :lottery_number7 }
    end

    describe 'numericality' do
      it { is_expected.to validate_numericality_of(:number).only_integer.is_greater_than(0).is_less_than(38) }
    end
  end

  describe '.number_order' do
    subject { described_class.number_order }

    let!(:number1) { create :loto_seven_number_counting, number: 3 }
    let!(:number2) { create :loto_seven_number_counting, number: 1 }
    let!(:number3) { create :loto_seven_number_counting, number: 2 }

    it { is_expected.to eq [number2, number3, number1] }
  end
end
