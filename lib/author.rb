class Author
  attr_reader :books

  def initialize(hash)
    @first_name = hash[:first_name]
    @last_name = hash[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, publication_date)
    book = Book.new({
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: publication_date
       })
    @books << book
    book
  end

  def start_writing
    @books.map do |book|
      book.publication_year
    end.min
  end

  def finish_writing
    @books.map do |book|
      book.publication_year
    end.max
  end
end
