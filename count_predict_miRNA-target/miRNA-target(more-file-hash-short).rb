#!usr/bin/env ruby
#coding:utf-8

file1 = "//CHENSHENG-PC/Database research/bioDatabase/miRNA/mmu/mmu_microRNA.org.txt"
file2 = "//CHENSHENG-PC/Database research/bioDatabase/miRNA/mmu/mmu_microCosm Targets.txt"
file3 = "//CHENSHENG-PC/Database research/bioDatabase/miRNA/mmu/mmu_microT_v3.0.txt"
file4 = "//CHENSHENG-PC/Database research/bioDatabase/miRNA/mmu/mmu_PicTar.txt"
file5 = "//CHENSHENG-PC/Database research/bioDatabase/miRNA/mmu/mmu_PITA_targets.txt"
file6 = "//CHENSHENG-PC/Database research/bioDatabase/miRNA/mmu/mmu_RNA22.txt"
# file7 = "//CHENSHENG-PC/Database research/bioDatabase/miRNA/mmu/mmu_TarBase.txt"
file8 = "//CHENSHENG-PC/Database research/bioDatabase/miRNA/mmu/mmu_TargetScan.org.txt"

#加上$,表示全局变量,在子函数中亦可调用,每次调用是都要加$
$hash = Hash.new(0)
ahash = Hash.new(0)
$bighash = Hash.new(0)

def all_files(file,dbname)
	hash2 = Hash.new(0)
	File.read(file).split("\n").each do |l|
		str = []
		str = l.split("\t")
		str[0] = str[0].sub("star","*")		
		str[0] = str[0].sub("-star","*")
		str[0] = str[0].sub("mir","miR")

		k = str[0]+"\t"+str[1]
		$hash[k] = ""
		hash2[k] = ""
	end
	$bighash[dbname] = Hash.new(0)
	$bighash[dbname][hash2] = ""
end

all_files(file1,"microRNA.org")
all_files(file2,"PicTar")
all_files(file3,"microT")
all_files(file4,"microCosm")
all_files(file5,"PITA")
all_files(file6,"RNA22")
# all_files(file7,"TarBase")
all_files(file8,"TargetScan")

#到此为止，可知
#$hash[miRNA\tmRNA] = ""：合并7个库中出现的"miRNA\tmRNA"关系,不重复
#$bighash[dbname][hash2]：7个库中,将每个数据库名作为第一个key,库中"miRNA\tmRNA"关系为第二个key

$bighash.each do |k1,v1|
	#k1是dbname,v1是{hash2}
	# p v1
	v1.each do |k2,v2|
		#k2是{hash2}中的key,即hash2
		# p k2.keys
		k2.each do |k3,v3|
			#k3是hash2中的key,即"miRNA\tmRNA"
			if $hash.key?(k3)
				# p ahash[k3]
				if ahash[k3] == 0
					#如果k3,即"miRNA\tmRNA"只出现一次,ahash[k3] = dbname
					ahash[k3] = "#{k1}"
					# p ahash[k3]
				else
					#如果k3,即"miRNA\tmRNA"不只出现一次,ahash[k3] = dbname1;dbname2……
					ahash[k3] = "#{ahash[k3]};#{k1}"
					# p ahash[k3]
				end
			end
		end
	end
end

file = File.new("result7.txt","w")
ahash.each do |kk,vv|
	vstr = []
	vstr = vv.split(";")
	file.puts "#{kk}\t#{vv}\t#{vstr.length}"
end
p "finish"