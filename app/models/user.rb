# frozen_string_literal: true

class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :job_title, presence: true
  validates :admission_date, presence: true
end
