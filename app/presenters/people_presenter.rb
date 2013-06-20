class PeoplePresenter < BasePresenter
  presents :people

  def names
    people.map do |person|
      PersonPresenter.new(person, @template).name
    end
  end
end