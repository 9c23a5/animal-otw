# frozen_string_literal: true

class AddAnimalRefToAnimalOfTheWeek < ActiveRecord::Migration[7.1]
  def change
    add_reference :animal_of_the_weeks, :animal, null: false, foreign_key: {on_delete: :cascade} # rubocop:disable Rails/NotNullColumn
  end
end
