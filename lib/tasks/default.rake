# frozen_string_literal: true
Rake::Task[:default].prerequisites.clear if Rake::Task.task_defined? :default

task :default => %i(
  clean
  db:migrate
  checks
  spec
  stats
  notes
  success
)

# teaspoon_cli
# bake:coverage:check_specs
# cucumber
# cucumber:wip
