#!usr/bin/env ruby
#coding:utf-8

usage = "{#{$0} find PPI
Author:Jiahui Liu <beckyljh@gmail.com>,2013/07/23.}"

outFile = File.new("gene2pathway_des_mmu.txt","w")

hash = {}
hash2 = {}
File.read("kegg2name").split("\n").each do |l|
	l = l.strip()
	str2 = l.split("\t")
	hash[str2[0]] = str2[1]
end


File.read("gene2Path_mmu.txt").split("\n").each do |l|
	l = l.strip()
	str = l.split("\t")
	if str[1].length == 1
		str[1] = "0000" + str[1]
	elsif  str[1].length == 2
		str[1] = "000" + str[1]
	elsif  str[1].length == 3
		str[1] = "00" + str[1]
	else  str[1].length == 4
		str[1] = "0" + str[1]
	end

	if hash.key?(str[1])
		if hash2.key?(str[0])
			hash2[str[0]] = hash2[str[0]] +";("+ str[1] +")"+ hash[str[1]]
		else 
			hash2[str[0]] = "("+ str[1] +")"+ hash[str[1]]
		end
	end
end


File.read("gene_id.txt").split("\n").each do |l|
	str3 = l.split("\t")
	if hash2.key?str3[0]
		outFile.puts str3[0] +"\t"+ hash2[str3[0]]
	end
end

puts "finish"
