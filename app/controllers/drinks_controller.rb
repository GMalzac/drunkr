class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  private

  def drink_params
    params.require(:drink).permit(:id)
  end
end
