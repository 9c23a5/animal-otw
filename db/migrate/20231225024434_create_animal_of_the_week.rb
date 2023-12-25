# frozen_string_literal: true

class CreateAnimalOfTheWeek < ActiveRecord::Migration[7.1]
  def change
    create_table :animal_of_the_weeks do |t|
      t.timestamp :date_start
      t.timestamp :date_end

      t.timestamps
    end
  end
end
