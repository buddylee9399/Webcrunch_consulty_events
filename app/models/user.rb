# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meetings, dependent: :destroy
  has_many :comments, dependent: :destroy    
    after_create :assign_default_role
    def name
      self.first_name
    end
    def username
      self.first_name + self.last_name
    end    
    def assign_default_role
      if User.count == 1
        self.add_role(:site_admin) if self.roles.blank?
        self.add_role(:admin)
        self.add_role(:customer)      
      else
        self.add_role(:customer) if self.roles.blank?
      end
    end  
    def stripe_id
      'asdf'
    end
    def card_brand
      'asdf'
    end    
    def card_exp_month
      'asdf'
    end    
    def card_exp_year
      'asdf'
    end    
    def card_last4
      'asdf'
    end    

end


