# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Bojack Horseman' }
    email { 'bojack@gmail.com' }
    job_title { 'Actor' }
    admission_date { Date.today }
  end
end
