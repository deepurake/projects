## See here: http://www.barbariangroup.com/posts/1050

desc 'Given a model name (as MODEL), returns a set of validations for that model matching its database attributes.'
task :get_validations_for_model => :environment do

  table = ENV['MODEL'].constantize
  
  required_fields = []
  required_string_fields = {}
  optional_string_fields = {}
  required_numeric_fields = [] 
  optional_numeric_fields = [] 
    
  table.columns.each do |column|
    next if column.primary # Skip the primary ID.
    required_fields << column.name if !column.null # Build the list of required validatins.
    
    if column.type.to_s == 'string' # Build the list of length validations.
      if column.null
        optional_string_fields[column.limit] ||= []
        optional_string_fields[column.limit] << column.name
      else
        required_string_fields[column.limit] ||= []
        required_string_fields[column.limit] << column.name        
      end
    end
    
    if column.number?        
      if column.null
        optional_numeric_fields << column.name
      else
        required_numeric_fields << column.name
      end
    end
    
  end
  
  puts "validates_presence_of " + required_fields.map{|r| ":#{r}"}.join(', ')
  
  optional_string_fields.each_pair do |length, names|
    puts "validates_length_of " + names.map{|r| ":#{r}"}.join(', ') + ", :maximum => #{length}, :allow_blank => true"
  end

  required_string_fields.each_pair do |length, names|
    puts "validates_length_of " + names.map{|r| ":#{r}"}.join(', ') + ", :maximum => #{length}"
  end    
  
  puts "validates_numericality_of " + optional_numeric_fields.map{|r| ":#{r}"}.join(', ') + ", :allow_blank => true"
  puts "validates_numericality_of " + required_numeric_fields.map{|r| ":#{r}"}.join(', ')
    
end