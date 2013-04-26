#!/usr/bin/env ruby
#coding:utf-8

usage = "#{$0} Solve the problem \" Mendel's First Law\"
Author: Jiahui Liu <beckyljh@gmail.com>,2013/04/25"

def pr(k,m,n)
	sum = k.to_f + m.to_f + n.to_f
	pr_BB = (k/sum)*(((k-1)+m+n)/(sum-1))
	pr_Bb = (m/sum)*((k+0.75*(m-1)+0.5*n)/(sum-1))
	pr_bb = (n/sum)*((k+0.5*m)/(sum-1))
	pr = pr_BB + pr_Bb + pr_bb
	return pr
end

puts pr(24,15,29)