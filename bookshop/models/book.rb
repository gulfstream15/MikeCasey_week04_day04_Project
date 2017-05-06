require_relative( '../db/sql_runner' )

class Book

  attr_reader( :id )
  attr_accessor( :title )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
  end

  def save()
    sql = "INSERT INTO books (
      title
    ) VALUES (
      '#{ @title }'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM books"
    results = SqlRunner.run( sql )
    return results.map { |hash| Book.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM books"
    SqlRunner.run( sql )
  end

end