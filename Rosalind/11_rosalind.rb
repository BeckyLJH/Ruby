#!/usr/bin/env ruby
#coding:utf-8

usage = "#{$0} Sovle the problem \" Consensus and Profile\"
Author: Jiahui Liu <beckyljh@gmail.com>;2013/04/26"

arr = Array.new(995) { Array.new(995) }
all = Array.new(995) { Array.new(995) }

file = open("DNA.txt")
outfile = File.new("result.txt","w")rosalind_cons

File.read(file).split(">").each do |block|
	if block == ""
		next 
	else
		str = []
		str2 = []
		str = block.split("\n") 
		for i in 1..str.length-1
			str2.push(str[i])
		end

		str3 = str2.join("").split("")
		puts str3.length
		for i in 0..str3.length-1
			arr[i] << str3[i]
		end 
	end
	
end

a = []
c = []
g = []
t = []

for i in 0..arr.length-1
	a << arr[i].count("A")
	all[i] << arr[i].count("A").to_s+"A"
	c << arr[i].count("C")
	all[i] << arr[i].count("C").to_s+"C"
	g << arr[i].count("G")
	all[i] << arr[i].count("G").to_s+"G"
	t << arr[i].count("T")
	all[i] << arr[i].count("T").to_s+"T"
end

res = []
for i in 0..all.length-1
	%w(A C G T).map { |c| res << c if all[i].compact.max.include?(c)}
end
outfile.puts res.join("")
outfile.puts "A: "+a.join(" ")
outfile.puts "C: "+c.join(" ")
outfile.puts "G: "+g.join(" ")
outfile.puts "T: "+t.join(" ")