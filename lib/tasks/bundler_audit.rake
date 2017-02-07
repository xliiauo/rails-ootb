# frozen_string_literal: true
begin
  require "bundler/audit/cli"

  desc "Updates the ruby-advisory-db and runs audit"
  task :bundler_audit do
    RakeNBake::Baker.log_step "Running Bundler Audit"
    %w(update check).each do |command|
      Bundler::Audit::CLI.start [command]
    end
  end
rescue LoadError
  task :bundler_audit do
    abort "bundler_audit rake task is not available in production"
  end
end
