class UserDrinksController < ApplicationController
  def index
    @user_drinks = UserDrink.where(user_id: current_user).order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
