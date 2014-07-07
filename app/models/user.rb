class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts
  has_many :assets
  has_many :liabilities
  has_many :revenues
  has_many :expenses
  has_many :equities

  def account(name)
    self.accounts.where(:name => name).first
  end

end
