#!/usr/bin/env ruby
#coding:utf-8
require "bio"

usage = "#{$0} - 比较得出选出的癌症DB中，有多少在mesh以及abstract/title结果中
Usage:#{$0} medline_format_file
Authors:Jiahui Liu<beckyljh@gmail.com>.
"

# article_infile = "mesh.txt"
article_infile = "abstract.txt"
pmid_infile = "cancerdb_pmid.txt"

n1=0
n2=0
n12=0
mesh_pmid = Hash.new(0)

File.read(article_infile).split("\n\n").each do |article_block|
	article = Bio::MEDLINE.new(article_block)
	mesh_pmid[article.pmid] = article.title
	n1=n1+1
end

File.read(pmid_infile).split("\n").each do |pmid|	
	if mesh_pmid.key?(pmid) then
		# puts pmid
		n12=n12+1
	end 
	n2=n2+1 
end
puts n1
puts n2
puts n12
