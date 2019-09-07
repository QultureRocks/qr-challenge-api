# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#
# Indexes
#
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :comment do
    user { create(:user) }
    value { 'Bojack is awesome!' }
  end
end
