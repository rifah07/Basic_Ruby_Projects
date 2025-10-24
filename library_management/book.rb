=begin
Book class should have:
 - Attributes: title, author, isbn, availability status
 - Methods: to_s for string representation, available? predicate method
 - Consider adding: genre, publication_year, checked_out_by, due_date
=end

class Book
  attr_accessor :availability_status
  attr_reader :title, :author, :year, :isbn

  def initialize(title, author, isbn, year)
    @title = title
    @author = author
    @isbn = isbn
    @year = year
    @availability_status = :available
  end

  def to_s
    "#{title} by #{author} (#{year}) - ISBN: #{isbn}"
  end

  def available?
    @availability_status == :available
  end
end
