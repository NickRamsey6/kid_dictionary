module Term
  class Word
    attr_reader :id
    attr_accessor :term

    @@words = {}
    @@total_rows = 0

    def initialize(attributes)
      @term = attributes.fetch(:term)
      @id = id || @@total_rows +=1
    end


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

    def self.find(id)
      @@words[id]
    end

    def definitions
      Define::Word.find_by_term(self.id)
    end
  end
end

module Define
  class Word
    attr_reader :id
    attr_accessor :definition, :term_id

    @@definitions = {}
    @@total_rows = 0

    def initialize(attributes)
      @definition = attributes.fetch(:definition)
      @term_id = attributes.fetch(:term_id)
      @id = id || @@total_rows +=1
    end

    def self.all
      @@definitions.values()
    end

    def self.clear
      @@definitions = {}
      @@total_rows = 0
    end

    def self.find(id)
      @@definitions[id]
    end

    def create
      @@definitions[self.id] = self
    end

    def delete
      @@definitions.delete(self.id)
    end

    def edit(definition)
      self.definition = definition
    end

    def term
      Term::Word.find(self.term_id)
    end

    def self.find_by_term(id)
      definitions = []
      @@definitions.values.each do |definition|
        if definition.term_id == id
          definitions.push(definition)
        end
      end
      definitions
    end
  end
end
