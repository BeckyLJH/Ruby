#!usr/bin/env ruby
#coding:utf-8

$file1 = "file/mmu_microRNA.org.txt"
$file2 = "file/mmu_RNA22.txt"

$hash = Hash.new(0)
$ahash = Hash.new(0)
$bighash = Hash.new(0)

def example_fun(file,dbname)
	File.read(file).split("\n").each do |l|
		str = []
		str = l.split("\t")
		str[0] = str[0].sub("star","*")		
		str[0] = str[0].sub("-star","*")
		str[0] = str[0].sub("mir","miR")
		
		k = str[0]+"\t"+str[1]
		$hash[k] = ""

		#每行执行$bighash[dbname][k] = "",则要做如下处理,同时输出时也会发生变化,往下看
		if $bighash == {}
			$bighash[dbname] = Hash.new(0)
			$bighash[dbname][k] = ""
		else  
			if $bighash.key?(dbname)
				$bighash[dbname] = $bighash[dbname]
				$bighash[dbname][k] = ""
			else
				$bighash[dbname] = Hash.new(0)
				$bighash[dbname][k] = ""
			end
		end
	end
end

example_fun($file1,"microRNA.org")
example_fun($file2,"RNA22")


#变化出现在这里
#"miRNA-target(jiandanhash)"中,下面的v1是{hash1},v1的key是hash1
#而本程序中v1是{miRNA\tmRNA => ""},相当于hash1,v1的key"miRNA\tmRNA",实际上是少了一层hash
$bighash.each do |k1,v1|
	#k1是dbname,v1是{miRNA\tmRNA => ""}
	# p "111"
	# p v1
	v1.each do |k2,v2|
		#k2是{miRNA\tmRNA => ""}中的key,即"miRNA\tmRNA"
		# p "k222"
		# p k2			
		if $hash.key?(k2)
			# p $ahash[k3]				
			if $ahash[k2] == 0
				#如果k3,即"miRNA\tmRNA"只出现一次,ahash[k3] = dbname
				$ahash[k2] = "#{k1}"
			else
				#如果k3,即"miRNA\tmRNA"不只出现一次,ahash[k3] = dbname1;dbname2……
				$ahash[k2] = "#{$ahash[k2]};#{k1}"
			end
		end
	end
end

file = File.new("result_nohash.txt","w")
$ahash.each do |kk,vv|
	vstr = []
	vstr = vv.split(";")
	file.puts "#{kk}\t#{vv}\t#{vstr.length}"
	# puts "#{kk}\t#{vv}\t#{vstr.length}"
end
p "finish"


# 使用"miRNA\tmRNA"作为一个key，程序的关键是找出关系对出现的次数
# 若使用"miRNA"作为第一个key,"mRNA"作为第二个key，程序关键是判断每个miRNA在数据库中出现几次
# 但统计结果没有重大意义,只是作为例子与上面例子比较,以示区别










