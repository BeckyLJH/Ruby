#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} filter ttest result
Please give me 6 input. 
Author:Jiahui Liu <beckyljh@gmail.com>,2013/05/05."

if ARGV.size != 6
	$stderr.puts usage
	exit
else
	datafile = ARGV[0]
	outfile = ARGV[1]
	head_or_not = ARGV[2]
	raw_p = ARGV[3]
	adjust_p = ARGV[4]
	fc = ARGV[5]
end

output_file = File.new(outfile,"w")
if head_or_not == "true"
	output_file.puts File.read(datafile).split("\n")[0]
	File.read(datafile).split("\n")[1..-1].each do |l|
		str = l.split("\t")[-3..-1]
		if (str[1].to_f <= raw_p.to_f)&&(str[2].to_f <= adjust_p.to_f)&&(str[0].to_f >= fc.to_f || str[0].to_f <= 1/fc.to_f)
			output_file.puts l
		end
	end
else
	File.read(datafile).split("\n").each do |l|
		str = l.split("\t")[-3..-1]
		if (str[1].to_f <= raw_p.to_f)&&(str[2].to_f <= adjust_p.to_f)&&(str[0].to_f >= fc.to_f || str[0].to_f <= 1/fc.to_f)
			output_file.puts l
		end
	end		
end

