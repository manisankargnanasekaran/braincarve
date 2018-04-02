class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    #@students = Student.order(created_at: :desc)
    @students = Student.where(created_by_id: session[:user_id]).order(created_at: :desc).where(student_active: true)
    @attendance = Attendance.all
    #where(created_by_id: session[:user_id]).order(created_at: :desc)
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.build_student_detail
    @student_genders = Student.genders
    @student_levels = Student.levels

  end

  # GET /students/1/edit
  def edit
    @student_genders = Student.genders
  end

  # POST /students
  # POST /students.json
  def create
    
    #params[:student][:student_active] = true
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        @student.update(:created_by_id=>session[:user_id], student_active: true, level_join: params[:student][:level])
        format.html { redirect_to students_url, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, alert: 'Oops! Something went wrong' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end


  def student_attendance
    @students = Student.all
    @student = Student.find(params[:id])
    @attendances = Attendance.where(student_id: params[:id])
    @student_ratings = StudentRating.all
    @attendance = Attendance.new
    4.times { @attendance.student_ratings.build }
    @student_rating = StudentRating.student_ratings.keys
  end  

  def student_attendance_create
    
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
    attend_class = Student.find(params[:attendance][:student_id]).current_level + 1
    Student.find(params[:attendance][:student_id]).update(current_level: attend_class)
    redirect_to students_path
    else
    end
  end



  def student_rating

  end

 

  def student_details_show

    @students_report = Student.find(params[:student_id])
    student_detail = StudentDetail.find(params[:student_id]).id

    @student_fee = StudentFeePay.where(student_detail_id: student_detail)
    @attendance = Attendance.where(student_id: params[:student_id])
    
  end


   def level_show
    @students = Student.all.map{|i| i.current_level == 12 ? i : nil}.compact
    
    #@franchisee = User.find(Student.first.created_by_id)
    

  end

  def student_level_update
  
    level = Student.find(params[:student_id]).level_before_type_cast.to_i + 1
    level_update = level.to_s
    Student.find(params[:student_id]).update(level: level_update, current_level: 0)

    redirect_to upgrade_level_path
  end


  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_url, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def attendance_destroy

   @attendance = Attendance.find(params[:id])
    
    level_decrement = Attendance.find(params[:id]).student.current_level - 1

     Attendance.find(params[:id]).student.update(current_level: level_decrement)
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deactivate_student
    Student.find(params[:id]).update(student_active: false)
    redirect_to students_path
  end

  def activate_student
    Student.find(params[:id]).update(student_active: true)
    redirect_to students_path
  end

  def deactivated_student_list
    @deactivated_students = Student.where(student_active: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit!#(:student_name, :current_level, :dob, :age, :gender, :student_class, :address, :contact_no, :school_name, :school_location, :registration_date, :level, :batch_id, :student_detail_attributes=>[:id, :father_name, :father_occupation, :father_email, :father_contact_no, :mother_name, :mother_occupation, :mother_email, :mother_contact_no, :known_by, :reason_to_enroll])
    end

    def attendance_params
      params.require(:attendance).permit!
    end
end
