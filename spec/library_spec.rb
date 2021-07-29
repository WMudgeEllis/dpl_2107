require './lib/library'
require './lib/author'

RSpec.describe Library do


  it 'can pass iteration 3' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.name).to eq("Denver Public Library")
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
    expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})

    test_book = harper_lee.write("Test title", "July 11, 1950")

    expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1950", :end=>"1960"})
  end

  it 'can pass iteration 4' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    expect(dpl.checkout(mockingbird)).to eq(false)
    expect(dpl.checkout(jane_eyre)).to eq(false)

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.checkout(jane_eyre)).to eq(true)
    expect(dpl.checked_out_books).to eq([jane_eyre])

    expect(dpl.checkout(jane_eyre)).to eq(false)

    dpl.return(jane_eyre)

    expect(dpl.checked_out_books).to eq([])

    dpl.checkout(jane_eyre)
    dpl.checkout(villette)

    expect(dpl.checked_out_books).to eq([jane_eyre, villette])

    dpl.checkout(mockingbird)

    expect(mockingbird.checkout_count).to eq(1)

    dpl.return(mockingbird)

    dpl.checkout(mockingbird)

    dpl.return(mockingbird)

    expect(dpl.most_popular_book).to eq(mockingbird)
  end

end
