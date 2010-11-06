class Student < ActiveRecord::Base

  #Não permite que estudantes sejam cadastrados sem nome
  validates_presence_of :name

  #Garante a unicidade de nome por estudante na base de dados
  validates_uniqueness_of :name

  #Verifica se um estudante com nome acima de cem caracteres foi salvo
  validates_length_of :name, :maximum=>100

end
