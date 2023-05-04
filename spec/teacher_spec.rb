require './teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new('Math', 44, 'Dave')
  end

  context 'testing initialize method of the Teacher class' do
    it 'should create a new object of the Teacher class' do
      expect(@teacher.name).to eq('Dave')
      expect(@teacher.specialization).to eq('Math')
    end
  end

  context 'testing can_use_service method of the Teacher class' do
    it 'should check if can_use_service returns true' do
      expect(@teacher.can_use_service?).to eq(true)
    end
  end

  context 'testing all method of the Teacher class' do
    it 'should populate teacher global array' do
      Teacher.new('Science', 60, 'Mark')
      Teacher.new('Math', 32, 'Jenny')

      expect(Teacher.all.length).to eq(5)
      expect(Teacher.all.empty?).to eq(false)
    end
  end
end
