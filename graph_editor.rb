require_relative 'lib/commandline'

commandline = CommandLine.new
commandline.welcome

loop do
  print "> "
  commandline.execute(gets)
end