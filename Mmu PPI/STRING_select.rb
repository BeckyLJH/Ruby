#!usr/bin/env ruby
#coding:utf-8

usage = "{#{$0} find PPI
Author:Jiahui Liu <beckyljh@gmail.com>,2013/07/17.}"

outFile = File.new("data2/Mmu_STRING_PPI.txt","w")

# 获得文件data2/mouse_uniprot_vs_string.txt
# hash = {}
# File.read("../../../a-转移/STRING/release.2012_1.vs.mouse.string.v9.05.via_blast.v1.02172012.txt").split("\n").each do |l|
# 	str = l.split("\t")
# 	if hash.key?str[0]
# 		hash[str[0]] = hash[str[0]] +";"+ str[1]
# 	else
# 		hash[str[0]] = str[1]
# 	end
# end

# hash.each do |kk,vv|
# 	outFile.puts "#{kk}\t#{vv}"
# end


# 获得文件data2/mouse_uniprotid_vs_string.txt
# hash = {}
# hash2 = {}
# File.read("../../../a-转移/MOUSE_10090_idmapping_selected.tab").split("\n").each do |l|
# 	str = l.split("\t")
# 	hash[str[1]] = str[0]
# end

# File.read("data2/mouse_uniprot_vs_string.txt").split("\n").each do |l|
# 	str2 = l.split("\t")
# 	if hash.key?str2[0]
# 		str2[0] = hash[str2[0]]
# 		hash2[str2[0]] = str2[1]
# 	else
# 		hash2[str2[0]] = str2[1]
# 	end
# end

# hash2.each do |kk,vv|
# 	outFile.puts "#{kk}\t#{vv}"
# end


# 获得文件data2/mouse_string_vs_uniprot.txt
# hash = {}
# File.read("data2/mouse_uniprotid_vs_string.txt").split("\n").each do |l|
# 	str = l.split("\t")
# 	str2 = str[1].split(";")
# 	for i in 0..str2.length-1		
# 		if hash.key?str2[i]
# 			hash[str2[i]] = hash[str2[i]] +";"+ str[0]
# 		else
# 			hash[str2[i]] = str[0]
# 		end
# 	end
# end

# hash.each do |kk,vv|
# 	outFile.puts "#{kk}\t#{vv}"
# end



# 获得文件data2/mouse_string_vs_entrez.txt
# hash = {}
# File.read("../../../a-转移/MOUSE_10090_idmapping_selected.tab").split("\n").each do |l|
# 	str = l.split("\t")
# 	if (str[0] != "") && (str[2] != "")
# 		hash[str[0]] = str[2]
# 	end
# end

# ID = []
# File.read("data2/mouse_string_vs_uniprot.txt").split("\n").each do |l|
# 	str2 = l.split("\t")
# 	str3 = str2[1].split(";")
# 	ID.clear
# 	for i in 0..str3.length-1
# 		if hash.key?str3[i]
# 			str3[i] = hash[str3[i]]
# 			ID << str3[i]
# 		end
# 	end
# 	ID.uniq!
# 	if ID.length > 0
# 		outFile.puts str2[0] +"\t"+ ID.join(";")
# 	end
# end


# 获得文件data2/Mmu_STRING_PPI_first.txt
# hash = {}
# File.read("data2/mouse_string_vs_entrez.txt").split("\n").each do |l|
# 	str = l.split("\t")
# 	hash[str[0]] = str[1]
# end


# File.read("Mmu_STRING_PPI_stringid.txt").split("\n").each do |l|
# 	str2 = l.split("\t")
# 	if (hash.key?str2[0]) && (hash.key?str2[1])
# 		str2[0] = hash[str2[0]]
# 		str2[1] = hash[str2[1]]
# 		outFile.puts str2[0] +"\t"+ str2[1] +"\t"+ str2[2]
# 	end
# end


# 获得文件data2/Mmu_STRING_PPI_second.txt
# 将data2/Mmu_STRING_PPI_first.txt文件中100044627; 100862455; 65019格式，处理成100044627;100862455;65019
# File.read("data2/Mmu_STRING_PPI_first.txt").split("\n").each do |l|
# 	str = l.split("\t")
# 	proa = str[0].split("; ")
# 	prob = str[1].split("; ")
# 	outFile.puts proa.join(";") +"\t"+ prob.join(";") +"\t"+ str[2]
# end


File.read("data2/Mmu_STRING_PPI_second.txt").split("\n").each do |l|
	str = l.split("\t")
	outFile.puts  str[0] +"\t"+ str[1] +"\tSTRING" 
end

puts "finish"

