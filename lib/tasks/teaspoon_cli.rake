# frozen_string_literal: true
begin
  require "teaspoon"
  desc "Run javascript tests using teaspoon's CLI tool (scss-lint breaks the built in task)"
  task :teaspoon_cli do
    raise unless system "RAILS_ENV=test bundle exec teaspoon"
  end

rescue LoadError
  desc "Teaspoon is not available in production"
  task :teaspoon_cli do
    abort "Teaspoon is not available in production"
  end
end
