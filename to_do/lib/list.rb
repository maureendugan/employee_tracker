require 'pg'

class List
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def id
    @id
  end

  def ==(another_list)
   self.name == another_list.name
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      id = result['id']
      lists << List.new(name)
    end
    lists.each do |object|
      puts object.id.to_s + object.name.to_s
    end
  end

  def save
    results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

end
