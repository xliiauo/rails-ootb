# frozen_string_literal: true
begin
  require "cucumber"
  require "socket"

  GRID_HOST = "selenium-grid.nat.bt.com"
  EDGE_URL = "https://www.edge.dmc.nat.bt.com/"
  LOCAL_PORT = 3001

  namespace :smoke do
    namespace :dev do
      desc "Run smoke tests against localhost using local browser (default is chrome)"
      task :local, [:profile] do |_t, args|
        set_environment "http://localhost:#{LOCAL_PORT}/", nil
        reset_local_smoke_db
        start_rails_server
        run_cucumber args[:profile]
      end

      desc "Run smoke tests against localhost using Selenium Grid (default is chrome)"
      task :grid, [:profile] do |_t, args|
        set_environment "http://#{local_ip}:#{LOCAL_PORT}/", GRID_HOST
        reset_local_smoke_db
        start_rails_server
        run_cucumber args[:profile]
      end
    end

    namespace :edge do
      desc "Run smoke tests against edge using local browser (note: edge db must be maunally reset)"
      task :local, [:profile] do |_t, args|
        set_environment EDGE_URL, nil
        run_cucumber args[:profile]
      end

      desc "Run smoke tests against edge using Selenium Grid (note: edge db must be maunally reset)"
      task :grid, [:profile] do |_t, args|
        set_environment EDGE_URL, GRID_HOST
        run_cucumber args[:profile]
      end
    end

    def set_environment app_url, grid_host
      Rails.env = "smoke"
      ENV["RAILS_ENV"] = Rails.env
      ENV["APP_URL"] = app_url
      ENV["GRID_HOST"] = grid_host
    end

    def reset_local_smoke_db
      Rake::Task["db:setup"].invoke
    end

    def start_rails_server
      @rails_pid = spawn("rails s -b 0.0.0.0 -p #{LOCAL_PORT}", :out => "/dev/null")
      sleep 5
      at_exit do
        stop_rails_server
      end
    end

    def stop_rails_server
      Process.kill "TERM", @rails_pid
      Process.waitpid @rails_pid
    end

    def local_ip
      UDPSocket.open do |s|
        s.connect GRID_HOST, 1
        s.addr.last
      end
    end

    def run_cucumber profile = "default"
      Dir.chdir("smoke_test") do
        FileUtils.mkdir_p "log/features"
        sh [Cucumber::RUBY_BINARY, "-S", "bundle", "exec", "cucumber", "--format", "html",
            "--out", "log/features/index.html", "--profile", (profile.nil? ? "default" : profile)].join(" ")
      end
    end
  end
rescue LoadError
  desc "smoke rake task not available (cucumber not installed)"
  task :smoke do
    abort "Smoke rake task is not available. Be sure to install cucumber as a gem or plugin"
  end
end
