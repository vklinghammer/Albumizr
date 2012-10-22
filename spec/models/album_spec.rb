require 'spec_helper'

describe Album do

  before(:each) do
    @album = Album.new(
      title: "title",
      artist: "artist",
      year: "1970",
      user: mock_model("User")
    )
  end

  it "is valid with valid attributes" do
    @album.should be_valid
  end

  it "is invalid without a user it belongs to" do
    @album.user = nil
    @album.should_not be_valid
  end

  it "is invalid without a title" do
    @album.title = " "
    @album.should_not be_valid
  end

  it "is invalid without an artist" do
    @album.artist = " "
    @album.should_not be_valid
  end

  it "is invalid without a year" do
    @album.year = " "
    @album.should_not be_valid
  end

  it "is invalid if year is not a number" do
    @album.year = "ABCD"
    @album.should_not be_valid
  end

  it "is invalid with a year that lies before the production of the first commercial album" do
    @album.year = 1889-1
    @album.should_not be_valid
  end

  describe "images" do
    it "should not exceed 1.44 MB"
    it "should be of filetype JPEG or PNG"
    it "should be resized properly"
  end

  describe "search" do
    it "should return the title I searched for if it exists"
    it "should return all titles if I search for a blank title"
  end
end