require 'minitest/spec'
require 'minitest/autorun'
require './exercise'

describe Exercise do
  describe "#marklar" do
    it "should return a marklar'd string" do
      Exercise.marklar("The quick brown fox").must_equal "The marklar marklar fox"
    end

    it "should capitalize Marklar when replacing capitalized words" do
      Exercise.marklar("Down goes Frazier").must_equal "Down goes Marklar"
      Exercise.marklar("Monday is Martin Luther King day").must_equal "Marklar is Marklar Marklar King day"
    end

    it "should keep end-of-word punctuation intact" do
      Exercise.marklar("How is the weather today? I have not been outside.").must_equal "How is the marklar marklar? I have not been marklar."
    end
  end

  describe "#even_fibonacci" do
    it "should sum the even numbers in a Fibonacci sequence" do
      Exercise.even_fibonacci(5).must_equal 2
      Exercise.even_fibonacci(11).must_equal 44
      Exercise.even_fibonacci(19).must_equal 3382
      Exercise.even_fibonacci(35).must_equal 4_613_732
    end
  end
end
