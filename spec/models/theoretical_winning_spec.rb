require 'rails_helper'

RSpec.describe TheoreticalWinning, type: :model do
  describe 'uniqueness' do
    subject { build :theoretical_winning }

    it { is_expected.to validate_uniqueness_of(:grade) }
  end

  describe 'presence' do
    it { is_expected.to validate_presence_of :grade }
    it { is_expected.to validate_presence_of :winning }
  end

  describe 'numericality' do
    it { is_expected.to validate_numericality_of(:grade).only_integer.is_greater_than(0).is_less_than(6) }
    it { is_expected.to validate_numericality_of(:winning).only_integer.is_greater_than(0) }
  end
end
