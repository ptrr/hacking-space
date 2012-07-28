require 'disqus'

describe Disqus do

  describe ".id" do

    it "returns id if wordpress id is nil" do
      Disqus.id("id", nil).should == "id"
    end

  end

end
