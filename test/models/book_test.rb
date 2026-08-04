require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "book should be valid" do
    book = books(:one)

    assert book.valid?
  end

  test "title should be present" do
    book = books(:one)
    book.title = nil

    assert_not book.valid?
  end

  test "price should be greater than zero" do
    book = books(:one)
    book.price = 0

    assert_not book.valid?
  end

  test "title should be titleized before save" do
    book = books(:one)
    book.title = "ruby on rails"

    book.save

    assert_equal "Ruby On Rails", book.title
  end
end
