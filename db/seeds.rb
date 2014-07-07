# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env == "development"
  User.destroy_all
  Account.destroy_all
  JournalEntry.destroy_all
  Credit.destroy_all
  Debit.destroy_all
  User.destroy_all
  FinanceInstitution.destroy_all
end

FinanceInstitution.create(:plaid_type => "amex", :name => "American Express")
FinanceInstitution.create(:plaid_type => "bofa", :name => "Bank of America")
FinanceInstitution.create(:plaid_type => "chase", :name => "Chase")
FinanceInstitution.create(:plaid_type => "citi", :name => "Citi")
FinanceInstitution.create(:plaid_type => "us", :name => "US Bank")
FinanceInstitution.create(:plaid_type => "USAA", :name => "USAA")
FinanceInstitution.create(:plaid_type => "wells", :name => "Wells Fargo")

trevor = User.create(:email => "trevor@gmail.com", :password => "test")

trevor.assets.create(:name => "Cash")
trevor.assets.create(:name => "Accounts Receivable")
trevor.liabilities.create(:name => "Accounts Payable")
trevor.revenues.create(:name => "Sales")
trevor.expenses.create(:name => "Payroll Expense")
trevor.equities.create(:name => "Capital Contributions")

#pair
je = EntryBuilder.new(:amount => 225, :date => (Date.today - 6.months + 1.day), :debit_account => "Payroll Expense", :credit_account => "Accounts Payable" ).as_entry(trevor)
je = EntryBuilder.new(:amount => 225, :date => (Date.today - 6.months + 2.weeks), :debit_account => "Accounts Payable", :credit_account => "Cash" ).as_entry(trevor)
#pair
je = EntryBuilder.new(:amount => 150, :date => (Date.today - 1.month), :debit_account => "Accounts Receivable", :credit_account => "Sales" ).as_entry(trevor)
je = EntryBuilder.new(:amount => 150, :date => (Date.today - 1.month), :debit_account => "Cash", :credit_account => "Accounts Receivable" ).as_entry(trevor)

je = EntryBuilder.new(:amount => 100, :date => (Date.today), :debit_account => "Cash", :credit_account => "Sales" ).as_entry(trevor)
je = EntryBuilder.new(:amount => 125, :date => (Date.today - 5.days), :debit_account => "Cash", :credit_account => "Sales" ).as_entry(trevor)
je = EntryBuilder.new(:amount => 525, :date => (Date.today - 1.day), :debit_account => "Payroll Expense", :credit_account => "Accounts Payable" ).as_entry(trevor)
je = EntryBuilder.new(:amount => 1000, :date => (Date.today - 1.year), :debit_account => "Cash", :credit_account => "Capital Contributions" ).as_entry(trevor)
