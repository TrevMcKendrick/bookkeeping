# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env == "development"
  Plutus::Entry.destroy_all
  Plutus::Amount.destroy_all
  Plutus::Account.destroy_all
end

Plutus::Asset.create(:name => "Cash")
Plutus::Asset.create(:name => "Accounts Receivable")
Plutus::Revenue.create(:name => "Services Revenue")
Plutus::Expense.create(:name => "Payroll expense")
Plutus::Expense.create(:name => "Payroll tax expense")
Plutus::Expense.create(:name => "Food and Entertainment Expense")
Plutus::Expense.create(:name => "Auto expense")
Plutus::Liability.create(:name => "Sales Tax Payable")
Plutus::Liability.create(:name => "Credit Card Payable")

entry1 = Plutus::Entry.build(
                :description => "Gasoline",
                :debits => [
                  {:account => "Auth expense", :amount => 100.00}],
                :credits => [
                  {:account => "Cash", :amount => 100.00}])
                  entry1.save

FinanceInstitution.create(:plaid_type => "amex", :name => "American Express")
FinanceInstitution.create(:plaid_type => "bofa", :name => "Bank of America")
FinanceInstitution.create(:plaid_type => "chase", :name => "Chase")
FinanceInstitution.create(:plaid_type => "citi", :name => "Citi")
FinanceInstitution.create(:plaid_type => "us", :name => "US Bank")
FinanceInstitution.create(:plaid_type => "USAA", :name => "USAA")
FinanceInstitution.create(:plaid_type => "wells", :name => "Wells Fargo")

if Rails.env == "development"
  entry1 = Plutus::Entry.build(
                  :description => "Gasoline",
                  :debits => [
                    {:account => "Auth expense", :amount => 100.00}],
                  :credits => [
                    {:account => "Cash", :amount => 100.00}])
                    entry1.save

  entry2 = Plutus::Entry.build(
                  :description => "Editing expense",
                  :debits => [
                    {:account => "Payroll expense", :amount => 25.00}],
                  :credits => [
                    {:account => "Cash", :amount => 25.00}])
                    entry2.save

  entry3 = Plutus::Entry.build(
                  :description => "Took Dan Fogal out to lunch",
                  :debits => [
                    {:account => "Food and Entertainment Expense", :amount => 38.25}],
                  :credits => [
                    {:account => "Credit Card Payable", :amount => 38.25}])
                    entry3.save

  entry4 = Plutus::Entry.build(
                  :description => "Family wedding pictures",
                  :debits => [
                    {:account => "Cash", :amount => 1000}],
                  :credits => [
                    {:account => "Services Revenue", :amount => 1000}])
                    entry4.save
  end
