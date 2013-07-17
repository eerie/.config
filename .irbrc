require 'ap'

if Kernel.const_defined? :IRB
  unless IRB.version.include?('DietRB')
    IRB::Irb.class_eval do
      def output_value
        ap @context.last_value
      end
    end
  else # MacRuby
    IRB.formatter = Class.new(IRB::Formatter) do
      def inspect_object(object)
        object.ai
      end
    end.new
  end
end
