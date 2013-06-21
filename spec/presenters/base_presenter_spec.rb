require 'spec_helper'

describe BasePresenter do
  let(:object) { FactoryGirl.create(:person) }
  subject(:presenter) { BasePresenter.new(object, view) }

  describe '#initialize' do
    it 'should take two arguments' do
      expect { BasePresenter.new }.to raise_error(ArgumentError)
    end
  end

  describe '#object' do
    it 'should return the object' do
      presenter.object.should eq object
    end
  end

  describe '#get_id' do
    it "should return the object's id" do
      presenter.get_id.should eq object.id
    end
  end

  describe 'BasePresenter#presents' do
    it 'should return the object' do
      cow = BasePresenter.presents(:cow)
      presenter.cow.should eq object
    end
  end

end