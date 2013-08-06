#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Mortal Fibonacci Rabbits\" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

# file = "rosalind_rna.txt"

def count(n,m)
	little = [1,0]
	big = [0,1]
	for j in 3..m
		lnum = big[j-2]
		bnum = big[j-2]+little[j-2]
		little << lnum
		big << bnum
	end		
	for i in m+1..n
		lnum = big[i-2]
		bnum = big[i-2]+little[i-2]-little[i-m-1]
		little << lnum
		big << bnum
		num = lnum + bnum		
	end
	p num
end
count(83,20)
