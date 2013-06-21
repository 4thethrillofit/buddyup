class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    @teams = Team.all
  end

  def create
    debugger
    # params[:person][:team][:name]
    @person = Person.new(params[:person])
    if @person.save
      flash[:success] = "Person successfully created."
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    Person.destroy(params[:id])
    flash[:success] = 'Person successfully deleted.'
    redirect_to request.referer
  end
end