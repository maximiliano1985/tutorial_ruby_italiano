=begin

1.B given two numbers check wether they are amicable numbers or not

Background: Amicable numbers are two numbers so related that the sum of the proper divisors of the one is equal to the other, unity being considered as a proper divisor but not the number itself.

=end

# tested numbers
number_a = 220
number_b = 284

# test amicable numbers: (220, 284), (1184, 1210), (2620, 2924), (5020, 5564), (6232, 6368)

#____________________________
# EXTENDED WAY
#____________________________
sum_a = 0
sum_b = 0
for i in 1..number_a
  if number_a % i == 0
    sum_a = sum_a + i
  end
end

for i in 1..number_b
  if number_b % i == 0
    sum_b = sum_b + i
  end
end

if sum_a == sum_b
  puts "amicable numbers"
else
  puts "NOT amicable numbers"
end

# TODO: include a check to print an error if number_a == number_b
# TODO: include a check to print an error if number_a and number_b are NOT integers
# TODO: include a check to print an error if number_a and number_b smaller than zero

##____________________________
## COMPACT WAY
##____________________________
sum_a = 0
sum_b = 0
number_a.times{|i| i+=1; sum_a += i if number_a % i == 0}
number_b.times{|i| i+=1; sum_b += i if number_b % i == 0}
puts "#{"NOT " unless sum_a==sum_b}amicable numbers"