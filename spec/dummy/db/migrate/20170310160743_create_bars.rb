# frozen_string_literal: true
class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :other
      t.string :uuid
      t.timestamps null: false
    end
    add_index :bars, :uuid, unique: true
  end
end
