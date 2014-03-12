=begin

1.C given a number check wether it is perfect or not

Background: a perfect number is a positive integer that is equal to the sum of its proper positive divisors, that is, the sum of its positive divisors excluding the number itself (also known as its aliquot sum)

=end

number = 8128 # tested number

# test perfect numbers: 6, 28, 496, 8128, 33550336

#____________________________
# EXTENDED WAY
#____________________________
sum = 0
for i in 1..number
  if number % i == 0
    sum = sum + i
  end
end 

if number == sum/2
  puts "perfect number"
else
  puts "NOT perfect number"
end

# TODO: include a check to print an error if number is not integer
# TODO: include a check to print an error if number smaller than zero


##____________________________
## COMPACT WAY
##____________________________
sum = 0
(1..number-1).each{|i| sum += i if number % i == 0}
puts "#{"NOT " unless number == sum}perfect number"