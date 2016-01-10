#!/usr/bin/ruby
require 'redis'
usage = "Usage: ./add-to-redis.rb [key] [value]"

if ARGV[0] == "--help" or ARGV[0] == '-h'
  puts usage
  exit
end

if ARGV.count != 2
  abort("ERROR: must provide a key and a value\n#{usage}")
else
  KEY   = ARGV[0]
  VALUE = ARGV[1]

  r = Redis.new
  r.set(KEY,VALUE)
end
