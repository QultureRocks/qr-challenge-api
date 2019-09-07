# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id             :bigint(8)        not null, primary key
#  admission_date :date             not null
#  email          :string           not null
#  job_title      :string           not null
#  name           :string           not null
#  photo_url      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:job_title) }
    it { is_expected.to validate_presence_of(:admission_date) }
  end
end
