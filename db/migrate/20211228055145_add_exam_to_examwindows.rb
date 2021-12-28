class AddExamToExamwindows < ActiveRecord::Migration[6.0]
  def change
    add_reference :exam_windows, :exam, null: false, foreign_key: true
  end
end
