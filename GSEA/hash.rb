#!/usr/bin/env ruby
#coding:utf-8

outFile = File.new("Q3/mf_outfile.txt","w")

hash = {}
File.read("geneinput.txt").split("\r\n").each do |l|
	gene = l.split("\t")
	geneall = gene[0].split("|")
	for i in 0..geneall.length-1
		hash[geneall[i].upcase] = gene[1] +"\t"+ gene[4] +"\t"+ gene[5]
	end
end

File.read("input.txt").split("\r\n").each do |l|
	$strlineone = l.split("\t")
	break
end

a = []
for i in 2..$strlineone.length-1
	a[i] = []
end

File.read("input.txt").split("\r\n").each do |l|
	str = l.split("\t")
	if hash.key?str[0].upcase
		res = "\t" + str[0] +"\t+(\"http://www.genecards.org/cgi-bin/carddisp.pl?gene="+str[0]+"\",\"Link\")\t"+ str[1] +"\t"+ hash[str[0]]
	else
		res = "\t" + str[0] +"\t+(\"http://www.genecards.org/cgi-bin/carddisp.pl?gene="+str[0]+"\",\"Link\")\t"+ str[1]
	end

	if str[0] != "Gene Symbol"
		for i in 2..$strlineone.length-1
			if	str[i] == $strlineone[i]
				a[i] << res
			end
		end
	end
end

for i in 2..a.length-1
	outFile.puts ">\t" + $strlineone[i] +"\n"+ a[i].join("\n")
end

