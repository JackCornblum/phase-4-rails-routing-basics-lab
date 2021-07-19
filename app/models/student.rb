class Student < ApplicationRecord

  def to_s
    "#{first_name} #{last_name}"
  end

  def self.grades
    grades = Student.all.map do |student|
      student.grade
    end

    sorted_grades = grades.sort! {|x, y| y <=> x}
    sorted_students = sorted_grades.map do |grade|
      Student.find_by_grade(grade)
    end

    sorted_students
  end

end
