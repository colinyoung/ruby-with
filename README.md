## A `with` keyword for Ruby
#### (That has nothing to do with python's `with` keyword)

`with` lets you seamlessly make any object the current context.

### Why

I'm tired of doing this:

```
users.each do |user|
  puts user.name
end
```

Or things like this:

```
Project.new.tap do |proj|
  proj.name = "hello"
  proj.owner = owner
  proj.created_at = Time.now
end
```

So I made it way more -- well, Ruby-ish.

### The `with` keyword

![](http://i.imgur.com/5s6S3.png)

To use, just call `with`:

```
users.each do |user|
  with user do
    puts name
  end
end
```

You have two options to use ruby-with in your app:

1. Keyword-level integration (make `with` available everywhere, because why not?):

   ```
   # In your Gemfile
   gem 'ruby-with', require: 'ruby-with/global'
   ```
2. On a class-by-class basis:
   
   ```
   # In your Gemfile
   gem 'ruby-with'
   
   # MyClass
   class MyClass
     include RubyWith::With
   end
   ```
   
### Advanced

You can call `with` with an optional second argument (a Hash) that will be `set` before all your code is run.

```
with Dog.new, name: 'Rue' do
  puts name # => Rue
end
```

Or, if you need access to your current context (kind of like inverting your existing code), you can do this:

```
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