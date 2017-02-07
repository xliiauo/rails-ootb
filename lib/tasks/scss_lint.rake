# frozen_string_literal: true
begin
  require "scss_lint/rake_task"

  task :scss_lint do
    RakeNBake::Baker.log_step "Running SCSS Lint"

    SCSSLint::RakeTask.new do |t|
      t.files = %w(app/assets)
    end
  end
rescue LoadError
  desc "SCSS lint not available in production"
  task :scss_lint do
    abort "SCSS lint not available in production"
  end
end
