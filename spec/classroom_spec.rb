require_relative 'spec_helper'

describe Classroom do
  describe '#new' do
    let(:classroom) { Classroom.new(label: 'Science') }
    context 'when classroom is instantiated' do
      it 'should return an instance of Classroom' do
        expect(classroom).to be_an_instance_of Classroom
      end
      it 'should respond to students' do
        expect(classroom).to respond_to(:students)
      end
      it 'should respond to label' do
        expect(classroom).to respond_to(:students)
      end
      it 'should return label to be Science' do
        expect(classroom.label).to eq 'Science'
      end
      it 'should have students attribute' do
        expect(classroom).to have_attributes(students: [])
      end
    end
  end

  describe '#add_students' do
    classroom2 = Classroom.new(label: 'Art')
    student = Student.new(name: 'Elijah', age: 23, classroom: classroom2)
    student2 = Student.new(name: 'Ashkae', age: 22, classroom: classroom2)
    classroom2.add_students student
    classroom2.add_students student2
    context 'classroom' do
      it 'should return student' do
        expect(classroom2.students).to include(student)
      end
      it 'should have more than 1 student' do
        expect(classroom2.students.size).to be > 1
      end
    end
    context 'student' do
      it 'should belong to classroom2 ' do
        expect(student.classroom).to eq classroom2
      end
    end
  end
end
