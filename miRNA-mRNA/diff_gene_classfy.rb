#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} filter ttest result
Please give me 5 input. 
Author:Jiahui Liu <beckyljh@gmail.com>,2013/05/04."

if ARGV.size != 5
	$stderr.puts usage
	exit
else
	datafile = ARGV[0]
	up_outfile = ARGV[1]
	down_outfile = ARGV[2]
	head_or_not = ARGV[3]
	fc = ARGV[4].to_i
end

up_output_file = File.new(up_outfile,"w")
down_output_file = File.new(down_outfile,"w")
if head_or_not == "true" || "TRUE"
	up_output_file.puts "Gene_id\t"+File.read(datafile).split("\n")[0]
	down_output_file.puts "Gene_id\t"+File.read(datafile).split("\n")[0]
	File.read(datafile).split("\n")[1..-1].each do |l|
		str = l.split("\t")[fc]
		if str.to_i >= 2
			up_output_file.puts l
		else
			down_output_file.puts l
		end
	end
else
	File.read(datafile).split("\n").each do |l|
		str = l.split("\t")[fc]
		if str.to_i >= 2
			up_output_file.puts l
		else
			down_output_file.puts l
		end
	end	
end

