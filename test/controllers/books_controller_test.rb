require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @category = categories(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: {
        book: {
          title: "Rails API",
          author: "Ali Ahmed",
          price: 2500,
          published_year: 2024,
          available: true,
          category_id: @category.id
        }
      }
    end

    assert_response :created
  end

  test "should update book" do
    patch book_url(@book), params: {
      book: {
        title: "Updated Book"
      }
    }

    assert_response :success
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_response :success
  end
end
