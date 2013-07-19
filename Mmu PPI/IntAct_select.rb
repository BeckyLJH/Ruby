#!usr/bin/env ruby
#coding:utf-8

usage = "{#{$0} find PPI
Author:Jiahui Liu <beckyljh@gmail.com>,2013/07/17.}"

outFile = File.new("Mmu_IntAct_PPI.txt","w")

hash = {}
File.read("../../../a-转移/MOUSE_10090_idmapping_selected.tab").split("\n").each do |l|
	str1 = l.split("\t")
	hash[str1[0]] = str1[2]
end
File.read("../../../a-转移/intact/intact.txt").split("\n").each do |l|
	str = l.split("\t")
	if str[9] == "taxid:10090(mouse)|taxid:10090(Mus musculus)" && str[10] == "taxid:10090(mouse)|taxid:10090(Mus musculus)"
		uniprotkba = str[0].split("|")
		uniprotkbb = str[1].split("|")	
		proa = uniprotkba[0].split(":")
		prob = uniprotkbb[0].split(":")	
		proao = proa[1].split("-")
		probo = prob[1].split("-")			
		if hash.key?(proao[0]) && hash.key?(probo[0]) && hash[proao[0]] != ""  && hash[probo[0]] != ""
			outFile.puts hash[proao[0]].to_s+"\t"+hash[probo[0]].to_s+"\tIntAct"
		end		
	# exit
	end
end


puts "finish"
outFile.close