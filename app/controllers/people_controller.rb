class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
  end

  def create
  end

  def show
    @person = Person.find_by_id(params[:id])
  end

  def destroy
  end
end
