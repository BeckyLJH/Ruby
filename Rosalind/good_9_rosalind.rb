#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Finding a Motif in DNA \" in Rosalind
Author: bakamono <http://rosalind.info/users/bakamono/>"

# content = File.read("DNA.txt").split("\n")
# dna = content[0]
# ss = content[1]
dna = "GATATATGCATATACTT"
ss = "ATAT"
offset = 0
r = []
## dna.index(ss, offset)表示从offset开始算起，去寻找ss所在的位置
while i = dna.index(ss, offset)
puts i
  offset = (r << i + 1).last
  # 上一句等于以下两句结合，所以last应该表示取()内last的值
  # r << i + 1
  # offset = i + 1

  p offset
end
puts r.join(' ')

# p "dogandcatandcat".index("cat")
# p /cat/ =~ "dogandcatandcat"

