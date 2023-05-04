require_relative '../person'

describe Person do
  context "testing initialize method of person class" do
    it "should create an object of the person class" do
      person = Person.new(33)

      expect(person.age).to eq(33)
      expect(person.name).to eq('Unknown')
      expect(person.correct_name).to eq('Unknown')
      expect(person.correct_name).to eq('Unknown')
    end
  end

  context "testing correct name method of person class" do
    it "should return the correct name" do
      person = Person.new(33)

      expect(person.correct_name).to eq('Unknown')
    end
  end
  context "testing can_use_services method of person class" do
    it "should return true if person can use services" do
      person = Person.new(33)

      expect(person.can_use_service?).to eq(true)
    end
  end
end