class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
  end
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name,type)
  end
  def self.find(id,db)
    record=db.execute("select * from pokemon where id = (?)",id)
    Pokemon.new(id: record[0][0],name: record[0][1], type: record[0][2], db: db)
  end
  def alter_hp(hp,db)
    db.execute("update pokemon set hp = 0 where id = (?)",1)
  end

end
