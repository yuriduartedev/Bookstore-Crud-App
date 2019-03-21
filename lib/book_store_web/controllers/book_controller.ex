defmodule BookStoreWeb.BookController do
  use BookStoreWeb, :controller

  alias BookStore.Exemplars
  alias BookStore.Exemplars.Book

  def index(conn, _params) do
    books = Exemplars.list_books()
    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    changeset = Exemplars.change_book(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    case Exemplars.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: book_path(conn, :show, book))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Exemplars.get_book!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Exemplars.get_book!(id)
    changeset = Exemplars.change_book(book)
    render(conn, "edit.html", book: book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Exemplars.get_book!(id)

    case Exemplars.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: book_path(conn, :show, book))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Exemplars.get_book!(id)
    {:ok, _book} = Exemplars.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: book_path(conn, :index))
  end
end
