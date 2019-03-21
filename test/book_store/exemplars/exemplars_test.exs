defmodule BookStore.ExemplarsTest do
  use BookStore.DataCase

  alias BookStore.Exemplars

  describe "books" do
    alias BookStore.Exemplars.Book

    @valid_attrs %{author: "some author", category: "some category", name: "some name"}
    @update_attrs %{author: "some updated author", category: "some updated category", name: "some updated name"}
    @invalid_attrs %{author: nil, category: nil, name: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Exemplars.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Exemplars.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Exemplars.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Exemplars.create_book(@valid_attrs)
      assert book.author == "some author"
      assert book.category == "some category"
      assert book.name == "some name"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exemplars.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, book} = Exemplars.update_book(book, @update_attrs)
      assert %Book{} = book
      assert book.author == "some updated author"
      assert book.category == "some updated category"
      assert book.name == "some updated name"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Exemplars.update_book(book, @invalid_attrs)
      assert book == Exemplars.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Exemplars.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Exemplars.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Exemplars.change_book(book)
    end
  end
end
