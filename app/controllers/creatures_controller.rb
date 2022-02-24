class CreaturesController < ApplicationController
  def index
    @users = User.all
    @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
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
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :category, :breed, :super_power, :needed_years_magic)
  end
end
