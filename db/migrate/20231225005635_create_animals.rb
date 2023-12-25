# frozen_string_literal: true

class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name, :wikipedia_link
      t.text :wikipedia_description

      t.timestamps
    end
  end
end
