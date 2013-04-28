#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Finding a Motif in DNA \" in Rosalind
Author: bakamono <http://rosalind.info/users/bakamono/>"

content = File.read("DNA.txt").split("\n")
dna = content[0]
ss = content[1]
offset = 0
r = []
## 需再探索
while i = dna.index(ss, offset)
puts i
  offset = (r << i + 1).last
  # p offset
end
puts r.join(' ')

# p "dogandcatandcat".index("cat")

