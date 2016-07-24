# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class Pdc
  
  # TODO: new method
  # Array of [program_id, department_id]
  attr_accessor :list

  def initialize
    @list = []
  end
  
  
  def add(program_id, department_id)
    @list.push([program_id, department_id]) if program_id.is_a? Fixnum and department_id.is_a? Fixnum unless contains?(program_id, department_id)
  end
  
  def add_s(program, department)
    @list.push([Program.get_id(program), Department.get_id(department)]) if program.is_a? String and department.is_a? String unless contains_s?(program, department)
  end
  
  
  
  
  def contains?(program_id, department_id)
    @list.include?( [program_id, department_id] )
  end
  
  def contains_s?(program, department)
    @list.include?([Program.get_id(program), Department.get_id(department)])
  end
  
  
  def generate_conditions
    return "" if @list.empty?
    conds = []
    @list.each{|i| conds.push(" (program_id = #{i[0]} AND department_id = #{i[1]}) ")}
    "(" + conds.join(" OR ") + ")"
  end
  
  def to_s
    arr = []
    @list.each{|i| arr.push(Department.get_name(i[1]) + Program.get_name(i[0]))}
    arr.join(", ")
  end
  
end
