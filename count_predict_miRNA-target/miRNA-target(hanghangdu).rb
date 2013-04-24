#!usr/bin/env ruby
#coding:utf-8

$file1 = "file/mmu_microRNA.org.txt"
$file2 = "file/mmu_RNA22.txt"

$hash = Hash.new(0)
ahash = Hash.new(0)
$bighash = Hash.new(0)

def all_files(file,dbname)
	hash2 = Hash.new(0)
	file = open(file)
	#一行一行的读,占用内存少,但非常耗时
	while text = file.gets do
		text = text.strip()
		str = []
		str = text.split("\t")
		str[0] = str[0].sub("star","*")		
		str[0] = str[0].sub("-star","*")
		str[0] = str[0].sub("_star","*")
		str[0] = str[0].sub("mir","miR")

		k = str[0]+"\t"+str[1]
		$hash[k] = ""
		hash2[k] = ""
	end
	$bighash[dbname] = Hash.new(0)
	$bighash[dbname][hash2] = ""
end

all_files($file1,"microRNA.org")
all_files($file2,"RNA22")

$bighash.each do |k1,v1|
	# p v1
	v1.each do |k2,v2|
		# p k2.keys
		# p v2
		k2.each do |k3,v3|
			if $hash.key?(k3)
				# p ahash[k3]
				if ahash[k3] == 0
					# p "111"
					ahash[k3] = "#{k1}"
					# p ahash[k3]
				else
					# p "222"
					ahash[k3] = "#{ahash[k3]};#{k1}"
					# p ahash[k3]
				end
			end
		end
	end
end

filew = File.new("resultman.txt","w")
ahash.each do |kk,vv|
	vstr = []
	vstr = vv.split(";")
	filew.puts "#{kk}\t#{vv}\t#{vstr.length}"
end
p "finish"
