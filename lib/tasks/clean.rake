# frozen_string_literal: true
require "rake/clean"

RakeNBake::Baker.log_step "Clean up test files"

CLEAN.include "log/**"
CLEAN.include "tmp/cache/**"
CLEAN.include "tmp/miniprofiler/**"
CLEAN.include "tmp/capybara/**"
CLEAN.exclude "tmp/cache/.gitkeep"
CLEAN.exclude "tmp/pids/.gitkeep"
