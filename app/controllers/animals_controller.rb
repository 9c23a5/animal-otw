# frozen_string_literal: true

class AnimalsController < ApplicationController
  def index
    # List all animals
  end

  def show
    # Shows an animal by ID
    @animal = Animal.find(params[:id])
  end
end
