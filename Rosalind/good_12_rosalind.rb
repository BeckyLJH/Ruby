#!usr/bin/env ruby
#coding:utf-8

usage = "#{$0} Solve the problem \" Overlap Graphs \"
Author: Yourself <http://rosalind.info/users/Yourself/>,2013/04/27"

# FASTA格式的巧妙切割
input = File.read("DNA.txt").split('>')[1..-1].map { |i| [i.split("\n").first, i.split("\n")[1..-1].join] }

input.each do |in1|
  (input - [in1]).each do |in2|
    if in2.last[0, 3] == in1.last[-3, 3]
      puts "#{in1.first} #{in2.first}"
    end
  end
end