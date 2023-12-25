# frozen_string_literal: true

class AnimalsController < ApplicationController
  def index
    # Gets the animal of the week
    @aotw = AnimalOfTheWeek.current_animal_of_the_week
  end

  def show
    # Gets an animal by ID
  end
end
