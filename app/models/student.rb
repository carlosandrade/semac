class Student < ActiveRecord::Base

  #Não permite que estudantes sejam cadastrados sem nome
  validates_presence_of :name

  #Garante a unicidade de nome por estudante na base de dados
  validates_uniqueness_of :name

end
