require 'spec_helper'

describe DisciplinesController do

  # This should return the minimal set of attributes required to create a valid
  # Discipline. As you add validations to Discipline, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => "Geografia"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DisciplinesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all disciplines as @disciplines" do
      discipline = Discipline.create! valid_attributes
      get :index, {}, valid_session
      assigns(:disciplines).should eq([discipline])
    end
  end

  describe "GET show" do
    it "assigns the requested discipline as @discipline" do
      discipline = Discipline.create! valid_attributes
      get :show, {:id => discipline.to_param}, valid_session
      assigns(:discipline).should eq(discipline)
    end
  end

  describe "GET new" do
    it "assigns a new discipline as @discipline" do
      get :new, {}, valid_session
      assigns(:discipline).should be_a_new(Discipline)
    end
  end

  describe "GET edit" do
    it "assigns the requested discipline as @discipline" do
      discipline = Discipline.create! valid_attributes
      get :edit, {:id => discipline.to_param}, valid_session
      assigns(:discipline).should eq(discipline)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Discipline" do
        expect {
          post :create, {:discipline => valid_attributes}, valid_session
        }.to change(Discipline, :count).by(1)
      end

      it "assigns a newly created discipline as @discipline" do
        post :create, {:discipline => valid_attributes}, valid_session
        assigns(:discipline).should be_a(Discipline)
        assigns(:discipline).should be_persisted
      end

      it "redirects to the created discipline" do
        post :create, {:discipline => valid_attributes}, valid_session
        response.should redirect_to(Discipline.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved discipline as @discipline" do
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        post :create, {:discipline => {}}, valid_session
        assigns(:discipline).should be_a_new(Discipline)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        post :create, {:discipline => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested discipline" do
        discipline = Discipline.create! valid_attributes
        # Assuming there are no other disciplines in the database, this
        # specifies that the Discipline created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Discipline.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => discipline.to_param, :discipline => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested discipline as @discipline" do
        discipline = Discipline.create! valid_attributes
        put :update, {:id => discipline.to_param, :discipline => valid_attributes}, valid_session
        assigns(:discipline).should eq(discipline)
      end

      it "redirects to the discipline" do
        discipline = Discipline.create! valid_attributes
        put :update, {:id => discipline.to_param, :discipline => valid_attributes}, valid_session
        response.should redirect_to(discipline)
      end
    end

    describe "with invalid params" do
      it "assigns the discipline as @discipline" do
        discipline = Discipline.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        put :update, {:id => discipline.to_param, :discipline => {}}, valid_session
        assigns(:discipline).should eq(discipline)
      end

      it "re-renders the 'edit' template" do
        discipline = Discipline.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Discipline.any_instance.stub(:save).and_return(false)
        put :update, {:id => discipline.to_param, :discipline => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested discipline" do
      discipline = Discipline.create! valid_attributes
      expect {
        delete :destroy, {:id => discipline.to_param}, valid_session
      }.to change(Discipline, :count).by(-1)
    end

    it "redirects to the disciplines list" do
      discipline = Discipline.create! valid_attributes
      delete :destroy, {:id => discipline.to_param}, valid_session
      response.should redirect_to(disciplines_url)
    end
  end

end
