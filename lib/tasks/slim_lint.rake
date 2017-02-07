# frozen_string_literal: true
begin
  require "slim_lint/rake_task"

  task :slim_lint do
    RakeNBake::Baker.log_step "Running Slim Lint"
    SlimLint::RakeTask.new
  end

rescue LoadError
  desc "slim_lint rake task not available"
  task :slim_lint do
    abort "slim_lint rake task is not available in production"
  end
end
