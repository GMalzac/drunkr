class UserDrinksController < ApplicationController
  before_action :set_user_drink, only: [:edit, :destroy]

  def index
    @user_drinks = UserDrink.where(user_id: current_user).order(created_at: :desc)
    @drunk_level = total_alcohol_blood_rate(@user_drinks, Time.now)
    @drunk_status = drunk_status(@drunk_level)
    @weekly_drinks = weekly_drinks(@user_drinks)
  end

  def show
  end

  def new

  end

  def create
    user_id = current_user.id
    @user_drink = UserDrink.new(user_id: user_id, drink_id: params[:id])
    @user_drink.save
    redirect_to user_drinks_path
  end

  def edit
  end

  def destroy
    @user_drink.destroy
    redirect_to user_drinks_path
  end

  def total_alcohol_blood_rate(user_drinks, time)
    h24_drinks(user_drinks)
    @drunk_level = 0
    @day_drinks.each do |user_drink|
      @drunk_level += alcohol_blood_rate_per_drink(user_drink, time)
    end
    @drunk_level
  end

  def drunk_status(drunk_level)
    case drunk_level
    when 5.to_f...7.to_f
      @drunk_status = "very_bad"
    when 3.to_f...5.to_f
      @drunk_status = "toasted"
    when 2.to_f...3.to_f
      @drunk_status = "drunk"
    when 1.to_f...2.to_f
      @drunk_status = "very_tipsy"
    when 0.5.to_f...1.to_f
      @drunk_status = "tipsy"
    when 0.0001.to_f...0.5.to_f
      @drunk_status = "OK"
    when drunk_level == 0.to_f
      @drunk_status = "sober"
    else
      @drunk_status = "dead"
    end
  end

  def alcohol_blood_rate_per_drink(user_drink, time)
    elapsed_time = time - user_drink.created_at
    # Erik Matteo Prochet Widmark formula: 0.8 is ethanol density, 0.7 the diffusion coefficient for male, 0.6 for female,72 is weight in kg
    climax = user_drink.drink.volume * user_drink.drink.alcohol_rate / 10 * 0.8  / (0.7 * 72)
    #calculate how much alcohol has been integrated to the body (drink is drunk in 15mn, 30mn to reach the top => 2700 s)
    if elapsed_time <= 2700
      # 0.8 is ethanol density, 0.7 the diffusion coefficient for male, 0.6 for female,72 is weight in kg
      climax * (elapsed_time / 2700)
    else
      [0, climax - ((0.15 * (elapsed_time - 2700) / 3600))].max
    end
  end

  def h24_drinks(user_drinks)
    @day_drinks = user_drinks.where("created_at > ?", 1.days.ago)
    @day_drinks_counter = user_drinks.where("created_at > ?", 1.days.ago).length
  end



  def weekly_drinks(user_drinks)
    @weekly_drinks = user_drinks.where("created_at > ?", 7.days.ago)
  end

  private

  def set_user_drink
    @user_drink = UserDrink.find(params[:id])
  end

end


