#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} Solve the problem \"Counting DNA Nucleotides\" in Rosalind
Author: Jiahui Liu<beckyljh@gmail.com>"

file = open("rosalind_dna.txt")

a = 0
c = 0
g = 0
t = 0
while text = file.gets do
	text = text.strip()
	str = []
	str = text.split("")
	# p str.length
	for i in 0..str.length do
		if (str[i] == "A")
			a = a + 1
		elsif (str[i] == "C")
			c = c + 1
		elsif (str[i] == "G")
			g = g + 1
		elsif (str[i] == "T")
			t = t + 1
		end
	end
end

p a.to_s + " " + c.to_s + " " + g.to_s + " " + t.to_s