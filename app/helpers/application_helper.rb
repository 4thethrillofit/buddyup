module ApplicationHelper
  #allows view templates to take in blocks and pass it on to presenter object
  def present(object, klass=nil)
    klass ||= "#{object.class}Presenter".constantize
    debugger
    #self is the template object
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
