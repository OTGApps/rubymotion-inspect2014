# -*- encoding : utf-8 -*-
describe "Application 'inspect-2013'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end
  
  it "assures the truth" do
    jamon_humor.should == nil
  end
end
