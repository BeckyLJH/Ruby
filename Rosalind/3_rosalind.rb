#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Complementing a Strand of DNA\" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

file = "rosalind_revc.txt"
result = "result.txt"
outfile = File.new(result,"w")
File.read(file).split("\n").each do |l|	
	str = []
	str = l.split("")
	for i in 0..str.length do
		if str[i] == "T"
			str[i] = str[i].sub("T","A")
		elsif str[i] == "A"
			str[i] = str[i].sub("A","T")
		elsif str[i] == "C"
			str[i] = str[i].sub("C","G")
		elsif str[i] == "G"
			str[i] = str[i].sub("G","C")
		end		
	end
	p str.reverse
	outfile.puts str.reverse.first(str.length).join("")
end