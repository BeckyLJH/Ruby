#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} delete repeated data
Author:Jiahui Liu <beckyljh@gmail.com>,2013/04/23.}"

hash = {}
outFile = File.new("norepeat_top_1_percent.txt","w")
File.read("top_1_percent.txt").split("\n").each do |l|
	str = l.split("\t")
	str[0] = str[0].sub("_star","*")	
	str[0] = str[0].sub("star","*")		
	str[0] = str[0].sub("-star","*")
	str[0] = str[0].sub("mir","miR")
	link = str[0]+"\t"+str[1]
	hash[link] = l
end
hash.each do|k,v|
	outFile.puts k
end
puts "finish"
outFile.close
