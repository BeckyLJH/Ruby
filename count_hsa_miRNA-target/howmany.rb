#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} count the result
Author: Jiahui Liu <beckyljh@gmail.com,2013/04/23>"

count = 0
File.read("top_third_count2.txt").split("\n").each do |l|
	str = l.split("\t")
	if str[3].to_f >= 7
		puts l
		count = count +1 
	end
  
end
puts count
puts "finish"