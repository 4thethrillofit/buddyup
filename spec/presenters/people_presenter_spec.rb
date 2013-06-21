require 'spec_helper'

describe PeoplePresenter do
  let(:person1) { FactoryGirl.create(:person) }
  let(:person2) { FactoryGirl.create(:person) }
  let(:people) { [person1, person2] }
  subject(:presenter) { PeoplePresenter.new(people, view) }

end