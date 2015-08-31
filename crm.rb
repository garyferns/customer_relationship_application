
require_relative 'rolodex_class'

class CRM

def self.run(name)

  crm =  new(name)
  crm.main_menu
end


def initialize(name)

  @name = name
  @rolodex = Rolodex.new
end


  def print_menu

    puts "\n1. add a contact."
    puts "2. modify a contact."
    puts "3. display all contacts."
    puts "4. display contact"
    puts "5. delete a contact."
    puts "6. to exit."
  end


  def main_menu

    while true

      print_menu
      print "\nPlease enter a number: "
      user_input = gets.chomp.to_i
      break if user_input == 6
      choose_option(user_input)
    end
  end


  def choose_option(input)

    case input

      when 1 then add_new_contact
      when 2 then modify_contact
      when 3 then display_all_contacts
      when 4 then display_contact
      when 5 then delete_contact
      when 6 then exit
      else puts "That is not an option."
    end
  end


def add_new_contact

    print "First Name: "
    first_name = gets.chomp

    print "Last Name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Note: "
    note = gets.chomp

    @rolodex.add_new_contact(first_name, last_name, email, note)
  end


  def modify_contact

# 1. Ask the user which contact he/she would like to modify.
# How to do they specify? First name? Last name?
# First do it with the id number. Then try it with names.


  print "Please enter the id number of the contact you would like to modify: "
   mod_id = gets.chomp.to_i

# 1. Get the user ID.
# 2. Then find the array with that id.

  temp_contact = @rolodex.find(mod_id)
  puts "What attribute would you like to change?"
  puts "1. First Name"
  puts "2. Last Name"
  puts "3. Email"
  puts "4. Note"

  choice = gets.chomp.to_i

  if choice == 1
    puts "Please enter the new first name: "
    temp_contact.first_name = gets.chomp
  end

  if choice == 2
    puts "Please enter the new last name: "
    temp_contact.last_name = gets.chomp
  end

  if choice == 3
    puts "Please enter the new email: "
    temp_contact.email = gets.chomp
  end

  if choice == 4
    puts "Please enter the new note: "
    temp_contact.note = gets.chomp
  end


  end


  def display_all_contacts

    @rolodex.all.each do |contact|

      puts "#{contact.id}. \ #{contact.full_name} \ #{contact.email}"
    end
  end




  def display_contact

    print "Please enter an id number: "
    mod_id = gets.chomp.to_i
    choose = @rolodex.find(mod_id)
    puts "#{choose}"



  end




  def delete_contact

    print "Please enter an id number: "
    mod_id = gets.chomp.to_i
    num = @rolodex.find(mod_id)



  end

end




CRM.run("Bitmaker")

