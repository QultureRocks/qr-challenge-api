class Comment < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validares :value, presence: true
end
