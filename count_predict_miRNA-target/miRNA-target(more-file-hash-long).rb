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

hash1 = Hash.new(0)
hash2 = Hash.new(0)
hash3 = Hash.new(0)
hash4 = Hash.new(0)
hash5 = Hash.new(0)
hash6 = Hash.new(0)
# hash7 = Hash.new(0)
hash8 = Hash.new(0)
hash = Hash.new(0)
ahash = Hash.new(0)
bighash = Hash.new(0)

#7个文件都执行一个操作
File.read(file1).split("\n").each do |l|
	str = []
	str = l.split("\t")
	str[0] = str[0].sub("star","*")		
	str[0] = str[0].sub("-star","*")
	str[0] = str[0].sub("mir","miR")

	k = str[0]+"\t"+str[1]
	hash[k] = ""
	hash1[k] = ""
end
bighash["microRNA.org"] = Hash.new(0)
bighash["microRNA.org"][hash1] = ""


File.read(file2).split("\n").each do |l2|
	str = []
	str = l2.split("\t")
	str[0] = str[0].sub("*","")
	str[0] = str[0].sub("-star","")
	str[0] = str[0].sub("r","R")

	k = str[0]+"\t"+str[1]
	hash[k] = ""
	hash2[k] = ""
end
bighash["microCosm"] = Hash.new(0)
bighash["microCosm"][hash2] = ""


File.read(file3).split("\n").each do |l3|
	str = []
	str = l3.split("\t")
	str[0] = str[0].sub("*","")
	str[0] = str[0].sub("-star","")
	str[0] = str[0].sub("r","R")

	k = str[0]+"\t"+str[1]
	hash[k] = ""
	hash3[k] = ""
end
bighash["microT"] = Hash.new(0)
bighash["microT"][hash3] = ""


File.read(file4).split("\n").each do |l4|
	str = []
	str = l4.split("\t")
	str[0] = str[0].sub("*","")
	str[0] = str[0].sub("-star","")
	str[0] = str[0].sub("r","R")

	k = str[0]+"\t"+str[1]
	hash[k] = ""
	hash4[k] = ""
end
bighash["PicTar"] = Hash.new(0)
bighash["PicTar"][hash4] = ""


File.read(file5).split("\n").each do |l5|
	str = []
	str = l5.split("\t")
	str[0] = str[0].sub("*","")
	str[0] = str[0].sub("-star","")
	str[0] = str[0].sub("r","R")

	k = str[0]+"\t"+str[1]
	hash[k] = ""
	hash5[k] = ""
end
bighash["PITA"] = Hash.new(0)
bighash["PITA"][hash5] = ""


File.read(file6).split("\n").each do |l6|
	str = []
	str = l6.split("\t")
	str[0] = str[0].sub("*","")
	str[0] = str[0].sub("-star","")
	str[0] = str[0].sub("r","R")

	k = str[0]+"\t"+str[1]
	hash[k] = ""
	hash6[k] = ""
end
bighash["RNA22"] = Hash.new(0)
bighash["RNA22"][hash6] = ""


# File.read(file7).split("\n").each do |l7|
# 	str = []
# 	str = l7.split("\t")
# 	str[0] = str[0].sub("*","")
# 	str[0] = str[0].sub("-star","")
# 	str[0] = str[0].sub("r","R")

# 	k = str[0]+"\t"+str[1]
# 	hash[k] = ""
# 	hash7[k] = ""
# end
# bighash["TarBase"] = Hash.new(0)
# bighash["TarBase"][hash7] = ""


File.read(file8).split("\n").each do |l8|
	str = []
	str = l8.split("\t")
	str[0] = str[0].sub("*","")
	str[0] = str[0].sub("-star","")
	str[0] = str[0].sub("r","R")

	k = str[0]+"\t"+str[1]
	hash[k] = ""
	hash8[k] = ""
end
bighash["TargetScan"] = Hash.new(0)
bighash["TargetScan"][hash8] = ""


bighash.each do |k1,v1|
	# p v1
	v1.each do |k2,v2|
		# p k2.keys
		# p v2
		k2.each do |k3,v3|
			if hash.key?(k3)
				p ahash[k3]
				if ahash[k3] == 0
					p "111"
					ahash[k3] = "#{k1}"
					p ahash[k3]
				else
					p "222"
					ahash[k3] = "#{ahash[k3]};#{k1}"
					p ahash[k3]
				end
			end
		end
	end
end

file = File.new("result2.txt","w")
ahash.each do |kk,vv|
	vstr = []
	vstr = vv.split(";")
	file.puts "#{kk}\t#{vv}\t#{vstr.length}"
end