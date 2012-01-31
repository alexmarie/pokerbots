#! /usr/bin/ruby

file = ARGV[0]
time = Time.now

lines = File.new(file).readlines
lines = lines[3..-1] #remove headers

lines.each do |line|
  if match = /Hand \#(\w+)/.match(line)
    hand = match[1]
    puts "FullTiltPoker Game \##{hand}: Table Gateway (2 max) - $1/$2 - No Limit Hold'em - #{time.strftime('%H:%M:%S ET - %Y/%m/%d')}"
    time += 1
  else
    line.sub! /\((\d+)\)/, '($\1)' if line =~ /Seat/
    line.sub! /(\d+)/, '$\1' unless line =~ /Dealt|Seat|button/
    puts line.strip
    puts '*** HOLE CARDS ***' if line =~ /button/
  end
end

