# Given a clock time in hh:mm format, determine, to the nearest degree,
# the angle between the hour and the minute hands.

p 'Enter time:'
time = ARGV[0] #STDIN.gets.chomp
if(time)
  h, m = time.split(':').collect(&:to_i)
  mins_deg = m * 6
  p mins_deg
  hour_deg = h * 30 + 30 * (m/60.0)
  p hour_deg
  angle = mins_deg - hour_deg
  p angle.abs
end
