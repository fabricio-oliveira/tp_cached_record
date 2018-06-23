# frozen_string_literal: true
class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string :uuid
      t.string :other
      t.timestamps null: false
    end
    add_index :foos, :uuid, unique: true
    add_index :foos, :other, unique: true
  end
end
