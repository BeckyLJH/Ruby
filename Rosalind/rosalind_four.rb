#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Rabbits and Recurrence Relations\"in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

# file = "rosalind_rna.txt"
def count(n,k)
	lnum = k
	bnum = 1
	l = lnum
	b = bnum
	for i in 4..n
		lnum = k*b
		bnum = l + b
		num = lnum + bnum
		l = lnum
		b = bnum
		p "big = "+ b.to_s
		p "little = "+ l.to_s
		p num
	end
end
count(28,2)

##思路：
#大兔子来源有两个，上一代大兔子和上一代的小兔子 big = last_big + last_little
#小兔子来源只有一个:上一代的大兔子生的  little = last_big * k