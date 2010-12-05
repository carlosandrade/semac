class CpdController < ApplicationController
  def index
  end

  def add_to_group
    @student = Student.find(params[:id])
    @groups = Group.student_doesnt_belongs_to(@student)
  end

  # Adiciona um aluno em determinada turma
  def add_group
    error = false
    messege = "Student successfully added to group"
    student = Student.find(params[:id])
    begin
      group = Group.find(params[:group_id])
    # se uma turma com id informado não existe,
    # muda a mensagem para "turma não existente"
    rescue ActiveRecord::RecordNotFound
      error = true
      messege = "Informed group doesn't exist"
    end
    # Não adiciona o aluno a turma se ela não existir
    if !error
      student.groups.push(group)
    end
    flash[:notice] = messege
    redirect_to(students_path) 
  end

end
