# frozen_string_literal: true
begin
  require "scss_lint/rake_task"

  RakeNBake::Baker.log_step "Running SCSS Lint"

  SCSSLint::RakeTask.new do |t|
    t.files = %w(app/assets)
  end
rescue LoadError
  desc "SCSS lint not available in production"
  task :scss_lint do
    abort "SCSS lint not available in production"
  end
end
