# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { described_class.new }

  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:value) }
  end
end
