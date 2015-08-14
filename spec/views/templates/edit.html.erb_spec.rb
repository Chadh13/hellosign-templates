require 'rails_helper'

RSpec.describe "templates/edit", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      :title => "MyString",
      :subject => "MyString",
      :message => "MyString",
      :file => "MyString"
    ))
  end

  it "renders the edit template form" do
    render

    assert_select "form[action=?][method=?]", template_path(@template), "post" do

      assert_select "input#template_title[name=?]", "template[title]"

      assert_select "input#template_subject[name=?]", "template[subject]"

      assert_select "input#template_message[name=?]", "template[message]"

      assert_select "input#template_file[name=?]", "template[file]"
    end
  end
end
