class ApplicationController < ActionController::Base
  protect_from_forgery

  def about
    render 'layouts/about'
  end
private
  # allowing access to presenters in the controller
  def present(object, klass=nil)
    klass ||= "#{object.class}".constantize
    klass.new(object, view_context)
  end
end
