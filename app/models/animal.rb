# frozen_string_literal: true

class Animal < ApplicationRecord
  has_many :animal_of_the_weeks, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  validates :wikipedia_link, format: {with: %r{\Ahttps://en\.wikipedia\.org/wiki/}}, if: :wikipedia_link

  def current_animal_of_the_week?
    animal_of_the_weeks.where(date_end: nil).one?
  end
end
