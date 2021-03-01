require 'pry'
class Owner
  attr_reader :name, :species

  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
    # can say its species
  end

  def self.all
    @@all
    # .all returns all instances of Owner that have been created
  end

  def self.count
    @@all.count
    # .count returns the number of owners that have been created
  end

  def self.reset_all
    @@all.clear
    # .reset_all can reset the owners that have been created
  end

  def cats
    Cat.all.select {|cat| cat.owner == self} 
    # returns a collection of all the cats that belong to the owner
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
    # returnsa a collection of all the cats that belong to the owner

  end

  def buy_cat(name)
    Cat.new(name, self)
    #   can buy a cat that is an instance of the Cat class
    #   knows about its cats
  end

  def buy_dog(name)
    Dog.new(name, self)
    #   can buy a dog that is an instance of the Dog class
    #   knows about its dogs
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
   #   walks the dogs which makes the dogs' moods happy
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
    # feeds cats which makes the cats' moods happy
  end

  def sell_pets
    dogs.each {|dog| dog.mood = "nervous"} 
    dogs.each {|dog| dog.owner = nil} 
    cats.each {|cat| cat.mood = "nervous"}
    cats.each {|cat| cat.owner = nil}
    #   can sell all its pets, which makes them nervous
    #   can sell all its pets, which leaves them without an owner
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    # can list off its pets
  end
end

# a = Owner.new("Alex")
# b = Owner.new("Bob")
# c = Owner.new("Charles")
# binding.pry
# 0

    # #cats
    # returnsa a collection of all the cats that belong to the owner
    # #dogs
    #   returnsa a collection of all the dogs that belong to the owner
    # #buy_cat
    #   can buy a cat that is an instance of the Cat class
    #   knows about its cats
    # #buy_dog
    #   can buy a dog that is an instance of the Dog class
    #   knows about its dogs
    # #walk_dogs
    #   walks the dogs which makes the dogs' moods happy
    # #feed_cats
    #   feeds cats which makes the cats' moods happy
    # #sell_pets
    #   can sell all its pets, which makes them nervous
    #   can sell all its pets, which leaves them without an owner
    # #list_pets
    #   can list off its pets
