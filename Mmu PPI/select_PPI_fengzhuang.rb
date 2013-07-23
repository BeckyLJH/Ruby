#!usr/bin/env ruby
#coding:utf-8

usage = "{#{$0} find PPI
Author:Jiahui Liu <beckyljh@gmail.com>,2013/07/23.}"

outFile = File.new("PPI_both.txt","w")

ID_list = []
File.read("gene_id.txt").split("\n").each do |l|
	strid = l.split("\t")
	ID_list << strid[0]
end

c = 0
hash = {}
proa_list = []
prob_list = []

File.read("Mmu_PPI/All_PPI_incl_String.txt").split("\n").each do |l|
	strppi = l.split("\t")
	proa = strppi[0].split(";")
	prob = strppi[1].split(";")
	if ((ID_list & proa).length > 0) && ((ID_list & prob).length > 0)
		# outFile.puts (ID_list & proa).join(";") +"\t"+ (ID_list & prob).join(";")
		$ID_one = ID_list & proa
		$ID_two = ID_list & prob	
		for i in 0..$ID_one.length-1
			for j in 0..$ID_two.length-1
				if $ID_one[i] != $ID_two[j]
					if hash.key?($ID_two[j] +"\t"+ $ID_one[i])
						next
					else
						hash[$ID_one[i] +"\t"+ $ID_two[j]] = $ID_one[i]
					end
				end
			end
		end
	end
end

hash.each do |k,v|
	outFile.puts k
end
puts "finish"

