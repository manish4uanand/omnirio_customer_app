class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { male: 0, female: 1, not_sure: 2, prefer_not_to_disclose: 3 }

  belongs_to :role
  validates :gender, presence: true
  # before_validation :assign_role

  # def assign_role
  #   byebug
  #   self.role = Role.find_by role_name: 'Customer' if role.nil?
  # end
  before_validation :assign_role, if: proc { |user| !user.role.present? }

  def branch_manager?
    role.role_name == 'Branch Manager'
  end

  private

  def assign_role
    role = Role.find_by role_name: 'Customer'
    self.update_attribute(:role, role)
  end
end
