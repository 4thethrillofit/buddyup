class PeoplePresenter
  def initialize(people, template)
    @people = people
    @template = template
  end

  #draper gem pattern
  def h
    @template
  end

  # def name(person)
  #   # @people.map do |person|
  #     person.name
  #   # end
  # end
end