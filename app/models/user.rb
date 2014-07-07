class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :make_accounts

  has_many :accounts
  has_many :assets
  has_many :liabilities
  has_many :revenues
  has_many :expenses
  has_many :equities

  def account(name)
    self.accounts.where(:name => name).first
  end

  def make_accounts
    Account.subclasses.each do |account|
      account::CHART_OF_ACCOUNTS.each do |name|
        self.send(account.name.pluralize.downcase).build(:name => name).save
      end
    end
  end

end
