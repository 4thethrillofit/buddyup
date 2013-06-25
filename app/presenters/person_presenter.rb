class PersonPresenter < BasePresenter
  presents :person

  def name
    person.name.titleize
  end

  def email
    person.email
  end

end