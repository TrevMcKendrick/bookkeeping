class Account < ActiveRecord::Base

  belongs_to :user
  has_many :debits
  has_many :credits

  validates_presence_of :type, :name

  def debit_balance_as_of(date)
    time_range = (THE_BEGINNING)..(date.to_s)
    Debit.joins(:journal_entry, account: :user).where('journal_entries.effective_date' => time_range, 'accounts.name' => self.name, 'users.id' => self.user.id).sum(:amount)
  end

  def credit_balance_as_of(date)
    time_range = (THE_BEGINNING)..(date.to_s)
    Credit.joins(:journal_entry, account: :user).where('journal_entries.effective_date' => time_range, 'accounts.name' => self.name, 'users.id' => self.user.id).sum(:amount)
  end

  def debit_balance_between_dates(start_day, end_day)
    time_range = (start_day.to_s)..(end_day.to_s)
    Debit.joins(:journal_entry, account: :user).where('journal_entries.effective_date' => time_range, 'accounts.name' => self.name, 'users.id' => self.user.id).sum(:amount)
  end

  def credit_balance_between_dates(start_day, end_day)
    time_range = (start_day.to_s)..(end_day.to_s)
    Credit.joins(:journal_entry, account: :user).where('journal_entries.effective_date' => time_range, 'accounts.name' => self.name, 'users.id' => self.user.id).sum(:amount)
  end

  def self.debit_balance_as_of(date)
    total = self.all.collect do |account|
      account.debit_balance_as_of(date)
    end.sum
  end

  def self.credit_balance_as_of(date)
    total = self.all.collect do |account|
      account.credit_balance_as_of(date)
    end.sum
  end

  def self.debit_balance_between_dates(start_day, end_day)
    total = self.all.collect do |account|
      account.debit_balance_between_dates(start_day, end_day)
    end.sum
  end

  def self.credit_balance_between_dates(start_day, end_day)
    total = self.all.collect do |account|
      account.credit_balance_between_dates(start_day, end_day)
    end.sum
  end

end
