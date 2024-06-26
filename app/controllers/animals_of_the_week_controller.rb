# frozen_string_literal: true

class AnimalsOfTheWeekController < ApplicationController
  def show
    @animal = Animal.find_by(id: AnimalOfTheWeek.current)
    render "animals/show"
  end
end
