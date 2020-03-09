defmodule Hello.School do
  @moduledoc """
  The School context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.School.Student
  @default_article_pagination_limit 20
  @doc """
  Returns the list of students.

  ## Examples

      iex> list_students()
      [%Student{}, ...]

  """
  def list_students (params)do
IO.inspect(params)
    params = Map.put(params , "s" , "id+desc"  )
    r= Student |> Turbo.Ecto.turbo(params, [entry_name: "entries"])
    %{
      :entries => Repo.preload(r.entries,:user),
      :paginate => r.paginate
    }
  end
  def list_students2 (params)do
    size = params["p_size"] || @default_article_pagination_limit
    page = params["p_num"] || 1

    conditions = true
    conditions =
      if params["tel"] do
        dynamic([s], s.tel== ^(params["tel"]) and ^conditions)
      else
        conditions
      end

    conditions =
      if params["name"] do
        dynamic([s], s.name== ^(params["name"]) and ^conditions)
      else
        conditions
      end

    from(s in Student, limit: ^size, offset: ^((page-1) * size), order_by: s.updated_at, where: ^conditions)
    |> Repo.all
  end

  def list_by_citizen_id (attrs)do
    #IO.puts "AAAAAAAAAAAAAAAAAAAA::"<>attrs["citizen_id"]   s.citizen_id == ^(attrs["citizen_id"])  or
    from(s in Student, where: s.learning_section == ^( get_section(attrs["grade"]))  and ( (s.name == ^(attrs["name"])  and s.tel == ^(attrs["tel"])  )) )
    |> Repo.all
  end

  defp get_section(section ) do
    cond do
      String.starts_with?(section,"小班") || String.starts_with?(section,"中班") || String.starts_with?(section,"大班") ->
        "幼儿园"
      String.starts_with?(section,"初一") || String.starts_with?(section,"初二") || String.starts_with?(section,"初三")  ->
        "初中"
      String.starts_with?(section,"高一") || String.starts_with?(section,"高二") || String.starts_with?(section,"高三")  ->
        "高中"
      true  ->
        "小学"
    end
  end
  @doc """
  Gets a single student.

  Raises `Ecto.NoResultsError` if the Student does not exist.

  ## Examples

      iex> get_student!(123)
      %Student{}

      iex> get_student!(456)
      ** (Ecto.NoResultsError)

  """
  def get_student!(id), do: Repo.get!(Student, id)

  @doc """
  Creates a student.

  ## Examples

      iex> create_student(%{field: value})
      {:ok, %Student{}}

      iex> create_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  DateTime.utc_now
  """
  def create_student(user_id,attrs \\ %{}) do
    r=list_by_citizen_id(attrs);
    if r && List.first(r) do
      cg=  %Student{}
           |> Student.changeset(attrs)
           |>Ecto.Changeset.put_change(:regist_time,Date.utc_today())
           |>Ecto.Changeset.put_change(:user_id, user_id)
       {:error2, cg}
    else
      cg=  %Student{}
        |> Student.changeset(attrs)
        |>Ecto.Changeset.put_change(:regist_time,Date.utc_today())
        |>Ecto.Changeset.put_change(:user_id, user_id)
        |> Repo.insert()
     end
  end
  def create_student2(user_id,attrs \\ %{}) do
    r=list_by_citizen_id(attrs);
    if r && List.first(r) do
      {:error2, Student.changeset(%Student{},attrs)}
    else
      cg=  %Student{}
           |> Student.changeset(attrs)
           |>Ecto.Changeset.put_change(:regist_time,Date.utc_today())
           |>Ecto.Changeset.put_change(:user_id, user_id)
          # |> Repo.insert()
      {:ok, cg}
    end
  end

  @doc """
  Updates a student.

  ## Examples

      iex> update_student(student, %{field: new_value})
      {:ok, %Student{}}

      iex> update_student(student, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_student(%Student{} = student, attrs) do
    r=list_by_citizen_id(attrs);
    if r && List.first(r) && List.first(r).id != String.to_integer(attrs["id"]) do
      {:error2, Student.changeset(student,attrs)}
    else
    student
    |> Student.changeset(attrs)
    |>Ecto.Changeset.put_change(:front_money_time, Date.utc_today())
    |> Repo.update()
  end
end
  @doc """
  Deletes a Student.

  ## Examples

      iex> delete_student(student)
      {:ok, %Student{}}

      iex> delete_student(student)
      {:error, %Ecto.Changeset{}}

  """
  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end
  def delete_student_all() do
    Repo.delete_all(Student)
  end
  @doc """
  Returns an `%Ecto.Changeset{}` for tracking student changes.

  ## Examples

      iex> change_student(student)
      %Ecto.Changeset{source: %Student{}}

  """
  def change_student(%Student{} = student) do
    Student.changeset(student, %{})
  end
end
