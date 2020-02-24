class Cult
    # has many followers
    attr_accessor :name, :location, :founding_year, :slogan
    @@all = []
  
    def initialize(name:, location:, founding_year:, slogan:)
      @name = name
      @location = location
      @founding_year = founding_year
      @slogan = slogan
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.find_by_name(name)
      Cult.all.find do |cult|
        cult.name == name
      end
    end
  
    def self.find_by_location(location)
      Cult.all.select do |cult|
        cult.location == location
      end
    end
    
    def self.find_by_founding_year(founding_year)
      Cult.all.select do |cult|
        cult.founding_year == founding_year
      end
    end
    
    def recruit_follower(follower)
      BloodOath.new(cult: self, follower: follower, initiation_date: Time.now)
    end
  
    def cult_population
      oaths = BloodOath.all.select do |oath|
        oath.cult == self
      end
      oaths.size
    end
  end