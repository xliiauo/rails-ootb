# frozen_string_literal: true
Rake::Task[:default].prerequisites.clear if Rake::Task.task_defined? :default

task :default => %i(
  clean
)


# checks
# teaspoon_cli
# spec
# bake:coverage:check_specs
# cucumber
# cucumber:ipcontrol
# cucumber:wip
# stats
# notes
# success
