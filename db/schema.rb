# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_28_055145) do

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "colleges_students", id: false, force: :cascade do |t|
    t.integer "college_id", null: false
    t.integer "student_id", null: false
    t.index ["college_id", "student_id"], name: "index_colleges_students_on_college_id_and_student_id"
    t.index ["student_id", "college_id"], name: "index_colleges_students_on_student_id_and_college_id"
  end

  create_table "exam_windows", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "exam_id", null: false
    t.index ["exam_id"], name: "index_exam_windows_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.integer "college_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_id"], name: "index_exams_on_college_id"
  end

  create_table "exams_students", force: :cascade do |t|
    t.integer "exam_id", null: false
    t.integer "student_id", null: false
    t.index ["exam_id"], name: "index_exams_students_on_exam_id"
    t.index ["student_id"], name: "index_exams_students_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "exam_windows", "exams"
  add_foreign_key "exams", "colleges"
  add_foreign_key "exams_students", "exams"
  add_foreign_key "exams_students", "students"
end
