class TeachersController < ApplicationController
  # GET /teachers
  # GET /teachers.xml
  def index
    @teachers = Teacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teachers }
    end
  end

  # GET /teachers/1
  # GET /teachers/1.xml
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teacher }
    end
  end

  # GET /teachers/new
  # GET /teachers/new.xml
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  # POST /teachers.xml
  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        flash[:notice] = 'Teacher was successfully created.'
        format.html { redirect_to(@teacher) }
        format.xml  { render :xml => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teachers/1
  # PUT /teachers/1.xml
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        flash[:notice] = 'Teacher was successfully updated.'
        format.html { redirect_to(@teacher) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.xml
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to(teachers_url) }
      format.xml  { head :ok }
    end
  end

  # Mostra as turmas do professor com id passado como parametro
  def show_groups
    @teacher = Teacher.find(params[:id])
  end

  # Permite ao professor gerenciar a turma com id passado como parametro
  def manage_group
    @group = Group.find(params[:id])
  end
 
  # Mostra para o professor os alunos de sua turma com id passada como parametro
  def show_students
    @group = Group.find(params[:id])
  end

  # Mostra as atividades de uma turma de um professor
  def show_activities
    @group = Group.find(params[:id])
  end

  # Mostra as subimissões de uma atividade
  def activity_submissions
    @activity = Activity.find(params[:id])
  end

  def download_submission
    @attachment = Attachment.find(params[:id])
    @submission = @attachment.submission
  end

end
