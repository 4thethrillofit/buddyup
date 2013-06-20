class PersonPresenter < BasePresenter
  presents :person

  def name
    person.name.capitalize
  end

  def email
    person.email
  end

end