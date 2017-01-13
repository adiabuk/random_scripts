#!/usr/bin/env ruby

my_hash = {
           'dev-' => 'dev',
           '.qa' => 'qa',

          }
current_hostname = 'dev-mon-1.localdomain'

for k, v in my_hash

  if current_hostname.include? k
    puts "Machine is in the " + v + " environment"
    break
  end

end

puts "#####################################################################"
puts my_hash['.qa']
