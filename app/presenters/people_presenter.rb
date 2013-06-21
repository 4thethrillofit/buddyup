class PeoplePresenter < BasePresenter
  attr_reader :person_presenters
  def initialize(people, template)
    # super(people, template)
    @person_presenters = people.map { |person| PersonPresenter.new(person, template) }
  end

  def names
    person_presenters.map { |person| person.name }
  end

  def emails
    person_presenters.map { |person| person.email }
  end
end