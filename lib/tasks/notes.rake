# frozen_string_literal: true
Rails.application.configure do
  config.annotations.directories << "spec" << "features" << "factories" << "app/views"
  config.annotations.register_extensions("feature") do |tag|
    /#\s*(#{tag}):?\s*(.*)$/
  end
  config.annotations.register_extensions("slim") do |tag|
    %r{/\s*(#{tag}):?\s*(.*)$}
  end
end
