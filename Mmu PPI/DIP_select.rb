#!usr/bin/env ruby
#coding:utf-8

usage = "{#{$0} find PPI
Author:Jiahui Liu <beckyljh@gmail.com>,2013/07/17.}"

outFile = File.new("Mmu_DIP_PPI.txt","w")

hash = {}
File.read("../../../a-转移/MOUSE_10090_idmapping_selected.tab").split("\n").each do |l|
	str1 = l.split("\t")
	hash[str1[0]] = str1[2]
end
File.read("../../../a-转移/DIP/Mmusc20130707.txt/Mmusc20130707.txt").split("\n").each do |l|
	str = l.split("\t")
	if str[9] == "taxid:10090(Mus musculus)" && str[10] == "taxid:10090(Mus musculus)"
		uniprotkba = str[0].split("|")
		uniprotkbb = str[1].split("|")	
		# outFile.puts 	uniprotkba[-1]+"\t"+uniprotkbb[-1]
		if (uniprotkba[-1].include?":") && (uniprotkbb[-1].include?":")
			# if (uniprotkba[-1] != "" && uniprotkbb[-1] != "") || (uniprotkba[-1] != nil && uniprotkbb[-1] != nil)
				proa = uniprotkba[-1].split(":")
				prob = uniprotkbb[-1].split(":")

				proao = proa[1].split("-")
				probo = prob[1].split("-")			
				if hash.key?(proao[0]) && hash.key?(probo[0]) && hash[proao[0]] != ""  && hash[probo[0]] != ""
					outFile.puts hash[proao[0]].to_s+"\t"+hash[probo[0]].to_s+"\tDIP"
				end	
			# end	
		end
	# exit
	end
end

# a = "DIP-4N|refseq:NP_035300|uniprotkb:P04925"
# uniprotkbb = a.split("|")
# puts uniprotkbb[-1]

puts "finish"
outFile.close