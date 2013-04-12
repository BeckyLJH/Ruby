#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Translating RNA into Protein \" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

contents = File.read("rosalind_prot.txt")

codon_table = {}
File.read("RNA_code_table.txt").split("\n").each do |l|
	code = l.split("\t")
	codon_table[code[0]] = code[1]
end
codon_table.each do |k,v|
	if v == "Stop"
		codon_table[k] = ""
	end
end
puts contents.chomp.gsub(/.../, codon_table )