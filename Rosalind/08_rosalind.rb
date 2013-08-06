#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Translating RNA into Protein \" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

content = File.read("rosalind_prot.txt")
hash = {}
File.read("RNA_code_table.txt").split("\n").each do |l|
	code = l.split("\t")
	hash[code[0]] = code[1]
end

i = 0
str = []
protein = []
while i+2 <= content.length do
	pro = []
	for j in i..i+2
		pro << content[j]
	end
	i += 3
	str << pro.join("")
end

for n in 0..str.length
	if hash.key?(str[n]) && hash[str[n]] != "Stop"
		protein << hash[str[n]]
	end
end
p protein.join("")