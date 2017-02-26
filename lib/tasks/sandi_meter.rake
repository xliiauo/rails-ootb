# frozen_string_literal: true
begin
  desc "Run sandi_meter against the code"
  task :sandi_meter do
    puts "Running Sandi_meter..."
    system "sandi_meter -d" or raise
  end
rescue LoadError
  task :sandi_meter do
    abort "Sandi-meter rake task is not available (you're probably in a production environment)"
  end
end
