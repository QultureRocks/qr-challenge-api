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

class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :job_title, presence: true
  validates :admission_date, presence: true

  scope :order_by_name, -> { order(name: :asc) }
end
