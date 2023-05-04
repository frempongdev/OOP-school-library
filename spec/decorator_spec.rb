require './decorator'
require './nameable'
require './person'

describe Decorator do
  context 'test initialize method of the decorator class' do
    it 'should create a new object od the Decorator class' do
      decorator = Decorator.new(Nameable.new)

      expect(decorator).to be_an_instance_of(Decorator)
    end
  end

  context 'test correct_name method of the decorator class' do
    it 'should check if class has correct name' do
      nameable = Nameable.new
      decorator = Decorator.new(nameable)

      expect do
        decorator.correct_name
      end.to raise_error(NotImplementedError, 'Subclass must implement correct_name method')
    end
  end
end

describe CapitalizeDecorator do
  context 'test correct_name method of the CapitalizeDecorator class' do
    it 'should capitalize provided argument' do
      person = Person.new(35, 'trudy')
      capitalize = CapitalizeDecorator.new(person)
      expect(capitalize.correct_name).to eq('Trudy')
    end
  end
end

describe TrimmerDecorator do
  context 'test correct_name method of the TrimmerDecorator class' do
    it 'should trim provided argument' do
      person = Person.new(35, 'Trudy Mclean')
      trim = TrimmerDecorator.new(person)
      expect(trim.correct_name).to eq('Trudy Mcle')
      expect(trim.correct_name.length).to eq(10)
    end
  end
end
