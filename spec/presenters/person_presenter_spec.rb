require 'spec_helper'

describe PersonPresenter do
  let(:person) { FactoryGirl.create(:person, name: 'fei', email: 'fei@g.com') }
  subject(:presenter) { PersonPresenter.new(person, view) }

  it 'should capitalize the name' do
    presenter.name.should eq 'Fei'
  end

  it 'should return the email' do
    presenter.email.should eq 'fei@g.com'
  end

end