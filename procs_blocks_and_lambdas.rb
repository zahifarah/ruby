# Block

def block_greet
  puts "Inside block greet: 1"
  yield
  puts "Inside block greet: 2"
end

block_greet do
  puts "Yield called!"
end

# ------------------------------------
# ------------------------------------

# Proc

my_proc = Proc.new do
  puts "Proc called!"
end

def proc_greet(proc_object)
  puts "Inside proc greet: 1"
  proc_object.call
  puts "Inside proc greet: 2"
end

proc_greet(my_proc)

# ------------------------------------
# ------------------------------------

# Lambda

# Shorthand syntax
# my_lambda = -> { puts "Lambda called!" }

my_lambda = lambda do
  puts "Lambda called!"
end

def lambda_greet(lambda_object)
  puts "Inside greet: 1"
  lambda_object.call
  puts "Inside greet: 2"
end

lambda_greet(my_lambda)
