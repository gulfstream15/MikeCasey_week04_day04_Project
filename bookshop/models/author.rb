require_relative( '../db/sql_runner' )

class Author

  attr_reader( :id )
  attr_accessor(  :first_name, :last_name)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name  = options['last_name']
    @full_name  = options['full_name']
  end

  def save()
    sql = "INSERT INTO authors (
      first_name, 
      last_name
    ) VALUES (
      '#{ @first_name }',
      '#{ @last_name }'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = " UPDATE authors SET (
      first_name, 
      last_name
    ) = (
      '#{ @first_name }',
      '#{ @last_name }'
    ) WHERE id = #{ @id };"
    SqlRunner.run(sql)
  end
  
  def author_full_name()
    @full_name = "#{@first_name} " + "#{@last_name}"
    return @full_name
  end

  def self.all()
    sql = "SELECT * FROM authors"
    results = SqlRunner.run( sql )
    return results.map { |hash| Author.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM authors"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM authors WHERE id=#{ @id };"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM authors;"
    authors = SqlRunner.run( sql )
    result = authors.map { |author| Author.new( author ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM authors WHERE id=#{id};"
    author = SqlRunner.run( sql )
    result = Author.new( author.first )
    return result
  end

end