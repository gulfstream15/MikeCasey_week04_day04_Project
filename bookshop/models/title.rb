require_relative( '../db/sql_runner' )

class Title

  attr_reader( :book_title, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @book_title = options['book_title']
  end

  def save()
    sql = "INSERT INTO titles (
      book_title
    ) VALUES (
      '#{ @book_title }'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM titles"
    results = SqlRunner.run( sql )
    return results.map { |hash| Title.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM titles"
    SqlRunner.run( sql )
  end

end