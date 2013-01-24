require 'spec_helper'


describe TeachersController do

  # This should return the minimal set of attributes required to create a valid
  # Teacher. As you add validations to Teacher, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {name: "Professor Pardal"}
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
    context "with valid params" do
      before { post :create, teacher: valid_attributes }
      
      it { assigns(:teacher).should be_a(Teacher) }
      it { assigns(:teacher).should be_persisted }
      it { response.should redirect_to(teachers_path) }
    end
    
    context "with invalid params" do
      def do_action(params)
        post(:create, teacher: params)
      end
    
      before do
        do_action({name: ""})
      end

      it { should render_template(:new) }
      it { should respond_with(:success) }
    end
  end

  describe "POST 'update'" do
    let!(:teacher) { FactoryGirl.create(:teacher) }
    context "with valid params" do
      before do
        put 'update', :id => teacher.to_param, :teacher => valid_attributes
      end

      it { assigns(:teacher).should == teacher }
      it { redirect_to(teachers_path) }
      it { flash[:notice].should == "Teacher was successfully updated." }
      it { teacher.reload.name.should == "Professor Pardal" }
    end
    
    context "with invalid params" do
      before do
        put 'update', :id => teacher.to_param, :teacher => { :name => "" }
      end

      it { assigns(:teacher).should == teacher }
      it { render_template 'edit' }
    end
        
    it "should redirect to home" do
      put 'update', :id => teacher.to_param, :teacher => valid_attributes
      response.should redirect_to(teachers_path)
    end
  end
  
  describe "DELETE destroy" do
    let!(:teacher) { FactoryGirl.create(:teacher) }
    
    context "should find and redirect" do      
      before do
        delete :destroy, id: teacher.to_param
      end
      
      it { assigns(:teacher).should == teacher }
      it { redirect_to(teachers_path) }
    end  
          
    context "destroy" do
      it "should destroy a Teacher" do
        expect {
          delete :destroy, id: teacher.to_param
        }.to change(Teacher, :count).by(-1)
      end        
    end    
  end

end
