require 'test_helper'

class NotesControllerTest < ActionController::TestCase
   
  test "should create NOTE" do
    #its upload the zip file successfully
    name = 'page.zip'
    attachment = fixture_file_upload(name, 'application/zip')
    assert_difference('Note.count') do
      post :create, note: {:name => name , :attachment => attachment}
    end
  end
  
    test "should NOT create NOTE" do
    #no file other than zip allowed
    name = 'page.haml'
    attachment = fixture_file_upload(name, 'application/text')
    assert_no_difference('Note.count') do
      post :create, note: {:name => name , :attachment => attachment}
    end
  end

end
