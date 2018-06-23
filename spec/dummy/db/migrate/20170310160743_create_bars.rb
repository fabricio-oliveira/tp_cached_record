# frozen_string_literal: true
class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :uuid
      t.string :other
      t.timestamps null: false
    end
    add_index :bars, :uuid, unique: true
  end
end
