require_relative( '../db/sql_runner' )

class Author

  attr_reader( :first_name, :last_name, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name  = options['last_name']
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

  def self.all()
    sql = "SELECT * FROM authors"
    results = SqlRunner.run( sql )
    return results.map { |hash| Author.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM authors"
    SqlRunner.run( sql )
  end

end