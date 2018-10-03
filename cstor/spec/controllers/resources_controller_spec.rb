require 'rails_helper'

describe ResourcesController do
  let!(:resource) { Resource.create!(title: "Shoes", abstract: "They are really cool", teacher_only: false, teacher_id: 1) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the recent resources as @resources" do
      get :index
      expect(Resource.all).to include(resource)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end

  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: resource.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct resource as @resource" do
      get :show, { id: resource.id }
      expect(assigns(:resource)).to eq(resource)
    end

    it "renders the :show template" do
      get :show, { id: resource.id }
      expect(response).to render_template(:show)
    end
    it "renders the :show template" do
      get :show, { id: resource.id }
      expect(response).to render_template(:show)
    end

    describe "GET #new" do
      it "responds with status code 200" do
        get :new
        expect(response).to have_http_status 200
      end

      it "assigns the newly created resource as @resource" do
        get :new
        expect(assigns(:resource)).to be_a_new Resource
      end

      it "renders the new resourse form" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      it "creates a Resource object" do
        post :create, { resource: {title: "Where is N?", abstract: "She is missing!", url: "google.com", teacher_only: false}}
        expect(assigns(:resource)).to be_a Resource
      end
  end

end

end
