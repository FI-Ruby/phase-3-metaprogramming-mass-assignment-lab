require "pry"
# class Animal
#     attr_accessor :name, :age, :species
#     @@all = []
#     def initialize(name, age, species)
#         @name = name
#         @age = age
#         @species = species
#         @@all << self
#     end
#     def self.all
#         @@all
#     end
# end

# cat = {
#     name: 'Rose',
#     age: 9,
#     species: 'catus'
# }
# cat = Animal.new(cat[:name], cat[:age], cat[:species])

# puts cat
# puts Animal.all
# puts cat.name

# class Animal
#     attr_accessor :name, :age, :species
#     @@all = []
#     def initialize(args)
#         @name = args[:name]
#         @age = args[:age]
#         @species = args[:species]
#         @@all << self
#     end
#     def self.all
#         @@all
#     end
# end

# cat = {
#     name: 'Rose',
#     age: 9,
#     species: 'catus'
# }
# cat = Animal.new(cat)

# puts cat
# puts Animal.all
# puts cat.name

class Animal
  attr_accessor :name, :age, :species
  @@all = []

  def initialize(args)
    args.each_key do |key, value|
      # binding.pry
      self.send("#{key}=", args[key]) #send attrr to class. Build a class with dynamic attrr
      #setter method above, pass the value to it
    end
    @@all << self
  end

  def self.all
    @@all
  end

  #method that builds other methods
  def self.method_builder(method)
    define_method(method) {
      "hello world"
    }
  end
end

cat = {
  name: "Rose",
  age: 9,
  species: "catus",
}
cat = Animal.new(cat)

# puts cat
# puts Animal.all
# puts cat.name
# puts Animal.method_builder('Hi')
# puts cat.Hi #method build

# def happy_birthday(name: "Beyonce", current_age: 31)
#Keyword args. name as hashes but reference them as barenwords
# def happy_birthday(name:, current_age:)
#   puts "Happy Birthday, #{name}"
#   current_age += 1
#   puts "You are now #{current_age} years old"
# end

# happy_birthday(current_age: 31, name: "Carmelo Anthony")

# #mass assignment
# class Person
#   attr_accessor :name, :age

#   def initialize(name:, age:)
#     @name = name
#     @age = age
#   end
# end

# person_attributes = { name: "Sophie", age: 26 }
# sophie = Person.new(person_attributes)
# puts sophie
# sophie = Person.new(**person_attributes) #the double splat operator (**)Links to an external site. to convert a hash to keyword arguments:
# puts sophie

class User
  # we don't want to do this anymore :(
  attr_accessor :name, :user_name, :age, :location, :bio
  binding.pry

  def initialize(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end

class User
  def initialize(attributes)
    attributes.each do |key, value|
      self.class.attr_accessor(key)  # create a getter and setter by calling the attr_accessor method
      self.send("#{key}=", value)
    end
  end
end
