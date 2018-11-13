# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user { create(:user) }
    value { 'Bojack is awesome!' }
  end
end
