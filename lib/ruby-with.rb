require "ruby-with/version"

module With
  
  def with context, &block
    context.instance_exec(self, &block)
  end
  
end