class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bill_connections
  has_many :bills , through: :bill_connections
  has_many :bill_roles

  attr_accessor :skip_password_validation

  protected

  def password_required?
    return false if skip_password_validation
    super
  end
end
