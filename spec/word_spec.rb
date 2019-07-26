require ('rspec')
require ('pry')
require ('word')

describe('#Term') do
  before(:each) do
    Term::Word.clear()
  end

  describe('.create') do
    it('creates a new word') do
      test_word = Term::Word.new(:term =>'word')
      test_word.create
      @list_of_words = Term::Word.all
      expect(@list_of_words).to(eq([test_word]))
    end
  end

  describe('.delete') do
    it('deletes a created word') do
      test_word = Term::Word.new(:term =>'word')
      test_word.create
      test_word.delete
      @list_of_words = Term::Word.all
      expect(@list_of_words).to(eq([]))
    end
  end

  describe('.edit') do
    it('edits a created word') do
      test_word = Term::Word.new(:term =>'word')
      test_word.create
      test_word.edit('noun')
      expect(test_word.term).to(eq('noun'))
    end
  end

end

describe('#Define') do
  before(:each) do
    Define::Word.clear()
  end

  describe('.create') do
    it('creates a new definition') do
      test_def = Define::Word.new(:definition =>'as much food as one man can hold', :term_id => '1')
      test_def.create
      @definitions = Define::Word.all
      expect(@definitions).to(eq([test_def]))
    end
  end

  describe('.delete') do
    it('deletes a created word') do
      test_def = Define::Word.new(:definition =>'as much food as one man can hold', :term_id => '1')
      test_def.create
      test_def.delete
      @definitions = Define::Word.all
      expect(@definitions).to(eq([]))
    end
  end

  describe('.edit') do
    it('edits a created word') do
      test_def = Define::Word.new(:definition =>'as much food as one man can hold', :term_id => '1')
      test_def.create
      test_def.edit('the meal between breakfast and dinner')
      expect(test_def.definition).to(eq('the meal between breakfast and dinner'))
    end
  end
end
