require 'spec_helper'

describe AlbumsController do

  describe "POST create" do
    let(:album) { mock_model(Album, :user_id => 1).as_null_object }

    before do
      Album.stub(:new).and_return(album)
      @current_user = mock_model(User, :id => 1)
      controller.stub!(:current_user).and_return(@current_user)
    end

    it "creates a new album" do
      Album.should_receive(:new).
        with("title" => "Herzeleid", "artist" => "Rammstein", "year" => "1996", "user_id" => "1").
        and_return(album)
      post :create, :album => { "title" => "Herzeleid", "artist" => "Rammstein", "year" => "1996", "user_id" => "1" }
    end

    context "when the album saves successfully" do
      before do
        album.stub(:save).and_return(true)
      end

      it "redirects to the album index" do
        post :create
        response.should redirect_to(albums_path)
      end
    end

    context "when the album save fails" do
      before do
        album.stub(:save).and_return(false)
      end

      it "assigns @album" do
        post :create
        assigns[:album].should eq(album)
      end

      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end

  end

  describe "GET index" do

    it "renders the index template" do
      # TODO
      pending("this needs authentication helper to work properly")
      get :index
      response.should render_template("index")
    end

    it "assigns @albums" do
      # TODO
      pending("this needs authentication helper to work properly")
      album = Album.create
      get :index
      assigns(:albums).should eq([album])
    end

  end

  describe "GET show" do
    it "renders the show template" do
      # TODO
      pending("this needs authentication helper to work properly")
      album = mock_model(Album)
      get :show, :id => album.id
      response.should render_template("show")
    end
    it "assigns @album"
  end

  describe "GET edit" do
    it "renders edit template"
    it "assigns @album"
  end

  describe "PUT update" do
    # context saves successfully
    # context save fails
  end

  describe "DELETE destroy" do
    it "deletes item"
  end

end