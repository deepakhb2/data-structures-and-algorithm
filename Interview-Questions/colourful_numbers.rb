=begin
Objective: Given a number, find out whether its colorful or not.

Colorful Number: When in a given number, product of every digit of a sub-sequence are different. That number is called Colorful Number. See Example

Example:

Given Number : 3245
Output : Colorful
Number 3245 can be broken into parts like 3 2 4 5 32 24 45 324 245.
this number is a colorful number, since product of every digit of a sub-sequence are different.
That is, 3 2 4 5 (3*2)=6 (2*4)=8 (4*5)=20, (3*2*4)= 24 (2*4*5)= 40

Given Number : 326
Output : Not Colorful.
326 is not a colorful number as it generates 3 2 6 (3*2)=6 (2*6)=12.
ref: https://algorithms.tutorialhorizon.com/colorful-numbers/
=end

input = 3245

def power_set(number)
  numbers = number.to_s.split('')
  power_set = []
  for i in (0...numbers.size)
    for j in (i...numbers.size)
      power_set.push(numbers[i..j])
    end
  end
  return power_set
end

def colorful_number?(number)
  power_set = power_set(number)
  digits = {}
  power_set.each do |set|
    digit = set.inject(1){|prod, num| prod * num.to_i}
    if(digits[digit])
      return 'No'
    else
      digits[digit] = digit
    end
  end
  return 'Yes'
end

p "#{3245} is colourful?"
p colorful_number?(3245)
p "#{326} is colourful?"
p colorful_number?(326)

