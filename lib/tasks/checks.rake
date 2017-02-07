# frozen_string_literal: true
desc "Run various code quality checks"
task :checks => [
  :scss_lint,
  :check_breadcrumbs,
  :slim_lint,
  :rubocop,
  :rails_best_practices,
  :"brakeman:check",
  :bundler_audit,
]

# :jshint,
