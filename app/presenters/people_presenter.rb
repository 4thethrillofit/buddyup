class PeoplePresenter < BasePresenter
  presents :people

  def names
    people.map { |person| PersonPresenter.new(person, @template).name }
  end

  def emails
    people.map { |person| PersonPresenter.new(person, @template) }
  end
end