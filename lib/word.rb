class Word
  attr_reader :id
  attr_accessor :term

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @term = attributes.fetch(:term)
    @id = id || @@total_rows +=1
  end
  # def iniitalize(term, id)
  #   @term = term
  #   @id = id || @@total_rows +=1
  # end

  def self.all
    @@words.values()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def create
    @@words[self.id] = self
  end

  def delete
    @@words.delete(self.id)
  end

  def edit(term)
    self.term = term
  end
end
