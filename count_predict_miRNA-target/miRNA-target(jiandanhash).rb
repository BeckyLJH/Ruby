#!usr/bin/env ruby
#coding:utf-8

$file1 = "file/mmu_microRNA.org.txt"
$file2 = "file/mmu_RNA22.txt"

$hash = Hash.new(0)
$ahash = Hash.new(0)
$bighash = Hash.new(0)

def all_files(file,dbname)
	hash1 = Hash.new(0)
	#此处先读取整个文件,而"miRNA-target(hanghangdu).rb"一行一行的读
	File.read(file).split("\n").each do |l|
		str = []
		str = l.split("\t")
		str[0] = str[0].sub("star","*")		
		str[0] = str[0].sub("-star","*")
		str[0] = str[0].sub("_star","*")
		str[0] = str[0].sub("mir","miR")
		
		k = str[0]+"\t"+str[1]
		$hash[k] = ""
		hash1[k] = ""
	end
	#嵌套hash使用时，必须先创建一个hash[key1] = {}，然后再赋值
	#在第二次赋值时需要先判断hash[key1]是否为空,并进行处理，以key1相同免值被覆盖
	#此处不用判断是因为首先建立了hash2,装好了整个文件的"miRNA\tmRNA",作为一个整体
	#所以一个hash[dbname]只进行了一次赋值,hash[dbname] = {hash1 = ""},必然不会出现覆盖的情况
	#若不首先建立hash1,则每一行的"miRNA\tmRNA"都往hash[dbname]中放,则出现
	#第一行时：$bighash[dbname][k] = ""
	#第二行时：$bighash[dbname][k] = ""
	#因为dbname相同,值会被覆盖,具体处理方法参见"miRNA-target(fuzahash)",意为"复杂hash"
	$bighash[dbname] = Hash.new(0)
	$bighash[dbname][hash1] = ""
end

all_files($file1,"microRNA.org")
all_files($file2,"RNA22")

$bighash.each do |k1,v1|
	#k1是dbname,v1是{hash1}
	# p "111"
	# p v1
	v1.each do |k2,v2|
		#k2是{hash2}中的key,即hash2
		# p "k222"
		# p k2			
		# p "k222keys"
		# p k2.keys
		k2.each do |k3,v3|
			#k3是hash2中的key,即"miRNA\tmRNA"
			if $hash.key?(k3)
				# p $ahash[k3]				
				if $ahash[k3] == 0
					#如果k3,即"miRNA\tmRNA"只出现一次,ahash[k3] = dbname
					$ahash[k3] = "#{k1}"
				else
					#如果k3,即"miRNA\tmRNA"不只出现一次,ahash[k3] = dbname1;dbname2……
					$ahash[k3] = "#{$ahash[k3]};#{k1}"
				end
			end
		end
	end
end

file = File.new("result_hash.txt","w")
$ahash.each do |kk,vv|
	vstr = []
	vstr = vv.split(";")
	file.puts "#{kk}\t#{vv}\t#{vstr.length}"
end
p "finish"

# 使用"miRNA\tmRNA"作为一个key，程序的关键是找出关系对出现的次数
# 若使用"miRNA"作为第一个key,"mRNA"作为第二个key，程序关键是判断每个miRNA在数据库中出现几次
# 但统计结果没有重大意义,只是作为例子与上面例子比较,以示区别
