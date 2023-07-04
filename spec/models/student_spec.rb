require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe "class methods" do
    describe "#average_age" do
      it "shows the average age of all students" do
        student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        student1 = Student.create!(name: "Harry", age: 19, house: "Slytherin")
        student2 = Student.create!(name: "Ron", age: 18, house: "Slytherin")
      
        expect(Student.average_age).to eq(17.0)
      end
    end

    describe "#alphabetical order" do
      it "sorts students by alphabetical order" do
        student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        student1 = Student.create!(name: "Harry", age: 19, house: "Slytherin")
        student2 = Student.create!(name: "Ron", age: 18, house: "Slytherin")
        student3 = Student.create!(name: "Elspeth", age: 33, house: "Hufflepuff")
        student4 = Student.create!(name: "Braden", age: 17, house: "Ravenclaw")
    
        expect(Student.alphabetical_order).to eq([student4, student, student3, student1, student2])
      end
    end
  end
end
