#spec/string_calculator_spec.rb
require "string_calculator"

describe StringCalculator do
  
  describe "add" do
    context "given an empty string" do
      it "returns zero" do
        #expect.to or expect.not_to
        expect(StringCalculator.add("")).to eql(0)
      end
    end
  end
end
