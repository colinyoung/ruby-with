require "ruby-with/version"

module With
  
  def with context, start_set_hash={}, &block
    context.instance_eval do
      def set(hash)
        hash.map {|k,v| self.__send__("#{k}=", v) }
      end
      
      def <=(hash)
        set(hash)
      end
    end
    
    context.send :set, start_set_hash
    
    context.instance_exec(self, &block)
    
    class << context
      remove_method :set
      remove_method :<=
    end
  end
  
end