require 'rails_helper'

RSpec.describe "templates/new", type: :view do
  before(:each) do
    assign(:template, Template.new(
      :title => "MyString",
      :subject => "MyString",
      :message => "MyString",
      :file => "MyString"
    ))
  end

  it "renders new template form" do
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do

      assert_select "input#template_title[name=?]", "template[title]"

      assert_select "input#template_subject[name=?]", "template[subject]"

      assert_select "input#template_message[name=?]", "template[message]"

      assert_select "input#template_file[name=?]", "template[file]"
    end
  end
end
