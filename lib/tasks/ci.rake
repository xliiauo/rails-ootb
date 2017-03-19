# frozen_string_literal: true
desc "CI build (run tests; deploy to edge)"
task :ci => %i(default ci:deploy)

namespace :ci do
  desc "Deploy the edge and staging if the build is not a merge request"
  task :deploy do
    if ENV["gitlabActionType"] == "MERGE"
      STDOUT.puts "Skipping deployment because of merge request"
    else
      Rake::Task[:"deploy:edge"].invoke
    end
  end
end
