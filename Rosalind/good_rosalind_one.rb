#!/usr/bin/env ruby

usage = "#{$0} Solve the problem \"Counting DNA Nucleotides\" in Rosalind
Author: Your self<http://rosalind.info/users/Yourself/>"

data = File.read('rosalind_dna.txt')
# p data.count("C")
puts %w(A C G T).map { |c| data.count(c).to_s }.join(' ')

###second
# input = ARGV[0]

# a = input.count('A');
# c = input.count('C');
# g = input.count('G');
# u = input.count('U')

# p "#{a} #{c} #{g} #{u}"


## expend
h = [1,2,3,4,5]
# each:连续访问集合所有元素
h1 = h
# h1.each{|v|puts sprintf('values is:%s',v)}
# h.each{|v| puts v}

# collect:返回新生成的集合
h2 = h.collect{|x| [x,x*2]}
# p h2
# puts h2 

# map:同collect
h3 = h.map{|x| x*3 }
# p h3
# puts h3 


# inject:遍历集合各元素，将元素按规则累计，返回最终值
h4 = h.inject{|a,b| a+b}
# p h4
# puts h4 
