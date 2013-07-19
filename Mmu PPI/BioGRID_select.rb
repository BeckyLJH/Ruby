#!usr/bin/env ruby
#coding:utf-8

usage = "{#{$0} find PPI
Author:Jiahui Liu <beckyljh@gmail.com>,2013/07/17.}"

# 从所有物种PPI中选取小鼠的PPI数据
outFile = File.new("Mmu_BIOGRID_PPI.txt","w")
File.read("../../../a-转移/BIOGRID-ORGANISM-3.2.102.tab2/BIOGRID-ORGANISM-Mus_musculus-3.2.102.tab2.txt").split("\n").each do |l|
	str = l.split("\t")
	if str[15] == "10090" && str[16] == "10090"
		outFile.puts str[1]+"\t"+str[2]+"\tBIOGRID"
	# exit
	end
end

puts "finish"
outFile.close