class TeamAssignmentsController < ApplicationController
  def create
    @team = Team.find_by_id(params[:team_id])
    @member = Person.find_by_email(params[:team][:member_email])
    if @member
      @team.members << @member
      @team.generate_pair_for_new_member(@member)
      flash[:success] = "Team member successfully added!"
      redirect_to team_path(@team)
    else
      flash[:warning] = "Person does not exist :("
      redirect_to request.referrer
    end
  end

  def destroy
    team = Team.find_by_id(params[:team_id])
    member = Person.find_by_id(params[:id])
    team.members.delete(member)
    team.destroy_related_pairs(member)
    flash[:success] = "Member successfully removed from the team."
    redirect_to request.referrer
  end
end