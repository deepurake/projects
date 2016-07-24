# Gaurav (gauravbg AT iitk DOT ac DOT in) - July 2009
# Not to be directly instantiated. Subclasses *must* begin with
# Attachment. eg. AttachmentResume, AttachmentNotice
class Attachment < ActiveRecord::Base
  
  has_attached_file :file,
                    :url  => '/attachments/:klass/:ptype/:pid/:uid',
                    :path => ':rails_root/attachments/:klass/:ptype/:pid/:uid'
                    
  
  belongs_to :attachable, :polymorphic => true
  
  
  validates_inclusion_of :file_content_type, :in => %w(application/x-doc application/x-docx application/x-pdf application/pdf),
    :message => "{{value}} is not an allowed filetype. You can upload only PDFs, DOCs or DOCXs" 
  validates_numericality_of :file_file_size, :less_than => 5 * 1024 * 1024,
    :message => "File too large. File size: {{value}}bytes. Limit is 5 MB. "
  
  # uid  => unique (and randomly generated) id
  Paperclip::Interpolations[:uid]    = lambda{ |attachment, style| attachment.instance.uid }
  Paperclip::Interpolations[:pid]    = lambda{ |attachment, style| attachment.instance.attachable_id } #pid => parent id
  Paperclip::Interpolations[:ptype]  = lambda{ |attachment, style| attachment.instance.attachable_type.pluralize.underscore.downcase }
  Paperclip::Interpolations[:klass]  = lambda{ |attachment, style| attachment.instance.class.name.pluralize.underscore.downcase[10..-1] } # klass => model type... like resume
  
  
  def before_create
    self.uid = ActiveSupport::SecureRandom.hex(32)
  end
end
