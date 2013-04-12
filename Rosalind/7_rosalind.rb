#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Counting Point Mutations\" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

content = File.read("rosalind_hamm.txt")
so = content.split("\n")
c = 0
oldl = so[0].split("")
newl = so[1].split("")
for i in 0..oldl.length
	c += 1 if oldl[i] != newl[i]
end
p c
