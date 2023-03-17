require "test_helper"

class Contacts::ImportsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_contact_import_url
    assert_response :success
  end

  # test "should import contacts with no errors" do
  #   file = fixture_file_upload('sample.vcf', 'text/vcard')
  #   # file = file_fixture('sample.vcf')
  #   # puts file.read
  #   # puts file.headers
  #   # assert_difference("Contact.count") do
  #     post contact_imports_url, params: {import_file: file}, headers: {"Content-Disposition": "form-data", "name": "import_file", "filename": "sample.vcf", "Content-Type": "text/vcard"}
  #   # end

  #   assert_text "Import completed with no errors"
  # end

  # test "should import contacts with erros" do
  #   import_file = fixture_file_upload('sample.vcf')

  #   assert_difference("Contact.count") do
  #     post contacts_url, params: { :import_file => import_file} 
  #   end

  #   assert_text "Import completed with errors"
  # end

end
