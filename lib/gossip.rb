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
    all_gossips = [] 
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
  return all_gossips 
  end

  def self.find(id)
    all_gossips = Gossip.all
    return all_gossips[id]
  end

  def self.update(id)
    lines = File.readlines('./db/gossip.csv')
    lines.delete_at(id) 
    new_lines = lines
    File.open('./db/gossip.csv', 'w') {|file| file.truncate(0) }
    new_lines.each do |line|
      File.open('./db/gossip.csv', 'a') { |f| f.write line }
    end
  end

end