require ('rspec')
require ('pry')
require ('word')

describe('#Word') do
  before(:each) do
    Word.clear()
  end

  describe('.create') do
    it('creates a new word') do
      test_word = Word.new(:term =>'word')
      test_word.create
      @list_of_words = Word.all
      expect(@list_of_words).to(eq([test_word]))
    end
  end

  describe('.delete') do
    it('deletes a created word') do
      test_word = Word.new(:term =>'word')
      test_word.create
      test_word.delete
      @list_of_words = Word.all
      expect(@list_of_words).to(eq([]))
    end
  end

  describe('.edit') do
    it('edits a created word') do
      test_word = Word.new(:term =>'word')
      test_word.create
      test_word.edit('noun')
      expect(test_word.term).to(eq('noun'))
    end
  end



end
