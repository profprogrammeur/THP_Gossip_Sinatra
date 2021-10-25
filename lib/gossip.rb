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

  def self.update(id)
    lines = File.readlines('./db/gossip.csv')
    lines.delete_at(id) #lines.delete_at(index-1)
    new_lines = lines
    File.open('./db/gossip.csv', 'w') {|file| file.truncate(0) }
    new_lines.each do |line|
      File.open('./db/gossip.csv', 'a') { |f| f.write line }
    end
  end

#   def delete(id)
#     lines = File.readlines('./db/gossip.csv')
#     lines.delete_at(id) #lines.delete_at(index-1)
#     new_lines = lines
# puts = "OOOOOOOOOOOOOOOOOIIIIIIIIIIIIIIOOOOOOOOOOOOOO"
#     File.open('./db/gossip.csv', 'w') {|file| file.truncate(0) }

#     new_lines.each do |line|
#       File.open('./db/gossip.csv', 'a') { |f| f.write line }
#     end
#   end
  
 
end