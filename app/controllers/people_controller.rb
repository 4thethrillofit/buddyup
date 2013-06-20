class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    person = Person.new(params[:person])
    if person.save
      flash[:info] = "Person successfully created."
      redirect_to root_path
    else
      flash[:error] = "There was a problem."
      render 'new'
    end
  end

  def show
    @person = Person.find_by_id(params[:id])
  end

  def destroy
    Person.destroy(params[:id])
    flash[:warning] = 'Person successfully deleted.'
    redirect_to root_path
  end
end
