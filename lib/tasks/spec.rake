# frozen_string_literal: true
begin
  require "rspec/core/rake_task"

  task :rspec do
    RakeNBake::Baker.log_step "Running Rspec"
    RSpec::Core::RakeTask.new :rspec
  end

rescue LoadError
  desc "RSpec is not available in production"
  task :rspec do
    abort "RSpec is not available in production"
  end
end
