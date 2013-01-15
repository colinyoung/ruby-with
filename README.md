## A `with` keyword for Ruby
#### (That has nothing to do with python's `with` keyword)

[![Build Status](https://travis-ci.org/colinyoung/ruby-with.png?branch=master)](https://travis-ci.org/colinyoung/ruby-with)

`with` lets you seamlessly make any object the current context.

### Why

I'm tired of doing this:

```ruby
users.each do |user|
  puts user.name
end
```

Or things like this:

```ruby
Project.new.tap do |proj|
  proj.name = "hello"
  proj.owner = owner
  proj.created_at = Time.now
end
```

So I made it way more -- well, Ruby-ish.

```ruby
with Project.new do
  puts "A project called #{name}
  		was started by #{owner}
  		at #{created_at}."
end
```

### The `with` keyword

> Note: Ruby 1.9x only for now!

![](http://i.imgur.com/0FIK5.png)

To access object variables without typing `self`, just call `with` on that object:

```ruby
users.each do |user|
  with user do
    puts name
  end
end
```

To SET the object's variables, use the usual `self.attribute = val` method, or one 
of two provided methods that can make that far less annoying:

```ruby
with user do
  set name: 'Leo'
  puts name # => Leo
  
  # OR
  self <= { name: 'CJ' }
  
  # Of course you can still do it the original way
  # (which is exactly what the above two methods do behind-the-scenes)
  self.name = "Jed"
end
```

### Use it!

You have two options to use ruby-with in your app:

1. Keyword-level integration (make `with` available everywhere, because why not?):

   ```ruby
   # In your Gemfile
   gem 'ruby-with', require: 'ruby-with/global'
   ```
2. On a class-by-class basis:
   
   ```ruby
   # In your Gemfile
   gem 'ruby-with'
   
   # MyClass
   class MyClass
     include RubyWith::With
   end
   ```
   
### Advanced

You can call `with` with an optional second argument (a Hash) that will be `set` before all your code is run.

```ruby
with Dog.new, name: 'Rue' do
  puts name # => Rue
end
```

Or, if you need access to your current context (kind of like inverting your existing code), you can do this:

```ruby
class Dog < Pet

  belongs_to :owner

  attr_accessor :name
  
  def initialize(name)
    self.name = name
  
	with owner do |dog|
	  dog.name = "#{dog.name} #{last_name}" # => looks like 'DogName OwnerLastName'
	end
  end
end

```

It's kind of a contrived example, but I'm sure it'll come in handy.

### Changelog

* **Release 0.2:** Added setters and new documentation.