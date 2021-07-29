class Library
  attr_reader :books, :authors, :name, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    add_books_by_author(author)
  end

  def add_books_by_author(author)
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    {
      start: author.start_writing,
      end: author.finish_writing
    }
  end

  def checkout(book)
    if !@books.include?(book)
      return false
    elsif @books.include?(book)
      @checked_out_books << book
      @books.delete(book)
      book.increase_count
      return true
    end
  end

  def return(book)
    @books << book
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @books.max_by do |book|
      book.checkout_count
    end
  end
end
