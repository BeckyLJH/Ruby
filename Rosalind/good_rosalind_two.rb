#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Transcribing DNA into RNA\" in Rosalind
Author:cure<http://rosalind.info/users/cure/>"

contents = File.read("rosalind_rna.txt")
#sub() VS gsub() => sub()只替换第一次匹配     gsub:global sub,匹配所有替换所有
puts contents.gsub(/[Tt]/,'U')