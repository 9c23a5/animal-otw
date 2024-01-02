# frozen_string_literal: true

class AddIndexToAnimal < ActiveRecord::Migration[7.1]
  def change
    add_index :animals, :name, unique: true
  end
end
