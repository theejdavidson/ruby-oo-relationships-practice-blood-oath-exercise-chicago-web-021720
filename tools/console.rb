require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

heavens_gate = Cult.new(name: "Heavens gate", location: "Space", founding_year: 1974, slogan: "We're so excited for the Rapture!")

manson_fam = Cult.new(name: "Manson Family", location: "San Fernando Valley Ranch", founding_year: 1968, slogan: "Helter Skelter")

gary = Follower.new(name: "Gary", age: 42, life_motto: "Just here to party")
barry = Follower.new(name: "Barry", age: 43, life_motto: "I'm older than Gary")


p Cult.find_by_location("San Fernando Valley Ranch") == manson_fam
p Cult.find_by_founding_year(1974) == heavens_gate

heavens_gate.recruit_follower(gary)
gary.join_cult(manson_fam)

p gary.cults
p Follower.of_a_certain_age(43)
p heavens_gate.cult_population


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
