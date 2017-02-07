# frozen_string_literal: true
begin
  require "rubocop/rake_task"

  task :rubocop do
    RakeNBake::Baker.log_step "Running Rubocop"
    RuboCop::RakeTask.new
  end

rescue LoadError
  task :rubocop do
    abort "Rubocop rake task is not available (you're probably in a production environment)"
  end
end
