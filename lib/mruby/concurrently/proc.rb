module Concurrently
  # @api mruby_patches
  # @since 1.0.0
  #
  # mruby's Proc does not support instance variables. So, whe have to make
  # it a normal class that does not inherit from Proc :(
  class Proc
    def initialize(evaluation_class = Evaluation, &proc)
      @evaluation_class = evaluation_class
      @proc = proc
    end

    def arity
      @proc.arity
    end

    def __proc_call__(*args)
      @proc.call *args
    end
  end
end