class DeptProg < ActiveRecord::Base
  serialize :dept_prog, Pdc
  DeptProgs = self.first.dept_prog
  
  def self.get
    DeptProgs
  end
end

