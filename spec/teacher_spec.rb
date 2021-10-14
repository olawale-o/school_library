require_relative 'spec_helper'

describe Teacher do
  let(:teacher) { Teacher.new(age: 52, name: 'Osunde', specialization: 'literature') }
  describe '#new' do
    context 'when teacher is instantiated' do
      it 'should return an instance of Teacher' do
        expect(teacher).to be_an_instance_of Teacher
      end
      it 'should be kind of Person' do
        expect(teacher).to be_kind_of Person
      end
    end
  end

  describe '#can_use_services' do
    it 'should return true' do
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
