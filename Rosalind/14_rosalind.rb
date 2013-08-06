#/usr/bin/env ruby
#coding:utf-8

usage = "#{$0} solved the problem \" Finding a Protein Motif \"
Author: Jiahui Liu <beckyljh@gmail.com>,20133-08-06"

require 'hpricot'
require 'open-uri'

outFile = File.new("outfile.txt","w")
ss = /N[%s("A","R","N","D","C","Q","E","G","H","I","L","K","M","F","S","T","W","Y","V")][ST][%s("A","R","N","D","C","Q","E","G","H","I","L","K","M","F","S","T","W","Y","V")]/
File.read("rosalind_mprt.txt").split("\r\n").each do |l|
	b = "http://www.uniprot.org/uniprot/" + l + ".fasta"
	doc = Hpricot(open(b))
	line = doc.to_s.split("\n")
	acid = line[1..-1].join("")	
	offset = 0
	r = []
	while i = acid.index(ss,offset)
		offset = (r << i + 1).last
	end
	if r.length >= 1
		puts l + "\n" + r.join(" ")
	end
end
puts "finish"








