#/usr/bin env ruby 
#coding:utf-8

usage = "#{$0} solved the problem \" Finding a Shared Motif \"
Author: Jiahui Liu <beckyljh@gmail.com> ,2013-07-25"

def allstr(str)
	$alla = []
	for i in 0..str.length-1
		for j in 1..str.length-i
			$alla << str[i,j]
		end
	end
	return $alla
end

# alldna是将第一条序列拆成所有的可能，且为不重复
alldna = []
File.read("rosalind_grph2.txt").split(">").each do |l|
	l = l.strip()
	str = l.split("\r\n")
	if str.length >= 3
		for i in 2..str.length-1
			str[1] << str[i]
		end
	end
	alldna = allstr(str[1])
	alldna.uniq!
	break
end
allb = alldna.clone

File.read("rosalind_grph2.txt").split(">").each do |l|
	l = l.strip()
	str2 = l.split("\r\n")
	if str2.length >= 3
		for i in 2..str2.length-1
			str2[1] << str2[i]
		end
	end
	for i in 0..alldna.length-1
		if !(str2[1].include?alldna[i])  
			allb.delete(alldna[i])		
		end
	end
end

longd = allb[0]
for i in 1..allb.length-1
	if longd.length <= allb[i].length
		longd = allb[i]
	end
end
puts longd
