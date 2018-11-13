# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :value, presence: true

  scope :order_by_created_at, -> { order(created_at: :desc) }
end
