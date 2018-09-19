class UserDrinksController < ApplicationController
  def index
    @user_drinks = UserDrink.where(user_id: current_user).order(created_at: :desc)
  end

  def show
  end

  def new

  end

  def create
    user_id = current_user.id
    @user_drink = UserDrink.new(user_id: user_id, drink_id: params[:id])
    @user_drink.save
    redirect_to drinks_path
  end

  def destroy
  end

  private

end
