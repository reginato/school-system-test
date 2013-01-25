require 'spec_helper'

describe DisciplinesController do

  # This should return the minimal set of attributes required to create a valid
  # Discipline. As you add validations to Discipline, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => "Geografia", :teacher_id => "1"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DisciplinesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET 'index'" do
    let!(:discipline) { FactoryGirl.create(:discipline) }
    
    before do
      get 'index'
    end
    
    it { response.should be_success }
    it { assigns(:disciplines).should == [discipline] }
  end

  describe "GET show" do
    let!(:discipline) { FactoryGirl.create(:discipline) }
    
    it "assigns the requested discipline as @discipline" do
      get :show, :id => discipline.id
      assigns(:discipline).should eq(discipline)
    end
  end

  describe "GET 'new'" do
    before do
      get 'new'
    end

    it { response.should be_success }
    it { assigns(:discipline).should be_instance_of Discipline }
    it { render_template 'new' }
  end

  describe "GET 'edit" do
    let!(:discipline) { FactoryGirl.create(:discipline) }

    before do
      get 'edit', :id => discipline.to_param
    end
  
    it { response.should be_success }
    it { assigns(:discipline).should be_instance_of Discipline }
    it { render_template 'edit' }
  end

  describe "POST create" do          
    context "with valid params" do
      before { post :create, discipline: valid_attributes }
      
      it { assigns(:discipline).should be_a(Discipline) }
      it { assigns(:discipline).should be_persisted }
      it { response.should redirect_to(disciplines_path) }
    end
    
    context "with invalid params" do
      def do_action(param)
        post(:create, discipline: param)
      end
    
      before do
        do_action({name: ""})
      end

      it { should render_template(:new) }
      it { should respond_with(:success) }
    end
  end

  describe "POST 'update'" do
    let!(:discipline) { FactoryGirl.create(:discipline) }
    context "with valid params" do
      before do
        put 'update', :id => discipline.to_param, :discipline => { :name => "Geografia" }
      end

      it { assigns(:discipline).should == discipline }
      it { redirect_to(disciplines_path) }
      it { flash[:notice].should == "Discipline was successfully updated." }
      it { discipline.reload.name.should == "Geografia" }
    end
    
    context "with invalid params" do
      before do
        put 'update', :id => discipline.to_param, :discipline => { :name => "" }
      end

      it { assigns(:discipline).should == discipline }
      it { render_template 'edit' }
    end
        
    it "should redirect to home" do
      put 'update', :id => discipline.to_param, :discipline => { :name => "Geografia" }
      response.should redirect_to(disciplines_path)
    end
  end

  describe "DELETE destroy" do
    let!(:discipline) { FactoryGirl.create(:discipline) }  
    
    context "should find and redirect" do      
      before do
        delete :destroy, id: discipline.to_param
      end
      
      it { assigns(:discipline).should == discipline }
      it { redirect_to(disciplines_path) }
    end  
          
    context "context" do
      it "should destroy a Discipline" do
        expect {
          delete :destroy, id: discipline.to_param
        }.to change(Discipline, :count).by(-1)
      end        
    end    
  end
end
