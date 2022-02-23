class CreaturesController < ApplicationController
  def index
    @users = User.all
    @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
