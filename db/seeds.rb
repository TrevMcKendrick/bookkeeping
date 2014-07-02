# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Plutus::Asset.create(:name => "Cash")
Plutus::Asset.create(:name => "Accounts Receivable")
Plutus::Revenue.create(:name => "Services Revenue")
Plutus::Expense.create(:name => "Payroll expense")
Plutus::Expense.create(:name => "Payroll tax expense")
Plutus::Expense.create(:name => "Food and Entertainment Expense")
Plutus::Expense.create(:name => "Auto expense")
Plutus::Liability.create(:name => "Sales Tax Payable")
Plutus::Liability.create(:name => "Credit Card Payable")

Plutus::Entry.destroy_all
Plutus::Amount.destroy_all

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
