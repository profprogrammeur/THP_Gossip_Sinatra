class Gossip
  
  attr_accessor :author, :content 

  def initialize (author,content)
    @author = author
    @content = content
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [author, content]
    end
  end

  def self.all
    all_gossips = [] #on initialise un array vide
    CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips #on retourne un array rempli d'objets Gossip
  end

  def self.find(id)
    all_gossips = Gossip.all
    return all_gossips[id]
  end

  
 
end