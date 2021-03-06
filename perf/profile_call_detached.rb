stage = Stage.new

evaluation = Concurrently::Evaluation.current
conproc = concurrent_proc{ evaluation.resume! }

result = stage.profile(seconds: 1) do
  conproc.call_detached
  await_resume!
end

puts "#{result[:iterations]} executions in #{result[:time].round 4} seconds"