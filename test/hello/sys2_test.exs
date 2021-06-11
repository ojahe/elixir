defmodule Hello.Sys2Test do
  use Hello.DataCase

  alias Hello.Sys2

  describe "roles2" do
    alias Hello.Sys2.Role2

    @valid_attrs %{role_code: "some role_code", role_name: "some role_name", role_sort: 42}
    @update_attrs %{role_code: "some updated role_code", role_name: "some updated role_name", role_sort: 43}
    @invalid_attrs %{role_code: nil, role_name: nil, role_sort: nil}

    def role2_fixture(attrs \\ %{}) do
      {:ok, role2} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys2.create_role2()

      role2
    end

    test "list_roles2/0 returns all roles2" do
      role2 = role2_fixture()
      assert Sys2.list_roles2() == [role2]
    end

    test "get_role2!/1 returns the role2 with given id" do
      role2 = role2_fixture()
      assert Sys2.get_role2!(role2.id) == role2
    end

    test "create_role2/1 with valid data creates a role2" do
      assert {:ok, %Role2{} = role2} = Sys2.create_role2(@valid_attrs)
      assert role2.role_code == "some role_code"
      assert role2.role_name == "some role_name"
      assert role2.role_sort == 42
    end

    test "create_role2/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys2.create_role2(@invalid_attrs)
    end

    test "update_role2/2 with valid data updates the role2" do
      role2 = role2_fixture()
      assert {:ok, %Role2{} = role2} = Sys2.update_role2(role2, @update_attrs)
      assert role2.role_code == "some updated role_code"
      assert role2.role_name == "some updated role_name"
      assert role2.role_sort == 43
    end

    test "update_role2/2 with invalid data returns error changeset" do
      role2 = role2_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys2.update_role2(role2, @invalid_attrs)
      assert role2 == Sys2.get_role2!(role2.id)
    end

    test "delete_role2/1 deletes the role2" do
      role2 = role2_fixture()
      assert {:ok, %Role2{}} = Sys2.delete_role2(role2)
      assert_raise Ecto.NoResultsError, fn -> Sys2.get_role2!(role2.id) end
    end

    test "change_role2/1 returns a role2 changeset" do
      role2 = role2_fixture()
      assert %Ecto.Changeset{} = Sys2.change_role2(role2)
    end
  end
end
