#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Computing GC Content\" in Rosalind
Author:Jiahui Liu<beckyljh@gmail.com>"

file = "rosalind_gc.txt"
result = "result.txt"
outfile = File.new(result,"w")
hash = {}
so = []
File.read(file).split(">").each do |l|	
	if l == ""
		next
	else
		str = []
		str = l.split("\n")
		for i in 1..str.length-1
			a = str[i].scan(/A/).length
			c = str[i].scan(/C/).length
			g = str[i].scan(/G/).length
			t = str[i].scan(/T/).length
			all = all.to_i + a.to_i + c.to_i + g.to_i + t.to_i
			gc = gc.to_i + c.to_i + g.to_i
		end
		#结果错误，都为0
		# m = gc.to_i/all.to_i
		#结果正确				
		m = gc.to_f/all.to_f*100
		hash[str[0]] = m
		so << m
	end
end
so = so.sort()
hash.each do |k,v|
	if v == so[so.length-1]
		outfile.puts k
		outfile.puts v
	end
end
