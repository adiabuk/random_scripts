#!/usr/bin/env ruby


##var = "https://captain-datacentred-sal01.service"
### https://captain-datacentred-sal01.public-monolith.mdtp/instances/
###"1,2,,3,4,,".split(',') 
##x = var.split('.')
##x.shift()
##y = x.join('.')
##z = y.split('/')
##puts z[0]


##m1 = /Ruby/.match("The future is Ruby")  
##puts m1.class  # it returns MatchData  
##m2 = "The future is Ruby" =~ /Ruby/  
##puts m2          # it returns 14  
##
### p064regexp.rb  
##string = "My phone number is (123) 555-1234."  
##phone_re = /\((\d{3})\)\s+(\d{3})-(\d{4})/  
##m = phone_re.match(string)  
##unless m  
##  puts "There was no match..."  
##  exit  
##end  
##print "The whole string we started with: "  
##puts m.string  
##print "The entire part of the string that matched: "  
##puts m[0]  
##puts "The three captures: "  
##3.times do |index|  
##  puts "Capture ##{index + 1}: #{m.captures[index]}"  
##end  
##puts "Here's another way to get at the first capture:"  
##print "Capture #1: "  
##puts m[1]  
##
url_re = /[https?:\/\/]?.*?\.(.*?)\//
string = "https://captain-datacentred-sal01.public-monolith.mdtp/instances/"
string = "http://captain.service/instances/"

m = url_re.match(string)
puts m[1]
