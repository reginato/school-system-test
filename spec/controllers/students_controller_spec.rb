require 'spec_helper'

describe StudentsController do

  # This should return the minimal set of attributes required to create a valid
  # Student. As you add validations to Student, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
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
    describe "with valid params" do
      it "creates a new Student" do
        expect {
          post :create, {:student => valid_attributes}, valid_session
        }.to change(Student, :count).by(1)
      end

      it "assigns a newly created student as @student" do
        post :create, {:student => valid_attributes}, valid_session
        assigns(:student).should be_a(Student)
        assigns(:student).should be_persisted
      end

      it "redirects to the created student" do
        post :create, {:student => valid_attributes}, valid_session
        response.should redirect_to(Student.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved student as @student" do
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        post :create, {:student => {}}, valid_session
        assigns(:student).should be_a_new(Student)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        post :create, {:student => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested student" do
        student = Student.create! valid_attributes
        # Assuming there are no other students in the database, this
        # specifies that the Student created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Student.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => student.to_param, :student => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested student as @student" do
        student = Student.create! valid_attributes
        put :update, {:id => student.to_param, :student => valid_attributes}, valid_session
        assigns(:student).should eq(student)
      end

      it "redirects to the student" do
        student = Student.create! valid_attributes
        put :update, {:id => student.to_param, :student => valid_attributes}, valid_session
        response.should redirect_to(student)
      end
    end

    describe "with invalid params" do
      it "assigns the student as @student" do
        student = Student.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        put :update, {:id => student.to_param, :student => {}}, valid_session
        assigns(:student).should eq(student)
      end

      it "re-renders the 'edit' template" do
        student = Student.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        put :update, {:id => student.to_param, :student => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested student" do
      student = Student.create! valid_attributes
      expect {
        delete :destroy, {:id => student.to_param}, valid_session
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the students list" do
      student = Student.create! valid_attributes
      delete :destroy, {:id => student.to_param}, valid_session
      response.should redirect_to(students_url)
    end
  end

end
