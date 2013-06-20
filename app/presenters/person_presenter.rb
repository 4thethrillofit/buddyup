class PersonPresenter < BasePresenter
  presents :person

  def name
    person.name.capitalize
  end

end