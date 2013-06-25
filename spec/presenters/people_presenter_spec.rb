require 'spec_helper'

describe PeoplePresenter do
  let(:person1) { FactoryGirl.create(:person) }
  let(:person2) { FactoryGirl.create(:person) }
  let(:people) { [person1, person2] }
  subject(:presenter) { PeoplePresenter.new(people, view) }

  describe '#person_presenters' do
    it 'should return an array of PersonPresenter object' do
      presenter.person_presenters.sample.should be_an_instance_of(PersonPresenter)
    end
  end

  describe '#names' do
    it 'should return an array of capitalized names' do
      presenter.names.should eq [person1.name.titleize, person2.name.titleize]
    end
  end

  describe '#emails' do
    it 'should return an array of emails' do
      presenter.emails.should eq [person1.email, person2.email]
    end
  end

end