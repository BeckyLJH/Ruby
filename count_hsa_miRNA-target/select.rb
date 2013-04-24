#!usr/bin/env ruby
#coding:utf-8

usage = "{#{$0} select top100 and top1/3 miRNA-target relation
Author:Jiahui Liu <beckyljh@gmail.com>,2013/04/23.}"

outFile = File.new("top_third3.txt","w")
outFile.puts "MICRORNA\tGENE_SYMBOL\tSOURCE\tRANK"
File.read("test.txt").split("\n").each do |l|
	str = l.split("\t")
	if str[3] == "top_third" || "top_1_percent"
		outFile.puts l
	end
end
puts "finish"
outFile.close