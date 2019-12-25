require 'pry'
class Owner
  attr_reader :name, :species
  attr_accessor :pets, :dog, :cat
  @@all = []
  @@pets = {:dogs => [], :cats => []}
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def say_species
    return "I am a #{species}."
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
    @@pets[:cats] << new_cat
  end
  
  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
    @@pets[:dogs] << new_dog
  end
  
  def pets 
    @@pets
  end
  
  def walk_dogs()
    @@pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats()
    @@pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end
  
  def list_pets
    return "I have #{@@pets[:dogs].length} dog(s), and #{@@pets[:cats].length} cat(s)."
  end
  
  def sell_pets
    pets.each do |pet, pets|
      pets.map do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
      pets.clear
    end
  end
  
end