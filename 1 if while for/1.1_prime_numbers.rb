=begin

1.A Given a number, tell whether it is prime

Background: prime numbers are those number greater than 1 and divisible only for 1 and themselves. Use the Eratosthenes' Method

=end

number = 7 # tested number

#____________________________
# EXTENDED WAY
#____________________________
is_prime = true
for i in 2..(number-1)
  remainder = number % i # get the remainder of the division

  if remainder == 0 # check if the iterator 'i' is a divisor of 'number'
    is_prime = false
    break
  end
end

if is_prime == true
  puts "the number is prime"
else
  puts "the number is NOT prime"
end

# TODO: add handling for 'number = 0' and 'number = 1' which are not prime numbers
# TODO: do the loop using a 'while' instead of a 'for'


##____________________________
## COMPACT WAY
##____________________________
is_prime = true

for i in 2..(number-1)
  is_prime = false if (number % i) == 0 # check if the iterator 'i' is a divisor of 'number'
  break unless is_prime
end

if is_prime
  puts "the number is prime"
else
  puts "the number is NOT prime"
end