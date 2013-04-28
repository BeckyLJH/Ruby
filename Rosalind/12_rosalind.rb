#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} Solve the problem \" Overlap Graphs \"
Author: Jiahui Liu <beckyljh@gmial.com>,2013/04/27"

outfile = File.new("result.txt","w")
l = []
arr = []
all = []
File.read("rosalind_grph.txt").split(">").each do |block|	
	if l == ""
		next
	else
		str = []
		l = block.split("\n")
		arr << l[0]
		for i in 1..l.length-1
			str.push(l[i])
		end
		str = str.join("")
		all << str	
	end
end

# #匹配长度为3的overlap
def overlap(s1,s2)
	bo = false
	bo = true if s1[-3..-1] == s2[0..2]
	return bo
end

for ii in 1..all.length-1
	for jj in ii+1..all.length-1
		outfile.puts arr[ii] +" "+ arr[jj] if overlap(all[ii],all[jj])
		outfile.puts arr[jj] +" "+ arr[ii] if overlap(all[jj],all[ii])	
		jj = jj + 1
	end
end


# #匹配任意长度的overlap
# def overlap(s1,s2)
# 	bo = false
# 	if s1.length <= s2.length
# 		# p "000"
# 		j = s1.length-1
# 		for i in 0..s1.length-1
# 			bo = true if s1[i..-1] == s2[0..j]
# 			# p s1[i..-1]
# 			# p s2[0..j]
# 			# p bo
# 			i = i + 1
# 			j = j - 1
# 			break if bo
# 		end
# 	else
# 		# p "111"
# 		j2 = -1
# 		for i2 in s1.length-s2.length..s1.length-1
# 			bo = true if s1[i2..-1] == s2[0..j2]
# 			# p s1[i2..-1]
# 			# p s2[0..j2]
# 			# p bo
# 			i2 = i2 + 1
# 			j2 = j2 - 1
# 			break if bo
# 		end
# 	end
# 	return bo
# end


# for ii in 1..all.length-1
# 	for jj in ii+1..all.length-1
# 		outfile.puts arr[ii] +" "+ arr[jj] if overlap(all[ii],all[jj])
# 		outfile.puts arr[jj] +" "+ arr[ii] if overlap(all[jj],all[ii])	
# 		# p all[ii]
# 		# p all[jj]
# 		jj = jj + 1
# 	end
# 	# exit
# end