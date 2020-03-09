defmodule Hello.SysTest do
  use Hello.DataCase

  alias Hello.Sys

  describe "offices" do
    alias Hello.Sys.Office

    @valid_attrs %{"": "some ", address: "some address", code: "some code", corp_code: "some corp_code", corp_name: "some corp_name", email: "some email", full_name: "some full_name", inserted_by: "some inserted_by", leader: "some leader", office_name: "some office_name", office_type: "some office_type", parent_code: "some parent_code", parent_codes: "some parent_codes", phone: "some phone", remarks: "some remarks", status: "some status", tree_leaf: "some tree_leaf", tree_level: "some tree_level", tree_names: "some tree_names", tree_sort: "some tree_sort", tree_sorts: "some tree_sorts", updated_by: "some updated_by", view_code: "some view_code", zip_code: "some zip_code"}
    @update_attrs %{"": "some updated ", address: "some updated address", code: "some updated code", corp_code: "some updated corp_code", corp_name: "some updated corp_name", email: "some updated email", full_name: "some updated full_name", inserted_by: "some updated inserted_by", leader: "some updated leader", office_name: "some updated office_name", office_type: "some updated office_type", parent_code: "some updated parent_code", parent_codes: "some updated parent_codes", phone: "some updated phone", remarks: "some updated remarks", status: "some updated status", tree_leaf: "some updated tree_leaf", tree_level: "some updated tree_level", tree_names: "some updated tree_names", tree_sort: "some updated tree_sort", tree_sorts: "some updated tree_sorts", updated_by: "some updated updated_by", view_code: "some updated view_code", zip_code: "some updated zip_code"}
    @invalid_attrs %{"": nil, address: nil, code: nil, corp_code: nil, corp_name: nil, email: nil, full_name: nil, inserted_by: nil, leader: nil, office_name: nil, office_type: nil, parent_code: nil, parent_codes: nil, phone: nil, remarks: nil, status: nil, tree_leaf: nil, tree_level: nil, tree_names: nil, tree_sort: nil, tree_sorts: nil, updated_by: nil, view_code: nil, zip_code: nil}

    def office_fixture(attrs \\ %{}) do
      {:ok, office} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_office()

      office
    end

    test "list_offices/0 returns all offices" do
      office = office_fixture()
      assert Sys.list_offices() == [office]
    end

    test "get_office!/1 returns the office with given id" do
      office = office_fixture()
      assert Sys.get_office!(office.id) == office
    end

    test "create_office/1 with valid data creates a office" do
      assert {:ok, %Office{} = office} = Sys.create_office(@valid_attrs)
      assert office. == "some "
      assert office.address == "some address"
      assert office.code == "some code"
      assert office.corp_code == "some corp_code"
      assert office.corp_name == "some corp_name"
      assert office.email == "some email"
      assert office.full_name == "some full_name"
      assert office.inserted_by == "some inserted_by"
      assert office.leader == "some leader"
      assert office.office_name == "some office_name"
      assert office.office_type == "some office_type"
      assert office.parent_code == "some parent_code"
      assert office.parent_codes == "some parent_codes"
      assert office.phone == "some phone"
      assert office.remarks == "some remarks"
      assert office.status == "some status"
      assert office.tree_leaf == "some tree_leaf"
      assert office.tree_level == "some tree_level"
      assert office.tree_names == "some tree_names"
      assert office.tree_sort == "some tree_sort"
      assert office.tree_sorts == "some tree_sorts"
      assert office.updated_by == "some updated_by"
      assert office.view_code == "some view_code"
      assert office.zip_code == "some zip_code"
    end

    test "create_office/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_office(@invalid_attrs)
    end

    test "update_office/2 with valid data updates the office" do
      office = office_fixture()
      assert {:ok, %Office{} = office} = Sys.update_office(office, @update_attrs)
      assert office. == "some updated "
      assert office.address == "some updated address"
      assert office.code == "some updated code"
      assert office.corp_code == "some updated corp_code"
      assert office.corp_name == "some updated corp_name"
      assert office.email == "some updated email"
      assert office.full_name == "some updated full_name"
      assert office.inserted_by == "some updated inserted_by"
      assert office.leader == "some updated leader"
      assert office.office_name == "some updated office_name"
      assert office.office_type == "some updated office_type"
      assert office.parent_code == "some updated parent_code"
      assert office.parent_codes == "some updated parent_codes"
      assert office.phone == "some updated phone"
      assert office.remarks == "some updated remarks"
      assert office.status == "some updated status"
      assert office.tree_leaf == "some updated tree_leaf"
      assert office.tree_level == "some updated tree_level"
      assert office.tree_names == "some updated tree_names"
      assert office.tree_sort == "some updated tree_sort"
      assert office.tree_sorts == "some updated tree_sorts"
      assert office.updated_by == "some updated updated_by"
      assert office.view_code == "some updated view_code"
      assert office.zip_code == "some updated zip_code"
    end

    test "update_office/2 with invalid data returns error changeset" do
      office = office_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_office(office, @invalid_attrs)
      assert office == Sys.get_office!(office.id)
    end

    test "delete_office/1 deletes the office" do
      office = office_fixture()
      assert {:ok, %Office{}} = Sys.delete_office(office)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_office!(office.id) end
    end

    test "change_office/1 returns a office changeset" do
      office = office_fixture()
      assert %Ecto.Changeset{} = Sys.change_office(office)
    end
  end

  describe "offices" do
    alias Hello.Sys.Office

    @valid_attrs %{"": "some ", address: "some address", code: "some code", corp_code: "some corp_code", corp_name: "some corp_name", email: "some email", full_name: "some full_name", inserted_by: "some inserted_by", leader: "some leader", office_name: "some office_name", office_type: "some office_type", parent_code: "some parent_code", parent_codes: "some parent_codes", phone: "some phone", remarks: "some remarks", status: "some status", tree_leaf: "some tree_leaf", tree_level: "some tree_level", tree_names: "some tree_names", tree_sort: 42, tree_sorts: "some tree_sorts", updated_by: "some updated_by", view_code: "some view_code", zip_code: "some zip_code"}
    @update_attrs %{"": "some updated ", address: "some updated address", code: "some updated code", corp_code: "some updated corp_code", corp_name: "some updated corp_name", email: "some updated email", full_name: "some updated full_name", inserted_by: "some updated inserted_by", leader: "some updated leader", office_name: "some updated office_name", office_type: "some updated office_type", parent_code: "some updated parent_code", parent_codes: "some updated parent_codes", phone: "some updated phone", remarks: "some updated remarks", status: "some updated status", tree_leaf: "some updated tree_leaf", tree_level: "some updated tree_level", tree_names: "some updated tree_names", tree_sort: 43, tree_sorts: "some updated tree_sorts", updated_by: "some updated updated_by", view_code: "some updated view_code", zip_code: "some updated zip_code"}
    @invalid_attrs %{"": nil, address: nil, code: nil, corp_code: nil, corp_name: nil, email: nil, full_name: nil, inserted_by: nil, leader: nil, office_name: nil, office_type: nil, parent_code: nil, parent_codes: nil, phone: nil, remarks: nil, status: nil, tree_leaf: nil, tree_level: nil, tree_names: nil, tree_sort: nil, tree_sorts: nil, updated_by: nil, view_code: nil, zip_code: nil}

    def office_fixture(attrs \\ %{}) do
      {:ok, office} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_office()

      office
    end

    test "list_offices/0 returns all offices" do
      office = office_fixture()
      assert Sys.list_offices() == [office]
    end

    test "get_office!/1 returns the office with given id" do
      office = office_fixture()
      assert Sys.get_office!(office.id) == office
    end

    test "create_office/1 with valid data creates a office" do
      assert {:ok, %Office{} = office} = Sys.create_office(@valid_attrs)
      assert office. == "some "
      assert office.address == "some address"
      assert office.code == "some code"
      assert office.corp_code == "some corp_code"
      assert office.corp_name == "some corp_name"
      assert office.email == "some email"
      assert office.full_name == "some full_name"
      assert office.inserted_by == "some inserted_by"
      assert office.leader == "some leader"
      assert office.office_name == "some office_name"
      assert office.office_type == "some office_type"
      assert office.parent_code == "some parent_code"
      assert office.parent_codes == "some parent_codes"
      assert office.phone == "some phone"
      assert office.remarks == "some remarks"
      assert office.status == "some status"
      assert office.tree_leaf == "some tree_leaf"
      assert office.tree_level == "some tree_level"
      assert office.tree_names == "some tree_names"
      assert office.tree_sort == 42
      assert office.tree_sorts == "some tree_sorts"
      assert office.updated_by == "some updated_by"
      assert office.view_code == "some view_code"
      assert office.zip_code == "some zip_code"
    end

    test "create_office/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_office(@invalid_attrs)
    end

    test "update_office/2 with valid data updates the office" do
      office = office_fixture()
      assert {:ok, %Office{} = office} = Sys.update_office(office, @update_attrs)
      assert office. == "some updated "
      assert office.address == "some updated address"
      assert office.code == "some updated code"
      assert office.corp_code == "some updated corp_code"
      assert office.corp_name == "some updated corp_name"
      assert office.email == "some updated email"
      assert office.full_name == "some updated full_name"
      assert office.inserted_by == "some updated inserted_by"
      assert office.leader == "some updated leader"
      assert office.office_name == "some updated office_name"
      assert office.office_type == "some updated office_type"
      assert office.parent_code == "some updated parent_code"
      assert office.parent_codes == "some updated parent_codes"
      assert office.phone == "some updated phone"
      assert office.remarks == "some updated remarks"
      assert office.status == "some updated status"
      assert office.tree_leaf == "some updated tree_leaf"
      assert office.tree_level == "some updated tree_level"
      assert office.tree_names == "some updated tree_names"
      assert office.tree_sort == 43
      assert office.tree_sorts == "some updated tree_sorts"
      assert office.updated_by == "some updated updated_by"
      assert office.view_code == "some updated view_code"
      assert office.zip_code == "some updated zip_code"
    end

    test "update_office/2 with invalid data returns error changeset" do
      office = office_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_office(office, @invalid_attrs)
      assert office == Sys.get_office!(office.id)
    end

    test "delete_office/1 deletes the office" do
      office = office_fixture()
      assert {:ok, %Office{}} = Sys.delete_office(office)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_office!(office.id) end
    end

    test "change_office/1 returns a office changeset" do
      office = office_fixture()
      assert %Ecto.Changeset{} = Sys.change_office(office)
    end
  end

  describe "offices" do
    alias Hello.Sys.Office

    @valid_attrs %{"": "some ", address: "some address", code: "some code", corp_code: "some corp_code", corp_name: "some corp_name", email: "some email", full_name: "some full_name", inserted_by: "some inserted_by", leader: "some leader", office_name: "some office_name", office_type: "some office_type", parent_code: "some parent_code", parent_codes: "some parent_codes", phone: "some phone", remarks: "some remarks", status: "some status", tree_leaf: "some tree_leaf", tree_level: 42, tree_names: "some tree_names", tree_sort: 42, tree_sorts: "some tree_sorts", updated_by: 42, view_code: "some view_code", zip_code: "some zip_code"}
    @update_attrs %{"": "some updated ", address: "some updated address", code: "some updated code", corp_code: "some updated corp_code", corp_name: "some updated corp_name", email: "some updated email", full_name: "some updated full_name", inserted_by: "some updated inserted_by", leader: "some updated leader", office_name: "some updated office_name", office_type: "some updated office_type", parent_code: "some updated parent_code", parent_codes: "some updated parent_codes", phone: "some updated phone", remarks: "some updated remarks", status: "some updated status", tree_leaf: "some updated tree_leaf", tree_level: 43, tree_names: "some updated tree_names", tree_sort: 43, tree_sorts: "some updated tree_sorts", updated_by: 43, view_code: "some updated view_code", zip_code: "some updated zip_code"}
    @invalid_attrs %{"": nil, address: nil, code: nil, corp_code: nil, corp_name: nil, email: nil, full_name: nil, inserted_by: nil, leader: nil, office_name: nil, office_type: nil, parent_code: nil, parent_codes: nil, phone: nil, remarks: nil, status: nil, tree_leaf: nil, tree_level: nil, tree_names: nil, tree_sort: nil, tree_sorts: nil, updated_by: nil, view_code: nil, zip_code: nil}

    def office_fixture(attrs \\ %{}) do
      {:ok, office} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_office()

      office
    end

    test "list_offices/0 returns all offices" do
      office = office_fixture()
      assert Sys.list_offices() == [office]
    end

    test "get_office!/1 returns the office with given id" do
      office = office_fixture()
      assert Sys.get_office!(office.id) == office
    end

    test "create_office/1 with valid data creates a office" do
      assert {:ok, %Office{} = office} = Sys.create_office(@valid_attrs)
      assert office. == "some "
      assert office.address == "some address"
      assert office.code == "some code"
      assert office.corp_code == "some corp_code"
      assert office.corp_name == "some corp_name"
      assert office.email == "some email"
      assert office.full_name == "some full_name"
      assert office.inserted_by == "some inserted_by"
      assert office.leader == "some leader"
      assert office.office_name == "some office_name"
      assert office.office_type == "some office_type"
      assert office.parent_code == "some parent_code"
      assert office.parent_codes == "some parent_codes"
      assert office.phone == "some phone"
      assert office.remarks == "some remarks"
      assert office.status == "some status"
      assert office.tree_leaf == "some tree_leaf"
      assert office.tree_level == 42
      assert office.tree_names == "some tree_names"
      assert office.tree_sort == 42
      assert office.tree_sorts == "some tree_sorts"
      assert office.updated_by == 42
      assert office.view_code == "some view_code"
      assert office.zip_code == "some zip_code"
    end

    test "create_office/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_office(@invalid_attrs)
    end

    test "update_office/2 with valid data updates the office" do
      office = office_fixture()
      assert {:ok, %Office{} = office} = Sys.update_office(office, @update_attrs)
      assert office. == "some updated "
      assert office.address == "some updated address"
      assert office.code == "some updated code"
      assert office.corp_code == "some updated corp_code"
      assert office.corp_name == "some updated corp_name"
      assert office.email == "some updated email"
      assert office.full_name == "some updated full_name"
      assert office.inserted_by == "some updated inserted_by"
      assert office.leader == "some updated leader"
      assert office.office_name == "some updated office_name"
      assert office.office_type == "some updated office_type"
      assert office.parent_code == "some updated parent_code"
      assert office.parent_codes == "some updated parent_codes"
      assert office.phone == "some updated phone"
      assert office.remarks == "some updated remarks"
      assert office.status == "some updated status"
      assert office.tree_leaf == "some updated tree_leaf"
      assert office.tree_level == 43
      assert office.tree_names == "some updated tree_names"
      assert office.tree_sort == 43
      assert office.tree_sorts == "some updated tree_sorts"
      assert office.updated_by == 43
      assert office.view_code == "some updated view_code"
      assert office.zip_code == "some updated zip_code"
    end

    test "update_office/2 with invalid data returns error changeset" do
      office = office_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_office(office, @invalid_attrs)
      assert office == Sys.get_office!(office.id)
    end

    test "delete_office/1 deletes the office" do
      office = office_fixture()
      assert {:ok, %Office{}} = Sys.delete_office(office)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_office!(office.id) end
    end

    test "change_office/1 returns a office changeset" do
      office = office_fixture()
      assert %Ecto.Changeset{} = Sys.change_office(office)
    end
  end

  describe "offices" do
    alias Hello.Sys.Office

    @valid_attrs %{address: "some address", code: "some code", corp_code: "some corp_code", corp_name: "some corp_name", email: "some email", full_name: "some full_name", inserted_by: 42, leader: "some leader", office_name: "some office_name", office_type: "some office_type", parent_code: "some parent_code", parent_codes: "some parent_codes", phone: "some phone", remarks: "some remarks", status: "some status", tree_leaf: "some tree_leaf", tree_level: 42, tree_names: "some tree_names", tree_sort: 42, tree_sorts: "some tree_sorts", updated_by: 42, view_code: "some view_code", zip_code: "some zip_code"}
    @update_attrs %{address: "some updated address", code: "some updated code", corp_code: "some updated corp_code", corp_name: "some updated corp_name", email: "some updated email", full_name: "some updated full_name", inserted_by: 43, leader: "some updated leader", office_name: "some updated office_name", office_type: "some updated office_type", parent_code: "some updated parent_code", parent_codes: "some updated parent_codes", phone: "some updated phone", remarks: "some updated remarks", status: "some updated status", tree_leaf: "some updated tree_leaf", tree_level: 43, tree_names: "some updated tree_names", tree_sort: 43, tree_sorts: "some updated tree_sorts", updated_by: 43, view_code: "some updated view_code", zip_code: "some updated zip_code"}
    @invalid_attrs %{address: nil, code: nil, corp_code: nil, corp_name: nil, email: nil, full_name: nil, inserted_by: nil, leader: nil, office_name: nil, office_type: nil, parent_code: nil, parent_codes: nil, phone: nil, remarks: nil, status: nil, tree_leaf: nil, tree_level: nil, tree_names: nil, tree_sort: nil, tree_sorts: nil, updated_by: nil, view_code: nil, zip_code: nil}

    def office_fixture(attrs \\ %{}) do
      {:ok, office} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_office()

      office
    end

    test "list_offices/0 returns all offices" do
      office = office_fixture()
      assert Sys.list_offices() == [office]
    end

    test "get_office!/1 returns the office with given id" do
      office = office_fixture()
      assert Sys.get_office!(office.id) == office
    end

    test "create_office/1 with valid data creates a office" do
      assert {:ok, %Office{} = office} = Sys.create_office(@valid_attrs)
      assert office.address == "some address"
      assert office.code == "some code"
      assert office.corp_code == "some corp_code"
      assert office.corp_name == "some corp_name"
      assert office.email == "some email"
      assert office.full_name == "some full_name"
      assert office.inserted_by == 42
      assert office.leader == "some leader"
      assert office.office_name == "some office_name"
      assert office.office_type == "some office_type"
      assert office.parent_code == "some parent_code"
      assert office.parent_codes == "some parent_codes"
      assert office.phone == "some phone"
      assert office.remarks == "some remarks"
      assert office.status == "some status"
      assert office.tree_leaf == "some tree_leaf"
      assert office.tree_level == 42
      assert office.tree_names == "some tree_names"
      assert office.tree_sort == 42
      assert office.tree_sorts == "some tree_sorts"
      assert office.updated_by == 42
      assert office.view_code == "some view_code"
      assert office.zip_code == "some zip_code"
    end

    test "create_office/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_office(@invalid_attrs)
    end

    test "update_office/2 with valid data updates the office" do
      office = office_fixture()
      assert {:ok, %Office{} = office} = Sys.update_office(office, @update_attrs)
      assert office.address == "some updated address"
      assert office.code == "some updated code"
      assert office.corp_code == "some updated corp_code"
      assert office.corp_name == "some updated corp_name"
      assert office.email == "some updated email"
      assert office.full_name == "some updated full_name"
      assert office.inserted_by == 43
      assert office.leader == "some updated leader"
      assert office.office_name == "some updated office_name"
      assert office.office_type == "some updated office_type"
      assert office.parent_code == "some updated parent_code"
      assert office.parent_codes == "some updated parent_codes"
      assert office.phone == "some updated phone"
      assert office.remarks == "some updated remarks"
      assert office.status == "some updated status"
      assert office.tree_leaf == "some updated tree_leaf"
      assert office.tree_level == 43
      assert office.tree_names == "some updated tree_names"
      assert office.tree_sort == 43
      assert office.tree_sorts == "some updated tree_sorts"
      assert office.updated_by == 43
      assert office.view_code == "some updated view_code"
      assert office.zip_code == "some updated zip_code"
    end

    test "update_office/2 with invalid data returns error changeset" do
      office = office_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_office(office, @invalid_attrs)
      assert office == Sys.get_office!(office.id)
    end

    test "delete_office/1 deletes the office" do
      office = office_fixture()
      assert {:ok, %Office{}} = Sys.delete_office(office)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_office!(office.id) end
    end

    test "change_office/1 returns a office changeset" do
      office = office_fixture()
      assert %Ecto.Changeset{} = Sys.change_office(office)
    end
  end

  describe "configs" do
    alias Hello.Sys.Config

    @valid_attrs %{config_key: "some config_key", config_name: "some config_name", config_type: "some config_type", config_value: "some config_value", inserted_by: "some inserted_by", remark: "some remark", status: 42, updated_by: "some updated_by"}
    @update_attrs %{config_key: "some updated config_key", config_name: "some updated config_name", config_type: "some updated config_type", config_value: "some updated config_value", inserted_by: "some updated inserted_by", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
    @invalid_attrs %{config_key: nil, config_name: nil, config_type: nil, config_value: nil, inserted_by: nil, remark: nil, status: nil, updated_by: nil}

    def config_fixture(attrs \\ %{}) do
      {:ok, config} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_config()

      config
    end

    test "list_configs/0 returns all configs" do
      config = config_fixture()
      assert Sys.list_configs() == [config]
    end

    test "get_config!/1 returns the config with given id" do
      config = config_fixture()
      assert Sys.get_config!(config.id) == config
    end

    test "create_config/1 with valid data creates a config" do
      assert {:ok, %Config{} = config} = Sys.create_config(@valid_attrs)
      assert config.config_key == "some config_key"
      assert config.config_name == "some config_name"
      assert config.config_type == "some config_type"
      assert config.config_value == "some config_value"
      assert config.inserted_by == "some inserted_by"
      assert config.remark == "some remark"
      assert config.status == 42
      assert config.updated_by == "some updated_by"
    end

    test "create_config/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_config(@invalid_attrs)
    end

    test "update_config/2 with valid data updates the config" do
      config = config_fixture()
      assert {:ok, %Config{} = config} = Sys.update_config(config, @update_attrs)
      assert config.config_key == "some updated config_key"
      assert config.config_name == "some updated config_name"
      assert config.config_type == "some updated config_type"
      assert config.config_value == "some updated config_value"
      assert config.inserted_by == "some updated inserted_by"
      assert config.remark == "some updated remark"
      assert config.status == 43
      assert config.updated_by == "some updated updated_by"
    end

    test "update_config/2 with invalid data returns error changeset" do
      config = config_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_config(config, @invalid_attrs)
      assert config == Sys.get_config!(config.id)
    end

    test "delete_config/1 deletes the config" do
      config = config_fixture()
      assert {:ok, %Config{}} = Sys.delete_config(config)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_config!(config.id) end
    end

    test "change_config/1 returns a config changeset" do
      config = config_fixture()
      assert %Ecto.Changeset{} = Sys.change_config(config)
    end
  end

  describe "dicttypes" do
    alias Hello.Sys.Dicttype

    @valid_attrs %{dict_name: "some dict_name", dict_type: "some dict_type", inserted_by: "some inserted_by", remark: "some remark", status: 42, updated_by: "some updated_by"}
    @update_attrs %{dict_name: "some updated dict_name", dict_type: "some updated dict_type", inserted_by: "some updated inserted_by", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
    @invalid_attrs %{dict_name: nil, dict_type: nil, inserted_by: nil, remark: nil, status: nil, updated_by: nil}

    def dicttype_fixture(attrs \\ %{}) do
      {:ok, dicttype} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_dicttype()

      dicttype
    end

    test "list_dicttypes/0 returns all dicttypes" do
      dicttype = dicttype_fixture()
      assert Sys.list_dicttypes() == [dicttype]
    end

    test "get_dicttype!/1 returns the dicttype with given id" do
      dicttype = dicttype_fixture()
      assert Sys.get_dicttype!(dicttype.id) == dicttype
    end

    test "create_dicttype/1 with valid data creates a dicttype" do
      assert {:ok, %Dicttype{} = dicttype} = Sys.create_dicttype(@valid_attrs)
      assert dicttype.dict_name == "some dict_name"
      assert dicttype.dict_type == "some dict_type"
      assert dicttype.inserted_by == "some inserted_by"
      assert dicttype.remark == "some remark"
      assert dicttype.status == 42
      assert dicttype.updated_by == "some updated_by"
    end

    test "create_dicttype/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_dicttype(@invalid_attrs)
    end

    test "update_dicttype/2 with valid data updates the dicttype" do
      dicttype = dicttype_fixture()
      assert {:ok, %Dicttype{} = dicttype} = Sys.update_dicttype(dicttype, @update_attrs)
      assert dicttype.dict_name == "some updated dict_name"
      assert dicttype.dict_type == "some updated dict_type"
      assert dicttype.inserted_by == "some updated inserted_by"
      assert dicttype.remark == "some updated remark"
      assert dicttype.status == 43
      assert dicttype.updated_by == "some updated updated_by"
    end

    test "update_dicttype/2 with invalid data returns error changeset" do
      dicttype = dicttype_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_dicttype(dicttype, @invalid_attrs)
      assert dicttype == Sys.get_dicttype!(dicttype.id)
    end

    test "delete_dicttype/1 deletes the dicttype" do
      dicttype = dicttype_fixture()
      assert {:ok, %Dicttype{}} = Sys.delete_dicttype(dicttype)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_dicttype!(dicttype.id) end
    end

    test "change_dicttype/1 returns a dicttype changeset" do
      dicttype = dicttype_fixture()
      assert %Ecto.Changeset{} = Sys.change_dicttype(dicttype)
    end
  end

  describe "dictdatas" do
    alias Hello.Sys.Dictdata

    @valid_attrs %{css_class: "some css_class", dict_label: "some dict_label", dict_sort: "some dict_sort", dict_type: "some dict_type", dict_value: "some dict_value", inserted_by: "some inserted_by", is_default: "some is_default", list_class: "some list_class", remark: "some remark", status: 42, updated_by: "some updated_by"}
    @update_attrs %{css_class: "some updated css_class", dict_label: "some updated dict_label", dict_sort: "some updated dict_sort", dict_type: "some updated dict_type", dict_value: "some updated dict_value", inserted_by: "some updated inserted_by", is_default: "some updated is_default", list_class: "some updated list_class", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
    @invalid_attrs %{css_class: nil, dict_label: nil, dict_sort: nil, dict_type: nil, dict_value: nil, inserted_by: nil, is_default: nil, list_class: nil, remark: nil, status: nil, updated_by: nil}

    def dictdata_fixture(attrs \\ %{}) do
      {:ok, dictdata} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_dictdata()

      dictdata
    end

    test "list_dictdatas/0 returns all dictdatas" do
      dictdata = dictdata_fixture()
      assert Sys.list_dictdatas() == [dictdata]
    end

    test "get_dictdata!/1 returns the dictdata with given id" do
      dictdata = dictdata_fixture()
      assert Sys.get_dictdata!(dictdata.id) == dictdata
    end

    test "create_dictdata/1 with valid data creates a dictdata" do
      assert {:ok, %Dictdata{} = dictdata} = Sys.create_dictdata(@valid_attrs)
      assert dictdata.css_class == "some css_class"
      assert dictdata.dict_label == "some dict_label"
      assert dictdata.dict_sort == "some dict_sort"
      assert dictdata.dict_type == "some dict_type"
      assert dictdata.dict_value == "some dict_value"
      assert dictdata.inserted_by == "some inserted_by"
      assert dictdata.is_default == "some is_default"
      assert dictdata.list_class == "some list_class"
      assert dictdata.remark == "some remark"
      assert dictdata.status == 42
      assert dictdata.updated_by == "some updated_by"
    end

    test "create_dictdata/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_dictdata(@invalid_attrs)
    end

    test "update_dictdata/2 with valid data updates the dictdata" do
      dictdata = dictdata_fixture()
      assert {:ok, %Dictdata{} = dictdata} = Sys.update_dictdata(dictdata, @update_attrs)
      assert dictdata.css_class == "some updated css_class"
      assert dictdata.dict_label == "some updated dict_label"
      assert dictdata.dict_sort == "some updated dict_sort"
      assert dictdata.dict_type == "some updated dict_type"
      assert dictdata.dict_value == "some updated dict_value"
      assert dictdata.inserted_by == "some updated inserted_by"
      assert dictdata.is_default == "some updated is_default"
      assert dictdata.list_class == "some updated list_class"
      assert dictdata.remark == "some updated remark"
      assert dictdata.status == 43
      assert dictdata.updated_by == "some updated updated_by"
    end

    test "update_dictdata/2 with invalid data returns error changeset" do
      dictdata = dictdata_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_dictdata(dictdata, @invalid_attrs)
      assert dictdata == Sys.get_dictdata!(dictdata.id)
    end

    test "delete_dictdata/1 deletes the dictdata" do
      dictdata = dictdata_fixture()
      assert {:ok, %Dictdata{}} = Sys.delete_dictdata(dictdata)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_dictdata!(dictdata.id) end
    end

    test "change_dictdata/1 returns a dictdata changeset" do
      dictdata = dictdata_fixture()
      assert %Ecto.Changeset{} = Sys.change_dictdata(dictdata)
    end
  end

  describe "modules" do
    alias Hello.Sys.Module

    @valid_attrs %{code: "some code", current_version: "some current_version", description: "some description", inserted_by: "some inserted_by", main_class_name: "some main_class_name", name: 42, remark: "some remark", status: 42, updated_by: "some updated_by", upgrade_info: "some upgrade_info"}
    @update_attrs %{code: "some updated code", current_version: "some updated current_version", description: "some updated description", inserted_by: "some updated inserted_by", main_class_name: "some updated main_class_name", name: 43, remark: "some updated remark", status: 43, updated_by: "some updated updated_by", upgrade_info: "some updated upgrade_info"}
    @invalid_attrs %{code: nil, current_version: nil, description: nil, inserted_by: nil, main_class_name: nil, name: nil, remark: nil, status: nil, updated_by: nil, upgrade_info: nil}

    def module_fixture(attrs \\ %{}) do
      {:ok, module} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_module()

      module
    end

    test "list_modules/0 returns all modules" do
      module = module_fixture()
      assert Sys.list_modules() == [module]
    end

    test "get_module!/1 returns the module with given id" do
      module = module_fixture()
      assert Sys.get_module!(module.id) == module
    end

    test "create_module/1 with valid data creates a module" do
      assert {:ok, %Module{} = module} = Sys.create_module(@valid_attrs)
      assert module.code == "some code"
      assert module.current_version == "some current_version"
      assert module.description == "some description"
      assert module.inserted_by == "some inserted_by"
      assert module.main_class_name == "some main_class_name"
      assert module.name == 42
      assert module.remark == "some remark"
      assert module.status == 42
      assert module.updated_by == "some updated_by"
      assert module.upgrade_info == "some upgrade_info"
    end

    test "create_module/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_module(@invalid_attrs)
    end

    test "update_module/2 with valid data updates the module" do
      module = module_fixture()
      assert {:ok, %Module{} = module} = Sys.update_module(module, @update_attrs)
      assert module.code == "some updated code"
      assert module.current_version == "some updated current_version"
      assert module.description == "some updated description"
      assert module.inserted_by == "some updated inserted_by"
      assert module.main_class_name == "some updated main_class_name"
      assert module.name == 43
      assert module.remark == "some updated remark"
      assert module.status == 43
      assert module.updated_by == "some updated updated_by"
      assert module.upgrade_info == "some updated upgrade_info"
    end

    test "update_module/2 with invalid data returns error changeset" do
      module = module_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_module(module, @invalid_attrs)
      assert module == Sys.get_module!(module.id)
    end

    test "delete_module/1 deletes the module" do
      module = module_fixture()
      assert {:ok, %Module{}} = Sys.delete_module(module)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_module!(module.id) end
    end

    test "change_module/1 returns a module changeset" do
      module = module_fixture()
      assert %Ecto.Changeset{} = Sys.change_module(module)
    end
  end

  describe "menus" do
    alias Hello.Sys.Menu

    @valid_attrs %{icon: "some icon", inserted_by: "some inserted_by", menu_name: "some menu_name", menu_type: "some menu_type", order_num: 42, parent_id: "some parent_id", perms: "some perms", remark: "some remark", status: 42, target: "some target", updated_by: "some updated_by", url: "some url", visible: "some visible"}
    @update_attrs %{icon: "some updated icon", inserted_by: "some updated inserted_by", menu_name: "some updated menu_name", menu_type: "some updated menu_type", order_num: 43, parent_id: "some updated parent_id", perms: "some updated perms", remark: "some updated remark", status: 43, target: "some updated target", updated_by: "some updated updated_by", url: "some updated url", visible: "some updated visible"}
    @invalid_attrs %{icon: nil, inserted_by: nil, menu_name: nil, menu_type: nil, order_num: nil, parent_id: nil, perms: nil, remark: nil, status: nil, target: nil, updated_by: nil, url: nil, visible: nil}

    def menu_fixture(attrs \\ %{}) do
      {:ok, menu} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_menu()

      menu
    end

    test "list_menus/0 returns all menus" do
      menu = menu_fixture()
      assert Sys.list_menus() == [menu]
    end

    test "get_menu!/1 returns the menu with given id" do
      menu = menu_fixture()
      assert Sys.get_menu!(menu.id) == menu
    end

    test "create_menu/1 with valid data creates a menu" do
      assert {:ok, %Menu{} = menu} = Sys.create_menu(@valid_attrs)
      assert menu.icon == "some icon"
      assert menu.inserted_by == "some inserted_by"
      assert menu.menu_name == "some menu_name"
      assert menu.menu_type == "some menu_type"
      assert menu.order_num == 42
      assert menu.parent_id == "some parent_id"
      assert menu.perms == "some perms"
      assert menu.remark == "some remark"
      assert menu.status == 42
      assert menu.target == "some target"
      assert menu.updated_by == "some updated_by"
      assert menu.url == "some url"
      assert menu.visible == "some visible"
    end

    test "create_menu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_menu(@invalid_attrs)
    end

    test "update_menu/2 with valid data updates the menu" do
      menu = menu_fixture()
      assert {:ok, %Menu{} = menu} = Sys.update_menu(menu, @update_attrs)
      assert menu.icon == "some updated icon"
      assert menu.inserted_by == "some updated inserted_by"
      assert menu.menu_name == "some updated menu_name"
      assert menu.menu_type == "some updated menu_type"
      assert menu.order_num == 43
      assert menu.parent_id == "some updated parent_id"
      assert menu.perms == "some updated perms"
      assert menu.remark == "some updated remark"
      assert menu.status == 43
      assert menu.target == "some updated target"
      assert menu.updated_by == "some updated updated_by"
      assert menu.url == "some updated url"
      assert menu.visible == "some updated visible"
    end

    test "update_menu/2 with invalid data returns error changeset" do
      menu = menu_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_menu(menu, @invalid_attrs)
      assert menu == Sys.get_menu!(menu.id)
    end

    test "delete_menu/1 deletes the menu" do
      menu = menu_fixture()
      assert {:ok, %Menu{}} = Sys.delete_menu(menu)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_menu!(menu.id) end
    end

    test "change_menu/1 returns a menu changeset" do
      menu = menu_fixture()
      assert %Ecto.Changeset{} = Sys.change_menu(menu)
    end
  end

  describe "depts" do
    alias Hello.Sys.Dept

    @valid_attrs %{ancestors: "some ancestors", dept_name: "some dept_name", email: "some email", inserted_by: "some inserted_by", leader: "some leader", order_num: 42, parent_id: "some parent_id", phone: "some phone", remark: "some remark", status: 42, target: "some target", updated_by: "some updated_by"}
    @update_attrs %{ancestors: "some updated ancestors", dept_name: "some updated dept_name", email: "some updated email", inserted_by: "some updated inserted_by", leader: "some updated leader", order_num: 43, parent_id: "some updated parent_id", phone: "some updated phone", remark: "some updated remark", status: 43, target: "some updated target", updated_by: "some updated updated_by"}
    @invalid_attrs %{ancestors: nil, dept_name: nil, email: nil, inserted_by: nil, leader: nil, order_num: nil, parent_id: nil, phone: nil, remark: nil, status: nil, target: nil, updated_by: nil}

    def dept_fixture(attrs \\ %{}) do
      {:ok, dept} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_dept()

      dept
    end

    test "list_depts/0 returns all depts" do
      dept = dept_fixture()
      assert Sys.list_depts() == [dept]
    end

    test "get_dept!/1 returns the dept with given id" do
      dept = dept_fixture()
      assert Sys.get_dept!(dept.id) == dept
    end

    test "create_dept/1 with valid data creates a dept" do
      assert {:ok, %Dept{} = dept} = Sys.create_dept(@valid_attrs)
      assert dept.ancestors == "some ancestors"
      assert dept.dept_name == "some dept_name"
      assert dept.email == "some email"
      assert dept.inserted_by == "some inserted_by"
      assert dept.leader == "some leader"
      assert dept.order_num == 42
      assert dept.parent_id == "some parent_id"
      assert dept.phone == "some phone"
      assert dept.remark == "some remark"
      assert dept.status == 42
      assert dept.target == "some target"
      assert dept.updated_by == "some updated_by"
    end

    test "create_dept/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_dept(@invalid_attrs)
    end

    test "update_dept/2 with valid data updates the dept" do
      dept = dept_fixture()
      assert {:ok, %Dept{} = dept} = Sys.update_dept(dept, @update_attrs)
      assert dept.ancestors == "some updated ancestors"
      assert dept.dept_name == "some updated dept_name"
      assert dept.email == "some updated email"
      assert dept.inserted_by == "some updated inserted_by"
      assert dept.leader == "some updated leader"
      assert dept.order_num == 43
      assert dept.parent_id == "some updated parent_id"
      assert dept.phone == "some updated phone"
      assert dept.remark == "some updated remark"
      assert dept.status == 43
      assert dept.target == "some updated target"
      assert dept.updated_by == "some updated updated_by"
    end

    test "update_dept/2 with invalid data returns error changeset" do
      dept = dept_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_dept(dept, @invalid_attrs)
      assert dept == Sys.get_dept!(dept.id)
    end

    test "delete_dept/1 deletes the dept" do
      dept = dept_fixture()
      assert {:ok, %Dept{}} = Sys.delete_dept(dept)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_dept!(dept.id) end
    end

    test "change_dept/1 returns a dept changeset" do
      dept = dept_fixture()
      assert %Ecto.Changeset{} = Sys.change_dept(dept)
    end
  end

  describe "depts" do
    alias Hello.Sys.Dept

    @valid_attrs %{ancestors: "some ancestors", dept_name: "some dept_name", email: "some email", inserted_by: "some inserted_by", leader: "some leader", order_num: 42, parent_id: "some parent_id", phone: "some phone", remark: "some remark", status: 42, updated_by: "some updated_by"}
    @update_attrs %{ancestors: "some updated ancestors", dept_name: "some updated dept_name", email: "some updated email", inserted_by: "some updated inserted_by", leader: "some updated leader", order_num: 43, parent_id: "some updated parent_id", phone: "some updated phone", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
    @invalid_attrs %{ancestors: nil, dept_name: nil, email: nil, inserted_by: nil, leader: nil, order_num: nil, parent_id: nil, phone: nil, remark: nil, status: nil, updated_by: nil}

    def dept_fixture(attrs \\ %{}) do
      {:ok, dept} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_dept()

      dept
    end

    test "list_depts/0 returns all depts" do
      dept = dept_fixture()
      assert Sys.list_depts() == [dept]
    end

    test "get_dept!/1 returns the dept with given id" do
      dept = dept_fixture()
      assert Sys.get_dept!(dept.id) == dept
    end

    test "create_dept/1 with valid data creates a dept" do
      assert {:ok, %Dept{} = dept} = Sys.create_dept(@valid_attrs)
      assert dept.ancestors == "some ancestors"
      assert dept.dept_name == "some dept_name"
      assert dept.email == "some email"
      assert dept.inserted_by == "some inserted_by"
      assert dept.leader == "some leader"
      assert dept.order_num == 42
      assert dept.parent_id == "some parent_id"
      assert dept.phone == "some phone"
      assert dept.remark == "some remark"
      assert dept.status == 42
      assert dept.updated_by == "some updated_by"
    end

    test "create_dept/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_dept(@invalid_attrs)
    end

    test "update_dept/2 with valid data updates the dept" do
      dept = dept_fixture()
      assert {:ok, %Dept{} = dept} = Sys.update_dept(dept, @update_attrs)
      assert dept.ancestors == "some updated ancestors"
      assert dept.dept_name == "some updated dept_name"
      assert dept.email == "some updated email"
      assert dept.inserted_by == "some updated inserted_by"
      assert dept.leader == "some updated leader"
      assert dept.order_num == 43
      assert dept.parent_id == "some updated parent_id"
      assert dept.phone == "some updated phone"
      assert dept.remark == "some updated remark"
      assert dept.status == 43
      assert dept.updated_by == "some updated updated_by"
    end

    test "update_dept/2 with invalid data returns error changeset" do
      dept = dept_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_dept(dept, @invalid_attrs)
      assert dept == Sys.get_dept!(dept.id)
    end

    test "delete_dept/1 deletes the dept" do
      dept = dept_fixture()
      assert {:ok, %Dept{}} = Sys.delete_dept(dept)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_dept!(dept.id) end
    end

    test "change_dept/1 returns a dept changeset" do
      dept = dept_fixture()
      assert %Ecto.Changeset{} = Sys.change_dept(dept)
    end
  end

  describe "posts" do
    alias Hello.Sys.Post

    @valid_attrs %{data_scope: "some data_scope", inserted_by: "some inserted_by", post_code: "some post_code", post_name: "some post_name", post_sort: 42, remark: "some remark", status: 42, updated_by: "some updated_by"}
    @update_attrs %{data_scope: "some updated data_scope", inserted_by: "some updated inserted_by", post_code: "some updated post_code", post_name: "some updated post_name", post_sort: 43, remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
    @invalid_attrs %{data_scope: nil, inserted_by: nil, post_code: nil, post_name: nil, post_sort: nil, remark: nil, status: nil, updated_by: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Sys.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Sys.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Sys.create_post(@valid_attrs)
      assert post.data_scope == "some data_scope"
      assert post.inserted_by == "some inserted_by"
      assert post.post_code == "some post_code"
      assert post.post_name == "some post_name"
      assert post.post_sort == 42
      assert post.remark == "some remark"
      assert post.status == 42
      assert post.updated_by == "some updated_by"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Sys.update_post(post, @update_attrs)
      assert post.data_scope == "some updated data_scope"
      assert post.inserted_by == "some updated inserted_by"
      assert post.post_code == "some updated post_code"
      assert post.post_name == "some updated post_name"
      assert post.post_sort == 43
      assert post.remark == "some updated remark"
      assert post.status == 43
      assert post.updated_by == "some updated updated_by"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_post(post, @invalid_attrs)
      assert post == Sys.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Sys.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Sys.change_post(post)
    end
  end

  describe "users" do
    alias Hello.Sys.User

    @valid_attrs %{avatar: "some avatar", email: "some email", inserted_by: "some inserted_by", login_date: "2010-04-17T14:00:00Z", login_ip: "some login_ip", login_name: "some login_name", password: "some password", phone: "some phone", remark: "some remark", salt: "some salt", sex: "some sex", status: 42, title: "some title", updated_by: "some updated_by", user_code: "some user_code", user_name: "some user_name", user_type: "some user_type"}
    @update_attrs %{avatar: "some updated avatar", email: "some updated email", inserted_by: "some updated inserted_by", login_date: "2011-05-18T15:01:01Z", login_ip: "some updated login_ip", login_name: "some updated login_name", password: "some updated password", phone: "some updated phone", remark: "some updated remark", salt: "some updated salt", sex: "some updated sex", status: 43, title: "some updated title", updated_by: "some updated updated_by", user_code: "some updated user_code", user_name: "some updated user_name", user_type: "some updated user_type"}
    @invalid_attrs %{avatar: nil, email: nil, inserted_by: nil, login_date: nil, login_ip: nil, login_name: nil, password: nil, phone: nil, remark: nil, salt: nil, sex: nil, status: nil, title: nil, updated_by: nil, user_code: nil, user_name: nil, user_type: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Sys.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Sys.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Sys.create_user(@valid_attrs)
      assert user.avatar == "some avatar"
      assert user.email == "some email"
      assert user.inserted_by == "some inserted_by"
      assert user.login_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert user.login_ip == "some login_ip"
      assert user.login_name == "some login_name"
      assert user.password == "some password"
      assert user.phone == "some phone"
      assert user.remark == "some remark"
      assert user.salt == "some salt"
      assert user.sex == "some sex"
      assert user.status == 42
      assert user.title == "some title"
      assert user.updated_by == "some updated_by"
      assert user.user_code == "some user_code"
      assert user.user_name == "some user_name"
      assert user.user_type == "some user_type"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Sys.update_user(user, @update_attrs)
      assert user.avatar == "some updated avatar"
      assert user.email == "some updated email"
      assert user.inserted_by == "some updated inserted_by"
      assert user.login_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert user.login_ip == "some updated login_ip"
      assert user.login_name == "some updated login_name"
      assert user.password == "some updated password"
      assert user.phone == "some updated phone"
      assert user.remark == "some updated remark"
      assert user.salt == "some updated salt"
      assert user.sex == "some updated sex"
      assert user.status == 43
      assert user.title == "some updated title"
      assert user.updated_by == "some updated updated_by"
      assert user.user_code == "some updated user_code"
      assert user.user_name == "some updated user_name"
      assert user.user_type == "some updated user_type"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_user(user, @invalid_attrs)
      assert user == Sys.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Sys.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Sys.change_user(user)
    end
  end

  describe "roles" do
    alias Hello.Sys.Role

    @valid_attrs %{role_code: "some role_code", role_name: "some role_name", role_sort: 42}
    @update_attrs %{role_code: "some updated role_code", role_name: "some updated role_name", role_sort: 43}
    @invalid_attrs %{role_code: nil, role_name: nil, role_sort: nil}

    def role_fixture(attrs \\ %{}) do
      {:ok, role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_role()

      role
    end

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Sys.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Sys.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      assert {:ok, %Role{} = role} = Sys.create_role(@valid_attrs)
      assert role.role_code == "some role_code"
      assert role.role_name == "some role_name"
      assert role.role_sort == 42
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      assert {:ok, %Role{} = role} = Sys.update_role(role, @update_attrs)
      assert role.role_code == "some updated role_code"
      assert role.role_name == "some updated role_name"
      assert role.role_sort == 43
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_role(role, @invalid_attrs)
      assert role == Sys.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Sys.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Sys.change_role(role)
    end
  end

  describe "areas" do
    alias Hello.Sys.Area

    @valid_attrs %{ancestors: "some ancestors", code: "some code", name: "some name", type: "some type"}
    @update_attrs %{ancestors: "some updated ancestors", code: "some updated code", name: "some updated name", type: "some updated type"}
    @invalid_attrs %{ancestors: nil, code: nil, name: nil, type: nil}

    def area_fixture(attrs \\ %{}) do
      {:ok, area} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_area()

      area
    end

    test "list_areas/0 returns all areas" do
      area = area_fixture()
      assert Sys.list_areas() == [area]
    end

    test "get_area!/1 returns the area with given id" do
      area = area_fixture()
      assert Sys.get_area!(area.id) == area
    end

    test "create_area/1 with valid data creates a area" do
      assert {:ok, %Area{} = area} = Sys.create_area(@valid_attrs)
      assert area.ancestors == "some ancestors"
      assert area.code == "some code"
      assert area.name == "some name"
      assert area.type == "some type"
    end

    test "create_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_area(@invalid_attrs)
    end

    test "update_area/2 with valid data updates the area" do
      area = area_fixture()
      assert {:ok, %Area{} = area} = Sys.update_area(area, @update_attrs)
      assert area.ancestors == "some updated ancestors"
      assert area.code == "some updated code"
      assert area.name == "some updated name"
      assert area.type == "some updated type"
    end

    test "update_area/2 with invalid data returns error changeset" do
      area = area_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_area(area, @invalid_attrs)
      assert area == Sys.get_area!(area.id)
    end

    test "delete_area/1 deletes the area" do
      area = area_fixture()
      assert {:ok, %Area{}} = Sys.delete_area(area)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_area!(area.id) end
    end

    test "change_area/1 returns a area changeset" do
      area = area_fixture()
      assert %Ecto.Changeset{} = Sys.change_area(area)
    end
  end

  describe "companys" do
    alias Hello.Sys.Company

    @valid_attrs %{ancestors: "some ancestors", area_id: 42, code: "some code", corp_code: "some corp_code", corp_name: "some corp_name", name: "some name", order_num: 42, parent_id: 42, short_name: "some short_name"}
    @update_attrs %{ancestors: "some updated ancestors", area_id: 43, code: "some updated code", corp_code: "some updated corp_code", corp_name: "some updated corp_name", name: "some updated name", order_num: 43, parent_id: 43, short_name: "some updated short_name"}
    @invalid_attrs %{ancestors: nil, area_id: nil, code: nil, corp_code: nil, corp_name: nil, name: nil, order_num: nil, parent_id: nil, short_name: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sys.create_company()

      company
    end

    test "list_companys/0 returns all companys" do
      company = company_fixture()
      assert Sys.list_companys() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Sys.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Sys.create_company(@valid_attrs)
      assert company.ancestors == "some ancestors"
      assert company.area_id == 42
      assert company.code == "some code"
      assert company.corp_code == "some corp_code"
      assert company.corp_name == "some corp_name"
      assert company.name == "some name"
      assert company.order_num == 42
      assert company.parent_id == 42
      assert company.short_name == "some short_name"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sys.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, %Company{} = company} = Sys.update_company(company, @update_attrs)
      assert company.ancestors == "some updated ancestors"
      assert company.area_id == 43
      assert company.code == "some updated code"
      assert company.corp_code == "some updated corp_code"
      assert company.corp_name == "some updated corp_name"
      assert company.name == "some updated name"
      assert company.order_num == 43
      assert company.parent_id == 43
      assert company.short_name == "some updated short_name"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Sys.update_company(company, @invalid_attrs)
      assert company == Sys.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Sys.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Sys.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Sys.change_company(company)
    end
  end
end
