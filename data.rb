# Raise an ArgumentError with the given message.
def arg_err(msg)
  raise ArgumentError.new(msg)
end

# Class to build and return a data type, similar to a struct but immutable.
class Data
  ERR_ARGS_LEN  = "wrong number of args provided"
  ERR_SYM_ARGS  = "all args must be Symbols"
  ERR_NAMED_ARG = "missing named arg"
  
  def self.define(*args, immutable: true)
    arg_err(ERR_ARGS_LEN) unless args.length > 0
    arg_err(ERR_SYM_ARGS) unless args.all? { |arg| arg.is_a? Symbol }
    
    Class.new do
      args.each do |arg|
        if immutable
          attr_reader arg.to_sym
        else
          attr_accessor arg.to_sym
        end
      end
      
      define_method :initialize do |*values|
        case values.length
        when 1
          values = values.first # arr -> hash
          arg_err(ERR_ARGS_LEN) unless values.is_a? Hash
          arg_err(ERR_ARGS_LEN) unless values.length == args.length
          
          args.each do |arg|
            value = values[arg.to_sym] || raise(arg_err(ERR_NAMED_ARG))
            instance_variable_set "@#{arg}".to_sym, value
          end
        when args.length
          args.zip(values) { |arg, value| instance_variable_set "@#{arg}".to_sym, value }
        else
          arg_err(ERR_ARGS_LEN)
        end
      end
    end
  end
end
