class BasePresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  #allows children presenter classes to use native object names
  def self.presents(name)
    define_method(name) do
      @object
    end
  end

private
  #any template related methods will be called by the template object
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end