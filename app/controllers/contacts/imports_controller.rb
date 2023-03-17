class Contacts::ImportsController < ApplicationController
  def new
    @contact = Contact.new
    @errors = []
    @success = 0
  end

  def create
    
    respond_to do |format|
      # unless params[:import_file]
      #   # redirect_to contact_url
      #   format.html { redirect_to new_contact_import_path, status: :unprocessable_entity, alert: "Contact was successfully updated." }
      #   format.turbo_stream do
      #     render turbo_stream: turbo_stream.replace('notification', partial: 'contacts/imports/notice',
      #                                                               locals: { alert: 'Please attach a vcard file.' })
      #   end
      #   return
      # end
      # puts params[:import_file]
      puts params[:import_file]
      @vcard_import = Vcard::Vcard.decode(params[:import_file].read) if params[:import_file]
      @errors = []
      @success = 0

      @vcard_import.each do |vcard|
        @contact = Contact.new
        @contact.name = vcard.name.fullname
        @contact.email_address = vcard.email
        if @contact.save
          # DO NOTHING // CONTINUE
          @success += 1
        else
          contact_error = { "#{@contact.name}": @contact.errors }
          @errors.push(contact_error)
          # errors.push(@contact.errors) # TO DO SOMETHING
        end
      end

      if @errors.count > 0
        flash[:notice] = "Contact removed"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('notification', partial: 'contacts/imports/notice',
                                                 locals: { alert: 'Contact import completed with errors.' }),
            turbo_stream.replace('import_form', partial: 'contacts/imports/form',
                                                locals: { is_show_action: true, contact: Contact.new }),
            turbo_stream.replace('import_result', partial: 'contacts/imports/errors',
                                                locals: { success: @success, errors: @errors })
          ]
        end
      else
        flash[:notice] = "Contact removed"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('notification', partial: 'contacts/imports/notice',
                                                 locals: { notice: 'Contact import completed with no errors.' }),
            turbo_stream.replace('import_form', partial: 'contacts/imports/form',
                                                locals: { is_show_action: true, contact: Contact.new }),
            turbo_stream.replace('import_result', partial: 'contacts/imports/errors',
                                                locals: { success: @success, errors: @errors })
          ]
        end
      end
    end
  end
end
