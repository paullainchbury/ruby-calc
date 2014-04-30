require 'pry-byebug' 
# binding.pry

# Function definitions first
def menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, (m)ortgage, bm(i), (t)rip or (q)uit: "
  gets.chomp.downcase
end
 
def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  case operation
    when "a"
     result = add
    when "s"
      result = subtract
    when "m"
      result = multiply
    when "d"
      result = division
  end
  puts "the answer is #{result}"
  return_to_menu
end
    
def advanced_calc
  print "(s)qrt, (p)wr: "
  operation = gets.chomp.downcase
  if operation == "s"
    result = sqrt
  elsif operation == "p"
    result = power
  end
  puts "the answer is #{result}"
  return_to_menu
end

def return_to_menu
  puts "press return to go back to the menu"
  gets
end

# return_to_menu

def fetch_value
  puts "Please enter value"
  gets.to_f
end
  

def add
  num1 = fetch_value
  num2 = fetch_value
  num1 + num2
end

def multiply
  num1 = fetch_value
  num2 = fetch_value
  num1 * num2
end

def division
  num1 = fetch_value
  num2 = fetch_value
  num1 / num2
end

def subtract
  num1 = fetch_value
  num2 = fetch_value
  num1 - num2
end

def sqrt
  Math.sqrt(fetch_value)
end

def power
  num1 = fetch_value
  num2 = fetch_value
  num1 ** num2
end

def mortgage

  puts "Enter your loan amount"
  loan = gets.to_i
  puts "What's the interest rate?"
  rate = gets.to_f/100
  puts "How many years is your mortgage over?"
  months = gets.to_i*12
  interest = (1+rate/12)**(12/12)-1
  capital = (1-(1/(1+interest))**months)/interest
  payment = loan/capital
  puts "Your monthly payment will be £%.2f" % [payment]
  return_to_menu
end

def bmi
  puts "Would you like to enter your details in (m)etric or (i)mperial?: "
  operation = gets.chomp.downcase
    print "Enter your height in "; if operation == "m" then puts "metres" else puts "inches" end
    height = gets.to_f
    puts "Enter your weight: "
    weight = gets.to_f
    bmi = (weight/(height * height))
    if operation == "i"
      bmi = (bmi*703).to_i
    end
  puts "Your bmi is #{bmi}."
  return_to_menu
end

def trip
  puts "How far will you drive (in miles)?"
  distance = gets.to_f
  puts "What is the fuel efficiency of the car?"
  mpg = gets.to_f
  puts "How much does petrol cost per gallon?"
  cost = gets.to_f
  puts "How fast do you drive (mph)? "
  speed = gets.to_f
  if speed > 60
      mpg = mpg - ((speed - 60)*2)
    end
  time_driving = distance / speed
  cost_of_journey = (cost/mpg)*distance
  # puts "Your journey will take #{time_driving} hours and cost £#{cost_of_journey}"
  puts "Your journey will take %.2f hours and cost £%.2f" % [time_driving, cost_of_journey]
  return_to_menu
end

# run the app...
response = menu 
while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  when 'm'
    mortgage
  when 'i'
    bmi
  when 't'
    trip
  end
  response = menu
end

