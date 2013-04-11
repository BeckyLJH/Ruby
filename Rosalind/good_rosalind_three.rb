#!usr/bin/env ruby
#coding:utf-8
usage = "#{$0} Solve the problem \"Complementing a Strand of DNA\" in Rosalind
Author:cure<http://rosalind.info/users/cure/>"

contents = File.read("rosalind_revc.txt")
outfile = File.new("result.txt","w")
# gsub还可以跟一个block
# gsub(/[block]/,{具体匹配规则})
outfile.puts contents.chomp.reverse.gsub(/[ACGT]/,{ 'A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C' })

# 贪婪匹配vs懒惰匹配
# 贪婪匹配(默认)：a.*b它将会匹配最长的以a开始，以b结束的字符串。对于aabab的匹配结果是aabab。
# 懒惰匹配：最短的匹配。例子：a.*?b对于aabab的匹配结果是aab和ab。
# /[]/ vs //
# /[]/:个体分散处理
# //:作为一个整体进行操作

# puts "原始:"+contents
# puts "贪婪:"+contents.gsub(/A.*C/,'0')
# puts "懒惰:"+contents.gsub(/A.*?C/,'0')
# puts "区别:"+contents.gsub(/[A.*C]/,'0')
# puts "区别:"+contents.gsub(/[A.*?C]/,'0')
