#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Transcribing DNA into RNA\" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

file = "rosalind_rna.txt"
File.read(file).split("\n").each do |l|
	for i in 0..l.length do
		l = l.sub("t","T")
		l = l.sub("T","U")
	end
	p l
end
