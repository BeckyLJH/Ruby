a vs b.rb
	�Ƚ�a��b��������,�ó�common
	����"a.txt"��"b.txt",�ļ���ֻ��pmid,
	ÿ��split("\t")�Ľ�����������ļ�ƥ����common

findouy_correct_result.rb
	�Ƚ�a��b��������,�ó�common,��"a vs b.rb"��ͬ���Ǳ��ļ�
	����"abstract.txt"��"cancerdb_pmid.txt",����"abstract.txt"��medline�����ʽ

select20_abstract.rb
	�Ƚ�"abstract.txt"��"mesh.txt",�ֱ�����߷�common�������ѡ20�����
	�����ļ�"abstract.txt"��"mesh.txt",����ļ�"20abstract_medline.txt"��"20mesh_medline.txt"
	
	˼·��
		����ؼ����ں���article_block_func(infile1,infile2,outfile)		
			���ȱȽ�infile1,infile2,���infile2��ѡ����infile1��Ԫ��,�ٴ��������ѡ20��,
			����,����outfile,��ʵ�ǹ���infile2��outfile
		
		��˺�����������,�Ż����abstract��mesh�������ԵĽ��(�мǷ��������ļ���ǰ��˳��)
			article_block_func(mesh_infile,abstract_infile,abstract_outfile)
			article_block_func(abstract_infile,mesh_infile,mesh_outfile)