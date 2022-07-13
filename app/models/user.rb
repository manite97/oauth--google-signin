class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :orders, dependent: :destroy
    has_many :order_lines, :through=>:orders
    # after_create :my_method

    default_scope -> { order(:created_at) }
    

    def my_method
      puts "mani"
    end

  #  def full_name
  #   "{self.first_name}. {self.last_name}"
  #  end

    alias :mani :my_method
    alias :teja :orders
    def self.create_user
      User.first.transaction do
        10.times do |i|
          User.create(:email => Faker::Internet.email, :password => "mani123")
        end
      end
    end
  end
  