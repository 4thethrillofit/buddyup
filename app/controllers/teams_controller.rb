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
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def show
    @team = Team.find_by_id(params[:id])
    @team_members = @team.members
  end

  def destroy
    Team.destroy(params[:id])
    flash[:success] = "Team successfully deleted."
    redirect_to root_path
  end

  def send_weekly_pairs
    team = Team.find_by_id(params[:id])
    @pairs = team.generate_weekly_pairs
    @pairs.each do |pair|
      pair.each do |person|
        buddies = pair - [person]
        TeamMemberPairMailer.weekly_pair(person, buddies).deliver
      end
    end
    # redirect_to request.referrer
  end
end