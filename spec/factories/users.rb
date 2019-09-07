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

FactoryBot.define do
  factory :user do
    name { 'Bojack Horseman' }
    email { 'bojack@gmail.com' }
    job_title { 'Actor' }
    admission_date { Date.today }
  end
end
