class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    if self.partner.class != Person
      begin
        raise PartnerError
      rescue => error
        error.message
      else
        person.partner = self
      end
    end
  end

  class PartnerError < StandardError
    def message
      puts "you cant marry a name!"
    end
  end
end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name
