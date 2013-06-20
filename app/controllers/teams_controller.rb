class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      flash[:success] = "Team successfully created."
      redirect_to request.referrer
    else
      render :new
    end
  end

  def show
    @team = Team.find_by_id(params[:id])
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to request.referrer
  end
end