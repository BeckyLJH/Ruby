#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Combing Through the Haystack \" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

content = File.read("rosalind_subs.txt").split("\n")
outfile = File.new("result.txt","w")
i = 0
po = []
while i <= content[0].length-content[1].length do
	str = []
	for j in i..i+content[1].length-1
		str << content[0][j]
	end
	if content[1] == str.join("")
		po << i + 1
	end
	i += 1
end
outfile.puts po.join(" ")

