# frozen_string_literal: true
desc "Ensure all views have a breadcrumb specified"
task :check_breadcrumbs do
  RakeNBake::Baker.log_step "Check Breadcrumbs"

  views = Dir["app/views/**/[^_]*.html.slim"]
  layouts = Dir["app/views/layouts/**/*.html.slim"]
  exceptions = ["app/views/pages/home.html.slim"]
  missing_breadcrumbs = (views - layouts - exceptions).select {|path|
    open(path) {|file| file.grep(/^\s*-\s*breadcrumb/).empty? }
  }

  if missing_breadcrumbs.any?
    raise "The following views are missing a breadcrumb: #{missing_breadcrumbs.join(', ')}"
  end
end
