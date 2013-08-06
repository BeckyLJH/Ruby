#!/usr/bin/env ruby
#coding:utf-8

usage = "Learning how is \"类和继承\"
Author: Jiahui Liu <beckyljh@gmail.com>, 2013/08/05"

class Person
  def initialize(name,age=18)
    @name = name
    @age = age
    @motherland = "China"
  end

  def talk
    puts "my name is " + @name + ",age is " + @age.to_s
    if @motherland == "China"
      puts "I am Chinese"
    else
      puts "I am foreigner"
    end
  end

  attr_writer:motherland
end
  
class Student < Person
  def talk 
    puts "I am a student,my name is " + @name + "age is " + @age.to_s
  end
end

p1 = Student.new("jiahui",21)
p1.talk
puts "\n"
p2 = Student.new("jiahui")
p2.talk




