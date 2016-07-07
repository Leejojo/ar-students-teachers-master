class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher

  validates :email, presence: true, uniqueness: true, format: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :age,   numericality: { greater_than: 3}

  attr_reader :name, :age

  def name
    "#{first_name} #{last_name}"
  end  

  def age
  now = Time.now.utc.to_date
  now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
end
