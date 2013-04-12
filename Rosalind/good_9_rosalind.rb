#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Combing Through the Haystack \" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

content = File.read("DNA.txt").split("\n")
dna = content[0]
ss = content[1]
p content[0]
offset = 0
r = []
## 需再探索
while i = dna.index(ss, offset)
  offset = (r << i + 1).last
  p offset
end
puts r.join(' ')

p "dogandcatandcat".index("cat")

