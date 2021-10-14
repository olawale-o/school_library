require_relative 'spec_helper'

describe Student do
  describe '#new' do
    let(:classroom) { Classroom.new(label: 'classroom') }
    let(:classroom2) { Classroom.new(label: 'classroom2') }
    let(:student) { Student.new(age: 16, name: 'Mark', classroom: classroom) }
    context 'when student is instantiated' do
      it 'should return an instance of Student' do
        expect(student).to be_an_instance_of Student
      end
      it 'should be kind of Person' do
        expect(student).to be_kind_of Person
      end
      it 'should be belong to classroom' do
        expect(student.classroom).to eq classroom
      end
      it 'should not be belong to classroom2' do
        expect(student.classroom).not_to eq classroom2
      end
    end
  end

  describe '#play_hooky' do
    let(:classroom) { Classroom.new(label: 'classroom') }
    let(:student) { Student.new(age: 16, name: 'Mark', classroom: classroom) }
    it 'should return ¯\(ツ)/¯' do
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
