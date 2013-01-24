require 'spec_helper'

describe StudentsController do

  # This should return the minimal set of attributes required to create a valid
  # Student. As you add validations to Student, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { name: "Rodrigo Reginato Marques"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StudentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET 'index'" do
    let!(:student) { FactoryGirl.create(:student) }
    
    before do
      get 'index'
    end
    
    it { response.should be_success }
    it { assigns(:students).should == [student] }
  end

  describe "GET show" do
    let!(:student) { FactoryGirl.create(:student) }
    
    it "assigns the requested student as @student" do
      get :show, :id => student.id
      assigns(:student).should eq(student)
    end
  end

  describe "GET 'new'" do
    before do
      get 'new'
    end

    it { response.should be_success }
    it { assigns(:student).should be_instance_of Student }
    it { render_template 'new' }
  end

  describe "GET 'edit" do
    let!(:student) { FactoryGirl.create(:student) }

    before do
      get 'edit', :id => student.to_param
    end
  
    it { response.should be_success }
    it { assigns(:student).should be_instance_of Student }
    it { render_template 'edit' }
  end

  describe "POST create" do          
    context "with valid params" do
      before { post :create, student: valid_attributes }
      
      it { assigns(:student).should be_a(Student) }
      it { assigns(:student).should be_persisted }
      it { response.should redirect_to(students_path) }
    end
    
    context "with invalid params" do
      def do_action(param)
        post(:create, student: param)
      end
    
      before do
        do_action({name: ""})
      end

      it { should render_template(:new) }
      it { should respond_with(:success) }
    end
  end

  describe "POST 'update'" do
    let!(:student) { FactoryGirl.create(:student) }
    context "with valid params" do
      before do
        put 'update', :id => student.to_param, :student => { :name => "Rodrigo Reginato" }
      end

      it { assigns(:student).should == student }
      it { redirect_to(students_path) }
      it { flash[:notice].should == "Student was successfully updated." }
      it { student.reload.name.should == "Rodrigo Reginato" }
    end
    
    context "with invalid params" do
      before do
        put 'update', :id => student.to_param, :student => { :name => "" }
      end

      it { assigns(:student).should == student }
      it { render_template 'edit' }
    end
        
    it "should redirect to home" do
      put 'update', :id => student.to_param, :student => { :name => "Rodrigo" }
      response.should redirect_to(students_path)
    end
  end
  
  describe "DELETE destroy" do
    let!(:student) { FactoryGirl.create(:student) }
    
    context "should find and redirect" do      
      before do
        delete :destroy, id: student.to_param
      end
      
      it { assigns(:student).should == student }
      it { redirect_to(students_path) }
    end  
          
    context "context" do
      it "should destroy a Student" do
        expect {
          delete :destroy, id: student.to_param
        }.to change(Student, :count).by(-1)
      end        
    end    
  end
end
