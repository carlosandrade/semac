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

# Mostra as turma nas quais o aluno está matriculado
  def show_groups
    @student = Student.find(params[:id])
  end

# Mostra as atividades de um determinado aluno em determinada turma
  def show_activities
   @student = Student.find(params[:id])
   @group = Group.find(params[:group_id])
  end

# Adiciona um aluno em determinada turma
  def add_group
    error = false
    @messege = "Student successfully added to group"
    @student = Student.find(params[:id])
    begin
      group = Group.find(params[:group_id])
    # se uma turma com id informado não existe,
    # muda a mensagem para "turma não existente"
    rescue ActiveRecord::RecordNotFound
      error = true
      @messege = "Informed group doesn't exist"
    end
    # Não adiciona o aluno a turma se ela não existir
    if !error
      @student.groups.push(group)
    end
  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        flash[:notice] = 'Student was successfully created.'
        format.html { redirect_to(@student) }
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
        format.html { redirect_to(@student) }
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
end
