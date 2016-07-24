class AttachmentsController < ApplicationController

  def show
    if File.exists? "#{RAILS_ROOT}/attachments/#{params[:class]}/#{params[:ptype]}/#{params[:pid]}/#{params[:uid]}"
      @attachment = Attachment.first(:conditions => {:uid => params[:uid]})
      send_file @attachment.file.path, :filename => @attachment.file_file_name, :type => @attachment.file_content_type,
        :disposition => 'inline'
    else
      render :nothing => true 
    end
  end
end

