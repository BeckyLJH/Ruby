#!/usr/bin/env ruby
#coding:utf-8

usage = "#{$0} - 比较a、b两组数据，得出common
Usage:#{$0} data_file
Authors:Jiahui Liu<beckyljh@gmail.com>.
"
# more_infile = "mesh.txt"
more_infile = "a.txt"
less_infile = "b.txt"

n1=0
n2=0
n12=0
mesh_pmid = Hash.new(0)
File.read(more_infile).split("\n").each do |more|
	mesh_pmid[more] = 0
	n1=n1+1
end
File.read(less_infile).split("\n").each do |less|	
	if mesh_pmid.key?(less) then
		# puts less
		n12=n12+1
	end 
	n2=n2+1 
end
puts n1
puts n2
puts n12
