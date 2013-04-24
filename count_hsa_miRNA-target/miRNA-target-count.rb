#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} count how many DBs the miRNA-target in 
Author: Jiahui Liu <beckyljh@gmail.com>,2013/04/23"

hash = Hash.new(0)
File.read("top_third.txt").split("\n").each do |l|
	str = []
	str = l.split("\t")
	str[0] = str[0].sub("_star","*")
	str[0] = str[0].sub("star","*")		
	str[0] = str[0].sub("-star","*")
	str[0] = str[0].sub("mir","miR")

	k = str[0]+"\t"+str[1]
	if hash[k] == 0
		hash[k] = str[2]
	else
		hash[k] = hash[k].to_s+";"+str[2]
	end
end

file = File.new("top_third_count4.txt","w")
hash.each do |k,v|
	dbhash = {}
	strname = []
	vstr = v.split(";")
	for i in 0..vstr.length-1 
		dbname = vstr[i].split(" ")
		dbhash[dbname[0]] = ""
	end
	dbhash.each do |kk,vv|
		if strname == []
			strname << kk
		else
			strname << kk
		end
	end
	file.puts "#{k}\t#{strname.join(";")}\t#{dbhash.size}"
end

puts "finish"
file.close