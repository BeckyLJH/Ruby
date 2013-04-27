#!/usr/bin/env ruby
#coding:utf-8

usage = "#{$0} Sovle the problem \" Consensus and Profile\"
Author: bakamono <http://rosalind.info/users/bakamono/>;2013/04/27"

arr = []
file = open("rosalind_cons.txt")
outfile = File.new("result.txt","w")

File.read(file).split(">").each do |block|
	if block == ""
		next 
	else
		str = []
		$str2 = []
		str = block.split("\n") 
		for i in 1..str.length-1
			$str2.push(str[i])
		end
		str3 = $str2.join("")
		arr << str3
	end
	
end
alphabet = 'ACGT'
# 生成4*8个元素，为4*8的矩阵，且列刚好与'ACGT'相对应
profile = alphabet.split(//).map { Array.new($str2.join("").length, 0) }
# 仅生成了8个元素
# profile1 = Array.new($str2.join("").length, 0)

arr.each do |d|
# n为原字符，i为索引
  d.split(//).each_with_index do |n, i|
    profile[alphabet.index(n)][i] += 1
    # puts n
    # puts alphabet.index(n)
    # puts i
  end
end
# 输出矩阵的第一列 puts profile.transpose[0]
outfile.puts profile.transpose.map { |c| alphabet[c.find_index(c.max)] }.join
# 矩阵遍历输出
outfile.puts profile.each_with_index.map { |l, i| (["#{alphabet[i]}:"] + l).join(" ")  }.join("\n")
