class CreateExamsStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :exams_students do |t|
      t.references :exam, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
    end
  end
end
