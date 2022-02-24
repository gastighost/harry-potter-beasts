class CreaturesController < ApplicationController
  def index
    @users = User.all
    @creatures = Creature.all

    if params[:query].present?
      @creatures = Creature.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @creatures = Creature.all
    end
  end

  def show
    @creature = Creature.find(params[:id])
    sum = 0
    @creature.reviews.each do |review|
      sum += review.rating
    end
    @average = (sum.to_f / @creature.reviews.length).round(2)
  end

  def new
    @creature = Creature.new
  end

  def create
    @creature = Creature.new(creature_params)
    @creature.user_id = current_user.id
    if @creature.save
      redirect_to creatures_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @creature = Creature.find(params[:id])
    @creature.destroy

    redirect_to creatures_path
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :category, :breed, :super_power, :needed_years_magic)
  end
end
