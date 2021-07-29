class Library
  attr_reader :books, :authors, :name

  def initialize(name)
    @name = name
    @books = []
    @authors = []
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

end
