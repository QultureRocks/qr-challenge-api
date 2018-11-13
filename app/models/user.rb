class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :job_title, presence: true
  validates :admission_date, presence: true
end
