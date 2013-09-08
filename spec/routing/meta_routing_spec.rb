require "spec_helper"

describe MetaController do
  describe "routing" do

    it "routes to #index" do
      get("/meta").should route_to("meta#index")
    end

    it "routes to #new" do
      get("/meta/new").should route_to("meta#new")
    end

    it "routes to #show" do
      get("/meta/1").should route_to("meta#show", id: "1")
    end

    it "routes to #edit" do
      get("/meta/1/edit").should route_to("meta#edit", id: "1")
    end

    it "routes to #create" do
      post("/meta").should route_to("meta#create")
    end

    it "routes to #update" do
      put("/meta/1").should route_to("meta#update", id: "1")
    end

    it "routes to #destroy" do
      delete("/meta/1").should route_to("meta#destroy", id: "1")
    end

  end
end
