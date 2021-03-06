class StudentsController < ApplicationController
  # GET /students
  # GET /students.xml
  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        flash[:notice] = 'Student was successfully created.'
        format.html { redirect_to(students_path) }
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = 'Student was successfully updated.'
        format.html { redirect_to(students_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end

# Mostra as turma nas quais o aluno está matriculado
  def show_groups
    @student = Student.find(params[:id])
  end

# Mostra as atividades de um determinado aluno em determinada turma
  def show_activities
    @student = Student.find(params[:id])
    @group = Group.find(params[:group_id])
    
    submission_status = []
    @group.activities.each do |a|
      # Procura por uma submissão desse aluno para essa atividade
      s = Submission.find(:all, :conditions => {:activity_id => a.id, :student_id => @student.id})
      # Se 's' for um vetor vazio, nao encontrou tal submissão
      if s.empty?
        submission_status << "Pending"
      else
        submission_status << "Done"
      end
    end
    
    @status = submission_status.to_enum
  end

# Mostra os detalhes de uma atividade do aluno
  def activity_details
    @student_id = params[:id]
    @activity = Activity.find(params[:activity_id])
  end

# Mostra a página para o aluno submeter uma atividade
  def submit_file
    @student_id = params[:id]
    @activity_id = params[:activity_id]
    delivery_date = Activity.find(params[:activity_id]).delivery_date
    if Date.today > delivery_date
      flash[:notice] = 'Activity has expired'
      redirect_to(:action => "activity_details", :id => @student_id, :activity_id => @activity_id)
    end
    @attachment = Attachment.new
  end

# Submete a atividade do aluno
  def submit
    student = Student.find(params[:student_id])
    activity = Activity.find(params[:activity_id])

    attach = Attachment.new(params[:attachment])  
    attach.extension = attach.path.split(".").last
    attach.save

    submission = Submission.new
    submission.save

    submission.attachment = attach
    
    student.submissions.push(submission)
    activity.submissions.push(submission)
    flash[:notice] = "Submited successfully"
    redirect_to :action => 'activity_details', :id => student.id, :activity_id => activity.id
  end
  
  # lista students
  def list
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

end
