# frozen_string_literal: true
class CreatePepes < ActiveRecord::Migration
  def change
    create_table :pepes do |t|
      t.string :other
      t.string :uuid
      t.timestamps null: false
    end
    add_index :pepes, :uuid, unique: true
  end
end
