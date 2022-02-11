
name = "Joseph"
completed_message = "este es un mensaje de #{name}"

new_message = completed_message.gsub("Joseph","John") # To replace and give a copy assigned to new_message

completed_message.gsub!("Joseph","John") # To replace and assign to completed_message, just need to add ! on gsub method

# Symbols
# A symbol is created just one time
# color and color2 have the same object_id, because they point to the same symbol

color = :red
color.object_id

color2 = :red
color2.object_id

# Arrays

array1 = ["a","b","c","d"]
array1.count { |x| x=="c"} # => 1

array2 = [1,2,3,4,5,6,7]
array2.count { |x| x.even?} # => 3
array2.map {|x| x*2} # => [2, 4, 6, 8, 10, 12, 14]  .map transform each element to a new array
array2.select {|x| x.even?} # => [2, 4, 6] .select just get the elements on a new array

m1 = "message to test split"
m1.split(" ") # => ["message", "to", "test", "split"]
m1.split(" ").map {|x| x.upcase} # => ["MESSAGE", "TO", "TEST", "SPLIT"]
m1.split(" ").map {|x| x.upcase}.join("-") # => "MESSAGE-TO-TEST-SPLIT"

array3 = ["b","d","a","c"]
array3.sort

# Hashes
capitals = {"Mexico" => "Mexico city"}

capitals["Colombia"] = "Bogota"

puts capitals

capitals.has_value? "Bogota" # true
puts capitals.invert # {"Mexico city"=>"Mexico", "Bogota"=>"Colombia"}

capitals.merge!({"España" => "Madrid"}) # with ! , you apply the change to the current array
puts capitals

capitals.transform_values {|x| x.upcase} #{"Mexico"=>"MEXICO CITY", "Colombia"=>"BOGOTA", "España"=>"MADRID"}

capitals.map {|k,v| "city: #{k} , capital: #{v}" }
# city: Mexico , capital: Mexico city
# city: Colombia , capital: Bogota
# city: España , capital: Madrid

array4 = [["jonh",5],["brett",6],["ben",7]]
new_hash = array4.to_h # {"jonh"=>5, "brett"=>6, "ben"=>7}

new_hash.include? "brett" #true
new_hash["brett"] # 6

new_hash.select {|k,v| v.even?} # {"brett"=>6}

has2 =  new_hash.map {|k,v| [k, v*2 ]}.to_h # {"jonh"=>10, "brett"=>12, "ben"=>14}
puts has2

#Ranges

(1..10) # inclusive range, from 1 to 10
(1...10) # exclusive range, from 1 to 9

(1..10).each {|x| puts x} 

(1..10).map {|x| x*2}

(1..10).select {|x| x.odd? }

("a".."d").each {|x| puts x} # Range of letters

#Regex

is_gmail_regex = /\w+@gmail.com/
email = "jacob@gmail.com"
puts email.match is_gmail_regex

#Proc

saludar = Proc.new { |x| puts "Hola #{x}"}

saludar.call("Julio")

class Transaction
    def exec
        puts "Executing transaction"
        if block_given?
            yield
        end

    end
end

tx = Transaction.new
tx.exec

tx2 = Transaction.new
tx.exec { puts "Execution block given"}

# OOP

class Person
    def initialize(name, age)
        @name = name
        @age = age 
    end

    def name # getter
        @name
        self
    end

    def name=(name) # setter
        @name = name
    end

    def self.suggestion_names # method of class | static class method, no related to a instance of this class
        ["Joseph","Kyle","Lenard"]
    end
end

p1 = Person.new("Joshua", 3)
p1.name = "Josua Walton"
# p1.age = 5 # Error on this case, because , setter age is not defined
puts p1.name
puts Person.suggestion_names

# OOP - attr_accessor. attr_accessor is a macro on ruby

class Employee
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age 
    end

    def self.suggestion_names # method of class | static class method, no related to a instance of this class
        ["Joseph","Kyle","Lenard"]
    end
end

p1 = Employee.new("Joshua", 3)
p1.name = "Josua Walton"
p1.age = 5
puts p1.name
puts Employee.suggestion_names

# Modules

module Models
    class Person
        def exec
            puts "Models.Person.exec"
        end
    end

    class Car
        def run
            puts "Models.Car.run"
        end
    end
end

module Reports
    class Excel
        def exec
            puts "Reports.Excel.exec"
        end
    end
end

excel = Reports::Excel.new
excel.exec

# Boundle

# 1. Execute this command to create the Gemfile:
# bundle init 

# 2. Inside Gemfile, I will find this site, there I can check several gems:
# https://rubygems.org/

# 2.1 Another recommended site:
# https://www.ruby-toolbox.com/

# 3. On https://rubygems.org/, look for 'faker', and copy its line to add on Gemfile.
# Write on Gemfile:
# gem 'faker', '~> 2.19'

# 4. Execute this command to install the gems defined on Gemfile
# bundle install

# 5. After the instalation, a Gemfile.lock is created, its a file that constains the current gems installed

# 6. On command line > irb , you can write:
require 'faker'
# and then explore:
# Faker::Movies::HarryPotter.methods

puts Faker::Movies::HarryPotter.spell

# 7. To ensure to use the gem defined on Gemfile, execute your program as: bundle exec ruby Exercises.rb

# Testing on Ruby

class Calculator
    def sum(a,b)
        a + b
    end

    def substract(a,b)
        a - b
    end
end

calc = Calculator.new
puts calc.sum(2,5)

# Manual test:
test = {[2,5]=>7, [2,1]=>3 }

test.each { |k,v|
    if calc.sum(k[0],k[1]) != v
        puts "Error"
    end
}

# testing with Minitest
require 'minitest/autorun' # To run automaticly the test

class TestCalculator < Minitest::Test
    def setup
        @cal = Calculator.new
    end

    def test_positive_numbers_sum()
        result = @cal.sum(3,4)
        assert_equal result, 7
    end
end