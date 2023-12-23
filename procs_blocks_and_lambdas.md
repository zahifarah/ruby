# Understanding Blocks, Procs, and Lambdas in Ruby

This document provides a summary of the differences and nuances between blocks, procs, and lambdas in Ruby, accompanied by simple but illustrative code examples.

## Block

A block in Ruby is a chunk of code that you can pass to a method. Blocks can be defined with either the `do...end` syntax or curly braces `{...}`. They are used with methods like `each`, `map`, and custom methods that yield to blocks.

### Example: Using a Block with a Custom Method

```ruby
def block_greet
  puts "Inside block greet: 1"
  yield
  puts "Inside block greet: 2"
end

block_greet do
  puts "Yield called!"
end
```

In this example, `block_greet` yields to the block provided when called. The `yield` keyword is used to invoke the block.

---

## Proc

A `Proc` (short for procedure) is an encapsulation of a block of code, which can be stored in a variable, passed to methods, and executed. Unlike blocks, procs can be reused and can be called with the `.call` method.

### Example: Using a Proc

```ruby
my_proc = Proc.new do
  puts "Proc called!"
end

def proc_greet(proc_object)
  puts "Inside proc greet: 1"
  proc_object.call
  puts "Inside proc greet: 2"
end

proc_greet(my_proc)
```

Here, `my_proc` is a `Proc` object. The `proc_greet` method takes this `Proc` as an argument and calls it within the method.

---

## Lambda

Lambdas in Ruby are similar to procs but differ primarily in two ways: how they handle return statements and the strictness in the number of arguments.

### Example: Using a Lambda

```ruby
# Shorthand syntax
# my_lambda = -> { puts "Lambda called!" }

my_lambda = lambda do
  puts "Lambda called!"
end

def lambda_greet(lambda_object)
  puts "Inside lambda greet: 1"
  lambda_object.call
  puts "Inside lambda greet: 2"
end

lambda_greet(my_lambda)
```

In this example, `my_lambda` is a lambda. It is called within `lambda_greet` using the `.call` method, similar to a proc. However, lambdas check the number of arguments passed and have different behavior when using `return`.

---

## Difference in Handling Returns

One key difference between procs and lambdas is how they handle the `return` keyword.

### Proc and Return

When a `return` is encountered inside a proc, it exits not only from the proc but also from the enclosing method.

```ruby
def test_proc_return
  my_proc = Proc.new { return "Returned from proc!" }
  my_proc.call
  "This will not be executed"
end

puts test_proc_return # Outputs "Returned from proc!"
```

### Lambda and Return

In contrast, a `return` inside a lambda exits only from the lambda itself, not from the enclosing method.

```ruby
def test_lambda_return
  my_lambda = lambda { return "Returned from lambda!" }
  my_lambda.call
  "This will be executed"
end

puts test_lambda_return # Outputs "This will be executed"
```

This difference in behavior can influence the choice between using a proc or a lambda, depending on the desired flow control in your application.

---

## Key Differences

- **Blocks** are simple, unnamed pieces of code passed to methods.
- **Procs** are objects, can be stored in variables, and used multiple times. They don't care about the number of arguments and can return from the method enclosing them.
- **Lambdas** are like procs but enforce the number of arguments and return from the lambda itself, not the enclosing method.
```

