# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class Program < ActiveRecord::Base
  has_many :students

  Programs = self.all
  ProgramIDs = Programs.collect {|prog| prog.id}
  ProgramNames = Programs.collect {|prog| prog.name}
  ProgramFullNames = Programs.collect {|prog| prog.fullname}

  def self.get_id(name)
    ProgramIDs.at(ProgramNames.index(name) || ProgramFullNames.index(name) || 9999)     # return nil if not found
  end

  def self.get_names(arr)
    names = []
    arr.each {|id| names.push ProgramNames.at(ProgramIDs.index(id)   || 9999)}     # return nil if not found
    names
  end

  def self.get_name(id)
    ProgramNames.at(ProgramIDs.index(id)   || 9999)     # return nil if not found
  end

  def self.get_fullname(id)
    ProgramFullNames.at(ProgramIDs.index(id)   || 9999)     # return nil if not found
  end
  def self.get_fullnames(arr)
    names = []
    arr.each {|id| names.push ProgramFullNames.at(ProgramIDs.index(id)   || 9999)}     # return nil if not found
    names
  end
  
end

