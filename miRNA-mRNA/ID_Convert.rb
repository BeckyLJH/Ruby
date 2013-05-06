#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} filter ttest result
Please give me 8 input. 
Author:Jiahui Liu <beckyljh@gmail.com>,2013/05/04."

if ARGV.size != 8
	$stderr.puts usage
	exit
else
	gene_info = ARGV[0]
	datafile = ARGV[1]
	outfile = ARGV[2]
	gene_info_geneid_row = ARGV[3].to_i
	datafile_gene_info_row = ARGV[4]
	datafile_geneid_row = ARGV[5].to_i
	head_or_not = ARGV[6]
	start_or_end = ARGV[7]

end

output_file = File.new(outfile,"w")
datafile_add_row = datafile_gene_info_row.split(",")

hash = Hash.new(0)
File.read(gene_info).split("\n")[1..-1].each do |l|
	add = []
	content = l.split("\t")
	datafile_add_row.each do |index|
		add << content[index.to_i]
	end
	hash[content[gene_info_geneid_row]] = add.join("\t")
end
title = []
head = File.read(gene_info).split("\n")[0].split(" ")
datafile_add_row.each do |index|
	title << head[index.to_i+1]
end

if head_or_not == "true"
	if start_or_end == "start"
		output_file.puts title.join("\t") +"\t"+ File.read(datafile).split("\n")[0].strip()
	else
		output_file.puts File.read(datafile).split("\n")[0].strip() +"\t"+ title.join("\t")
	end
	
	File.read(datafile).split("\n")[1..-1].each do |line|
		arr = line.split("\t")
		if start_or_end == "start"
			output_file.puts "#{hash[arr[datafile_geneid_row]]}\t#{line.strip()}"
		else
			output_file.puts "#{line.strip()}\t#{hash[arr[datafile_geneid_row]]}"
		end
	end
else
	File.read(datafile).split("\n")[1..-1].each do |line|
		arr = line.split("\t")
		if start_or_end == "start"
			output_file.puts "#{hash[arr[datafile_geneid_row]]}\t#{line.strip()}"
		else
			output_file.puts "#{line.strip()}\t#{hash[arr[datafile_geneid_row]]}"
		end
	end
end