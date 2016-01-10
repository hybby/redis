#!/usr/bin/ruby
require 'redis'
usage = "Usage: ./get-from-redis.rb [key]"

if ARGV[0] == "--help" or ARGV[0] == '-h'
  puts usage
  exit
end

if ARGV.count != 1
  abort("ERROR: must provide a key to get\n#{usage}")
else
  KEY = ARGV[0]
 
  r = Redis.new
  VALUE = r.get(KEY)

  if VALUE
    puts VALUE
  else
    abort("ERROR: no value for key \"#{KEY}\"")
  end
end
