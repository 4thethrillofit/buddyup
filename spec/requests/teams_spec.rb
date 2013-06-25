require 'spec_helper'

describe "Teams" do
  describe "POST /teams" do
    it "creates team" do
      visit new_team_path
      fill_in 'team_name', :with => "Test Team"
      click_button 'Submit'
      page.should have_content("Team successfully created.")
      page.should have_content("Team: Test Team")
    end

    it 'creates new members' do
      team = create(:team)
      person = create(:person)
      visit team_path(team)
      fill_in 'team_member_email', :with => person.email
      click_button 'Submit'
      page.should have_content person.email
    end

    it 'deletes team' do
      team = create(:team, name: "Test Team")
      visit team_path(team)
      click_link 'Delete Team'
      page.should have_content("Team successfully deleted.")
      page.should_not have_content("Test Team")
    end
  end
end
