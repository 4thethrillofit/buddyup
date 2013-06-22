class TeamAssignmentsController < ApplicationController
  def create
    @team = Team.find_by_id(params[:team_id])
    @member = Person.find_by_email(params[:team][:member_email])
    if @member
      flash[:success] = "Team member successfully added!"
      @team.members << @member
      redirect_to team_path(@team)
    else
      flash[:warning] = "Person does not exist :("
      redirect_to request.referrer
    end
  end

  def destroy
    team = Team.find_by_id(params[:team_id])
    team.members.destroy(params[:id])
    flash[:success] = "Member successfully removed from the team."
    redirect_to request.referrer
  end
end