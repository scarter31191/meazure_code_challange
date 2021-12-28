class PortalController < ApplicationController
    # ::API
    # * A successful (200 OK) response if:
    # * the request data is valid and sanitized
    # * a college exists in the database (college_id) **done (needs error handle)**
    # * an exam exists and belongs to the college (exam_id) **done (needs error handle)**
    # * a user is successfully found or created, and assigned to the exam **done (needs error handle)**
    # * the start_time of the request falls within an Exam's time window
    before_action :set_student, :set_college, :set_exam, :valid_exam?, :student_exam

    def set_student
        @student = Student.find_or_create_by(first_name: params[:first_name], last_name: params[:last_name], phone_number: params[:phone_number])

        unless @student
            render json: {message: "Invalid Information"}
        end
    end

    

    def set_college
        @college = College.find(params[:college_id])
        # byebug
        unless @college
            render json: {message: "No college found"}
        end
    end

    def set_exam
        @exam = Exam.find(params[:exam_id])

        unless @exam
            render json: {message: "No exam found"}
        end
    end

    def valid_exam?
        @exam.college == @college
    end

    def student_exam
        if @exam.students.exclude?(@student)
            render json: {message: "Student not found"}
        end
    end

    def set_exam_window
        @exam_window = ExamWindow.find(params[:exam_id])
    end

    def start_exam
        if @exam_window.start_time <= Time.now.to_datetime
            render json: {message: "Testing has not begun"}
        else 
            render json: {message: "Testing has begun"}
        end
    end

    # def start_exam
    #     render json: @exam.college
    # end

end