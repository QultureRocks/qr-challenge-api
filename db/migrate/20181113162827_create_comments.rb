# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.string :value, null: false

      t.timestamps
    end
  end
end
