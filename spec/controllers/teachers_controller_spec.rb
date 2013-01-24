require 'spec_helper'


describe TeachersController do

  # This should return the minimal set of attributes required to create a valid
  # Teacher. As you add validations to Teacher, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TeachersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET 'index'" do
    let!(:teacher) { FactoryGirl.create(:teacher) }
    
    before do
      get 'index'
    end
    
    it { response.should be_success }
    it { assigns(:teachers).should == [teacher] }
  end

  describe "GET show" do
    let!(:teacher) { FactoryGirl.create(:teacher) }
    
    it "assigns the requested teacher as @teacher" do
      get :show, :id => teacher.id
      assigns(:teacher).should eq(teacher)
    end
  end

  describe "GET 'new'" do
    before do
      get 'new'
    end

    it { response.should be_success }
    it { assigns(:teacher).should be_instance_of Teacher }
    it { render_template 'new' }
  end


  describe "GET 'edit" do
    let!(:teacher) { FactoryGirl.create(:teacher) }

    before do
      get 'edit', :id => teacher.to_param
    end
  
    it { response.should be_success }
    it { assigns(:teacher).should be_instance_of Teacher }
    it { render_template 'edit' }
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Teacher" do
        expect {
          post :create, {:teacher => valid_attributes}, valid_session
        }.to change(Teacher, :count).by(1)
      end

      it "assigns a newly created teacher as @teacher" do
        post :create, {:teacher => valid_attributes}, valid_session
        assigns(:teacher).should be_a(Teacher)
        assigns(:teacher).should be_persisted
      end

      it "redirects to the created teacher" do
        post :create, {:teacher => valid_attributes}, valid_session
        response.should redirect_to(Teacher.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved teacher as @teacher" do
        # Trigger the behavior that occurs when invalid params are submitted
        Teacher.any_instance.stub(:save).and_return(false)
        post :create, {:teacher => {}}, valid_session
        assigns(:teacher).should be_a_new(Teacher)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Teacher.any_instance.stub(:save).and_return(false)
        post :create, {:teacher => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested teacher" do
        teacher = Teacher.create! valid_attributes
        # Assuming there are no other teachers in the database, this
        # specifies that the Teacher created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Teacher.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => teacher.to_param, :teacher => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested teacher as @teacher" do
        teacher = Teacher.create! valid_attributes
        put :update, {:id => teacher.to_param, :teacher => valid_attributes}, valid_session
        assigns(:teacher).should eq(teacher)
      end

      it "redirects to the teacher" do
        teacher = Teacher.create! valid_attributes
        put :update, {:id => teacher.to_param, :teacher => valid_attributes}, valid_session
        response.should redirect_to(teacher)
      end
    end

    describe "with invalid params" do
      it "assigns the teacher as @teacher" do
        teacher = Teacher.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Teacher.any_instance.stub(:save).and_return(false)
        put :update, {:id => teacher.to_param, :teacher => {}}, valid_session
        assigns(:teacher).should eq(teacher)
      end

      it "re-renders the 'edit' template" do
        teacher = Teacher.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Teacher.any_instance.stub(:save).and_return(false)
        put :update, {:id => teacher.to_param, :teacher => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested teacher" do
      teacher = Teacher.create! valid_attributes
      expect {
        delete :destroy, {:id => teacher.to_param}, valid_session
      }.to change(Teacher, :count).by(-1)
    end

    it "redirects to the teachers list" do
      teacher = Teacher.create! valid_attributes
      delete :destroy, {:id => teacher.to_param}, valid_session
      response.should redirect_to(teachers_url)
    end
  end

end
