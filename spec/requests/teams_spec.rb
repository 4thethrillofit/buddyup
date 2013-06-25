require 'spec_helper'

describe "Teams" do
  let(:member) { create(:person) }
  subject(:team) { create(:team, name: "Test Team") }

  describe "POST /teams" do
    it "creates team" do
      visit new_team_path
      fill_in 'team_name', :with => "Test Team"
      click_button 'Submit'
      page.should have_content("Team successfully created.")
      page.should have_content("Team: Test Team")
    end

    it 'creates new members' do
      visit team_path(team)
      fill_in 'team_member_email', :with => member.email
      click_button 'Submit'
      page.should have_content member.email
    end

    it 'removes existing member' do
      visit team_path(team)
      fill_in 'team_member_email', :with => member.email
      click_button 'Submit'
      click_link 'Remove Member'
      page.should have_content 'Member successfully removed from the team.'
      page.should_not have_content member.email
    end

    it 'deletes team' do
      visit team_path(team)
      click_link 'Delete Team'
      page.should have_content("Team successfully deleted.")
      page.should_not have_content("Test Team")
    end
  end
end
