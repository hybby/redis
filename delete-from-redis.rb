#!/usr/bin/ruby
require 'redis'
usage = "Usage: ./delete-from-redis.rb [key] [value]"

if ARGV[0] == "--help" or ARGV[0] == '-h'
  puts usage
  exit
end

if ARGV.count != 1
  abort("ERROR: must provide a key to remove\n#{usage}")
else
  KEY = ARGV[0]

  r = Redis.new
  VALUE = r.get(KEY)

  # only remove if the key exists and has a value
  if VALUE
    r.del(KEY)
  else
    abort("ERROR: key \"#{KEY}\" does not exist")
  end
end
