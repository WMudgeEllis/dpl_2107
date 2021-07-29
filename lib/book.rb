class Book
  attr_reader :title, :author, :checkout_count

  def initialize(hash)
    @title = hash[:title]
    @author = "#{hash[:author_first_name]} #{hash[:author_last_name]}"
    @publication_date = hash[:publication_date]
    @checkout_count = 0
  end

  def publication_year
    @publication_date[-4..-1]
  end

  def increase_count
    @checkout_count += 1
  end
end
