require 'spec_helper'

describe "People" do
  describe "GET /people" do
    it "creates new person without team name" do
      visit new_person_path
      fill_in 'person_name', :with => 'Joe Test'
      fill_in 'person_email', :with => 'joe@gmail.com'
      click_button 'Submit'
      page.should have_content "Person successfully created."
    end

    it "creates new person with autocomplete team name", :js => true do
      team = create(:team, name: 'test1')
      visit new_person_path
      fill_in 'person_name', :with => 'Joe Test'
      fill_in 'person_email', :with => 'joe@gmail.com'
      fill_in 'team-tags', :with => 'tes'
      page.should have_content 'test1'
    end

    it "creates new person with team name", :js => true do
      team = create(:team, name: 'test1')
      visit new_person_path
      fill_in 'person_name', :with => 'Joe Test'
      fill_in 'person_email', :with => 'joe@gmail.com'
      fill_in 'team-tags', :with => 'test1'
      click_on 'test1'
      click_button 'Submit'
      visit team_path(team)
      page.should have_content "joe@gmail.com"
    end
  end
end
