class CreateJoinTableCollegesStudents < ActiveRecord::Migration[6.0]
  def change
    create_join_table :colleges, :students do |t|
      t.index [:college_id, :student_id]
      t.index [:student_id, :college_id]
    end
  end
end
