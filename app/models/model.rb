class Model < ActiveRecord::Base
  self.abstract_class = true
  before_validation :clear_empty_attrs
  def clear_empty_attrs
    print "clearing attrs"
    @attributes.each do |key,value|
    self[key] = nil if value.blank?
    end
  end

  def self.get_required_fields(table)
    required_fields=[]
    table.columns.each do |column|
    required_fields << column.name if !column.null
    end
    required_fields
  end
end