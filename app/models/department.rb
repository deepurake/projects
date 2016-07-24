# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class Department < ActiveRecord::Base
  has_many :students

  Departments = self.all
  DepartmentIDs = Departments.collect {|dep| dep.id}
  DepartmentNames = Departments.collect {|dep| dep.name}
  DepartmentFullNames = Departments.collect {|dep| dep.fullname}

  def self.get_id(name)
    DepartmentIDs.at(DepartmentNames.index(name) || DepartmentFullNames.index(name) || 9999)     # return nil if not found
  end

  def self.get_name(id)
    DepartmentNames.at(DepartmentIDs.index(id) || 9999)     # return nil if not found
  end
  def self.get_names(arr)
    names = []
    arr.each {|id| names.push DepartmentNames.at(DepartmentIDs.index(id)   || 9999)}
    names
  end
  
  def self.get_fullname(id)
    DepartmentFullNames.at(DepartmentIDs.index(id) || 9999)     # return nil if not found
  end
  def self.get_fullnames(arr)
    names = []
    arr.each {|id| names.push DepartmentFullNames.at(DepartmentIDs.index(id)   || 9999)}
    names
  end
  
end

