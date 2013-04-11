a vs b.rb
	比较a、b两组数据,得出common
	输入"a.txt"和"b.txt",文件内只有pmid,
	每行split("\t")改进后可用于两文件匹配找common

findouy_correct_result.rb
	比较a、b两组数据,得出common,与"a vs b.rb"不同的是本文件
	输入"abstract.txt"和"cancerdb_pmid.txt",其中"abstract.txt"是medline特殊格式

select20_abstract.rb
	比较"abstract.txt"和"mesh.txt",分别从两者非common中随机挑选20个输出
	输入文件"abstract.txt"和"mesh.txt",输出文件"20abstract_medline.txt"和"20mesh_medline.txt"
	
	思路：
		程序关键在于函数article_block_func(infile1,infile2,outfile)		
			首先比较infile1,infile2,后从infile2中选出非infile1的元素,再从中随机挑选20个,
			所以,最后的outfile,其实是关于infile2的outfile
		
		因此函数调用两次,才会输出abstract、mesh两个各自的结果(切记分清输入文件的前后顺序)
			article_block_func(mesh_infile,abstract_infile,abstract_outfile)
			article_block_func(abstract_infile,mesh_infile,mesh_outfile)