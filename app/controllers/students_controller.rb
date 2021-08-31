class StudentsController < ApplicationController

  def index
    students = Student.all
    if params[:name].blank?
      render json: students
    else 
      # byebug
      found_student = Student.where("first_name LIKE ? or last_name LIKE ?", params[:name], params[:name])
      render json: found_student
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

  # def searched
  #   student = Student.find_by(name: params[:name])
  # end
end
