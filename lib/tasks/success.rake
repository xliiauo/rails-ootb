# frozen_string_literal: true
task :success do
  colours = ["\e[31m", "\e[33m", "\e[32m", "\e[34m", "\e[35m"].cycle

  print "\n                       "

  "BUILD SUCCESSFUL!".chars.zip(colours).each do |char, colour|
    print colour + char + " "
  end

  print "\n\n"
end
