#!/usr/bin/ruby
require 'redis'
usage = "Usage: ./list-all-in-redis.rb"

if ARGV[0] == "--help" or ARGV[0] == '-h'
  puts usage
  exit
end

r = Redis.new

# let's find out how many values are in the db
info  = r.info
db0   = info['db0']
count = /keys=(\d+).*/.match(db0)[1]  # matches first capture group

if count == 0
  abort("no values found")
else
  puts "found #{count} values"

  r.scan_each(match: '*') do |key|
    value = r.get(key)
    puts "#{key}: #{value}"
  end
end
