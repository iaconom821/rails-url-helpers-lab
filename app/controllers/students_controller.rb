class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student
    if @student.active 
      @active = "This student is currently active."
    else
      @active = "This student is currently inactive."
    end
  end

  def activate
    @student = Student.find(params[:id])
    @student.update(active: !@student.active)
    
    redirect_to student_path(@student) 
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end