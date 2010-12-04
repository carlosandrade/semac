class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.xml
  def index
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = Activity.new
    # O id da turma dona da atividade é passado como parametro
    @group_id = params[:id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])
    # O id da turma que estava como hidden no formulario
    # é adicionado a atividade criada
    @activity.group_id = params[:group_id]

    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Activity was successfully created.'
        format.html { redirect_to(:action => 'activity_details', :controller => 'teachers', :id => @activity) }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }

        #Also, generate a notification to send to the students enrolled in the group that the activity was created
      
        @teacher = @activity.group.teacher
        @student = @activity.group.students.first
        ActivityNotifier.deliver_activity_notification(@student, @teacher, @activity)

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        flash[:notice] = 'Activity was successfully updated.'
<<<<<<< HEAD
        format.html { redirect_to(:action => 'activity_details', :controller => 'teachers', :id => @activity) }
=======
        format.html { redirect_to(@activity) }
>>>>>>> origin/master
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(activities_url) }
      format.xml  { head :ok }
    end
  end
end
