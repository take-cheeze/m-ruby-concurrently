# @private
# @api mruby
#
# mruby does not support Proc.new without a block. We have to re-implement the
# following methods with an explicit block argument.
module Kernel
  def concurrently(*args, &block)
    Concurrently::Proc.new(&block).call_detached! *args
  end

  def concurrent_proc(evaluation_class = Concurrently::Proc::Evaluation, &block)
    Concurrently::Proc.new(evaluation_class, &block)
  end
end