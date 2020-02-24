class Follower
    # can join many cults
    attr_accessor :name, :age, :life_motto
    @@all = []
  
    def initialize(name:, age:, life_motto:)
      @name = name
      @age = age
      @life_motto = life_motto
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def cults
      oaths = BloodOath.all.select do |blood_oath|
        blood_oath.follower == self
      end
  
      oaths.map do |oath|
        oath.cult
      end
    end
  
    def join_cult(cult)
      BloodOath.new(cult: cult, follower: self, initiation_date: Time.now)
    end
  
    def self.of_a_certain_age(min_age)
      Follower.all.select do |follower|
        follower.age >= min_age
      end
    end
    
  end