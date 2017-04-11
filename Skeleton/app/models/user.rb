class User < ActiveRecord::Base
  validates :full_name, :email, presence: true

  include BCrypt

  # Getter method that retrieves the hashed password as a Bcrypt::Password Object.
  # Password.new: Input: a string representing a hashed password (from the DB). Output:a Bcrypt::Password Object
  def password
    @password ||= Password.new(self.hashed_password)
  end

  #Writer method that gets called when we assign a new plaintext password to the password attribute.
  def password=(new_password)
    # @password is a Bcrypt:Password representing the hashed password
    # Password.create: Input: a plain text password string (from the user/form/controller). Output: A Bcrypt::Password object.
    @password = Password.create(new_password)

    # Writing the hashed password to the actual database column/field that we have
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    # '==' a Bcrypt::Password operator
    return user if user && user.password == password
  end
end