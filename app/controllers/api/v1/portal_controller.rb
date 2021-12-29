module Api
    module V1
        class PortalController < ApplicationController
            
            before_action :set_student, :set_college, :set_exam, :valid_exam?, :student_exam
            
        
            def set_student
                # finds or creates a user
                @student = Student.find_or_create_by(first_name: params[:first_name], last_name: params[:last_name], phone_number: params[:phone_number])
        
                unless @student
                    render json: {message: "Invalid Information"}
                end
            end
        
        
            def set_college
                # finds a college
                @college = College.find_by_id(params[:college_id])
                unless @college
                    render json: {message: "No college found"}
                end
            end
        
            def set_exam
                # finds exam
                @exam = Exam.find_by_id(params[:exam_id])
                
                if @exam.nil?
                    render json: {message: "No exam found"}
                end
            end
        
            def valid_exam?
                # checks if exam belongs_to college
                @exam.college == @college
                
                if @exam.college != @college
                    render json: {message: "Exam does not belong to this college"}
                end
            end
        
            def student_exam
                # checks if student is included in the exam
        
                if @exam.students.exclude?(@student)
                    render json: {message: "Student not found"}
                end
            end
        
            def start_exam
                # checks to see if exam has begun or not
                @exam_window = ExamWindow.find(params[:exam_id])
                
                if @exam_window.start_time >= Time.now.to_datetime
                    render json: {message: "Testing has not begun"}
                else 
                    render json: {message: "Testing has begun"}
                end
            end
        
        end
    end
end
