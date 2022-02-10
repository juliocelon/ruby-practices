# testing with Minitest
require 'minitest/autorun' # To run automaticly the test

class Calculator
    def sum(a,b)
        a + b
    end

    def substract(a,b)
        a - b
    end
end

class TestCalculator < Minitest::Test
    def setup
        @cal = Calculator.new
    end

    def test_positive_numbers()
        result = @cal.sum(3,4)
        assert_equal result, 7
    end

    def test_negative_numbers()
        result = @cal.sum(3,-4)
        assert_equal result, -1
    end

    def test_substract()
        result = @cal.substract(5,2)
        assert_equal result, 3
    end
end