class PersonPresenter
  def initialize(person, template)
    @person = person
    @template = template
  end

  def h
    @template
  end

  def name
    @person.name.capitalize
  end

end