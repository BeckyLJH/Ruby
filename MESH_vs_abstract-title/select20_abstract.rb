#！usr/bin/env ruby
#coding:utf-8
require 'bio'
usage = "#{0}select 20 'abstract/mesh' medline abstract from non common of 'abstract/mesh' files
Author:Jiahui Liu<beckyljh@gmail.com>"

# if ARGV.size != 4
# 	$stderr.puts usage
# 	exit
# else
# 路径也可以写死，但是每次调用都需要该代码，不人性化，在服务器上运行需改进

abstract_infile = "abstract.txt"
abstract_outfile = "20abstract_medline.txt"
mesh_infile = "mesh.txt"
mesh_outfile = "20mesh_medline.txt"

def article_block_func(infile1,infile2,outfile)
	ofile = File.new(outfile,"w")
	hash_pmid = Hash.new(0)
	hash_pmid2 = Hash.new(0)
	n1 = 0
	n2 = 0
	n12 = 0
	file2only = 0

	#将medline格式的摘要信息分割成重要元素的集合
	# 如果在服务器上运行，"\n\n"要写成"\r\n\r\n",服务器上的换行是"\r\n"
	File.read(infile1).split("\n\n").each do |article_block|
		article = Bio::MEDLINE.new(article_block)
		# 输出medline格式article模块中所有固定字段
		# p article.methods
		hash_pmid[article.pmid] = article_block
		#若使用n1++,会报错;若用n1 += n1,结果都是0
		n1 = n1 + 1
	end

	File.read(infile2).split("\n\n").each do |article_block2|
		article2 = Bio::MEDLINE.new(article_block2)
		if hash_pmid.key?(article2.pmid)
			n12 = n12 + 1
		else
			hash_pmid2[article2.pmid] = article_block2
			file2only = file2only + 1
		end
		n2 = n2 + 1
	end
	####每个循环用end结尾
	
	#将所有pmid放进一个数组all_pmid[]里面
	all_pmid = []
	hash_pmid2.each do |k,v|
		all_pmid << k
	end

	20.times do
		select = all_pmid[rand(all_pmid.length)]
		if hash_pmid2.key?(select)
			ofile.puts hash_pmid2[select]+"\n\n"
		end
		#将选出的pmid从all_pmid[]中删去，避免最后选取重复的结果
		all_pmid.delete(select)
	end	
	p n1
	p n2
	p n12
	p file2only
	p "finish "+outfile
end

article_block_func(mesh_infile,abstract_infile,abstract_outfile)
article_block_func(abstract_infile,mesh_infile,mesh_outfile)
