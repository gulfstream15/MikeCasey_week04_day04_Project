require_relative( '../db/sql_runner' )
require_relative( './author' )

class Book

  attr_reader( :id )
  attr_accessor( :title, :quantity, :author_id,  )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @author_id = options['author_id'].to_i
    @stock_level = options['stock_level']
  end

  def save()
    sql = "INSERT INTO books (
      title,
      quantity,
      author_id
    ) VALUES (
      '#{ @title }',
       #{ @quantity },
       #{ @author_id }
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

  def author()
    sql = "SELECT * FROM authors 
    WHERE id = #{@author_id}"
    author = SqlRunner.run(sql)
    result = Author.new( author.first )
    return result
  end

  def stock_level()
    if (@quantity >=0 && @quantity < 10)
      @stock_level = "low"
    elsif ( @quantity >= 10 && @quantity < 30 )
      @stock_level = "medium"
    elsif ( @quantity >= 30)
          @stock_level = "high"
    end
    return @stock_level
  end

  # def Book.find( id )
  #     sql = "SELECT * FROM books WHERE id=#{id};"
  #     book = SqlRunner.run( sql )
  #     result = Book.new( book.first )
  #     return result
  # end

end