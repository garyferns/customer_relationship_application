
require_relative 'contact_class.rb'

class Rolodex

@@id = 1

  def initialize

    @contacts = []
  end


  def add_new_contact(first_name, last_name, email, note)

    contact = Contact.new(@@id, first_name, last_name, email, note)
    @@id += 1

    @contacts << contact
  end



def find (modid)


@contacts.find{ |contact| contact.id == modid}


end


  def all

    @contacts
  end
end