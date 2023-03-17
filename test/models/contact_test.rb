require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "should not save contact without name" do
    contact = Contact.new(:email_address => "user1@example.com")
    assert_not contact.save
  end

  test "should not save contact without email" do
    contact = Contact.new(:name => "user1")
    assert_not contact.save
  end

  test "should save contact with email and name" do
    contact = Contact.new(:name => "user1", :email_address => "user1@example.com")
    assert contact.save
  end

  test "should not save contact with duplicate email" do
    contact1 = Contact.create(:name => "user1", :email_address => "user1@example.com")
    
    contact2 = Contact.new(:name => "user2", :email_address => "user1@example.com")
    
    assert_not contact2.save
  end
end
