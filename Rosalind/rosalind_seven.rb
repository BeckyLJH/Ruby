#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Counting Point Mutations\" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

file = "rosalind_hamm.txt"
so = []
mu = []
File.read(file).split("\n").each do |l|	
	so << l
end
oldl = so[0].split("")
newl = so[1].split("")
for i in 0..oldl.length
	if oldl[i] != newl[i]
		mu << oldl[i]
	end
end
p mu.length
