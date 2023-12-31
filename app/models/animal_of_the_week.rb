# frozen_string_literal: true

class AnimalOfTheWeek < ApplicationRecord
  belongs_to :animal

  validates :date_start, presence: true
  validate :only_one_current_animal_of_the_week, unless: :date_end

  def self.current_animal_of_the_week
    find_by(date_end: nil)
  end

  def only_one_current_animal_of_the_week
    nil unless AnimalOfTheWeek.where(date_end: nil).count > 1

    errors.add(:end_date, "Only one current AnimalOfTheWeek allowed")
  end
end
