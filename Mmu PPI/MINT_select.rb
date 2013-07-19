#!usr/bin/env ruby
#coding:utf-8

usage = "{#{$0} find PPI
Author:Jiahui Liu <beckyljh@gmail.com>,2013/07/17.}"

# 从所有物种PPI中选取小鼠的PPI数据
# outFile = File.new("Mmu1.txt","w")
# outFile.puts "ID interactor A	ID interactor B	DBName"
# File.read("../../../a-转移/2013-03-26-mint-full-binary.mitab26.txt").split("\n").each do |l|
# 	str = l.split("\t")
# 	if str[9] == "taxid:10090(Mus musculus)" && str[10] == "taxid:10090(Mus musculus)"
# 		outFile.puts str[0]+"\t"+str[1]+"\tMINT"
# 	# exit
# 	end
# end

# 将PPI数据中uniprotkb转换成GeneID
outFile = File.new("Mmu_MIMT_PPI.txt","w")

hash = {}
File.read("../../../a-转移/MOUSE_10090_idmapping_selected.tab").split("\n").each do |l|
	str = l.split("\t")
	hash[str[0]] = str[2]
end
File.read("Mmu_id.txt").split("\n").each do |l|
	str2 = l.split("\t")
	proa = str2[0].split(":")
	prob = str2[1].split(":")
	proao = proa[1].split("-")
	probo = prob[1].split("-")
	if hash.key?(proao[0]) && hash.key?(probo[0]) && hash[proao[0]] != ""  && hash[probo[0]] != ""
		outFile.puts hash[proao[0]].to_s+"\t"+hash[probo[0]].to_s+"\tMIMN"
	end
	# exit
end

puts "finish"
outFile.close