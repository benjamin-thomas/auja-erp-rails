class User < ApplicationRecord
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable

  def self.onboard!
    fname = ask('First name')
    lname = ask('Last name')
    email = ask('email')
    password = ask('password')

    create!(
      first_name: fname,
      last_name: lname,
      email: email,
      password: password,
    )
  end


  private
  def self.ask(var)
    print "#{var}: "
    gets.chomp
  end
end
