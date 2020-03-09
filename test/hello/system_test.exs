defmodule Hello.SystemTest do
  use Hello.DataCase

  alias Hello.System

  describe "configs" do
    alias Hello.System.Config

    @valid_attrs %{config_key: "some config_key", config_name: "some config_name", config_type: "some config_type", config_value: "some config_value", create_by: "some create_by", created_at: ~N[2010-04-17 14:00:00], id: 42, remark: "some remark", update_by: "some update_by", updated_at: ~N[2010-04-17 14:00:00]}
    @update_attrs %{config_key: "some updated config_key", config_name: "some updated config_name", config_type: "some updated config_type", config_value: "some updated config_value", create_by: "some updated create_by", created_at: ~N[2011-05-18 15:01:01], id: 43, remark: "some updated remark", update_by: "some updated update_by", updated_at: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{config_key: nil, config_name: nil, config_type: nil, config_value: nil, create_by: nil, created_at: nil, id: nil, remark: nil, update_by: nil, updated_at: nil}

    def config_fixture(attrs \\ %{}) do
      {:ok, config} =
        attrs
        |> Enum.into(@valid_attrs)
        |> System.create_config()

      config
    end

    test "list_configs/0 returns all configs" do
      config = config_fixture()
      assert System.list_configs() == [config]
    end

    test "get_config!/1 returns the config with given id" do
      config = config_fixture()
      assert System.get_config!(config.id) == config
    end

    test "create_config/1 with valid data creates a config" do
      assert {:ok, %Config{} = config} = System.create_config(@valid_attrs)
      assert config.config_key == "some config_key"
      assert config.config_name == "some config_name"
      assert config.config_type == "some config_type"
      assert config.config_value == "some config_value"
      assert config.create_by == "some create_by"
      assert config.created_at == ~N[2010-04-17 14:00:00]
      assert config.id == 42
      assert config.remark == "some remark"
      assert config.update_by == "some update_by"
      assert config.updated_at == ~N[2010-04-17 14:00:00]
    end

    test "create_config/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = System.create_config(@invalid_attrs)
    end

    test "update_config/2 with valid data updates the config" do
      config = config_fixture()
      assert {:ok, %Config{} = config} = System.update_config(config, @update_attrs)
      assert config.config_key == "some updated config_key"
      assert config.config_name == "some updated config_name"
      assert config.config_type == "some updated config_type"
      assert config.config_value == "some updated config_value"
      assert config.create_by == "some updated create_by"
      assert config.created_at == ~N[2011-05-18 15:01:01]
      assert config.id == 43
      assert config.remark == "some updated remark"
      assert config.update_by == "some updated update_by"
      assert config.updated_at == ~N[2011-05-18 15:01:01]
    end

    test "update_config/2 with invalid data returns error changeset" do
      config = config_fixture()
      assert {:error, %Ecto.Changeset{}} = System.update_config(config, @invalid_attrs)
      assert config == System.get_config!(config.id)
    end

    test "delete_config/1 deletes the config" do
      config = config_fixture()
      assert {:ok, %Config{}} = System.delete_config(config)
      assert_raise Ecto.NoResultsError, fn -> System.get_config!(config.id) end
    end

    test "change_config/1 returns a config changeset" do
      config = config_fixture()
      assert %Ecto.Changeset{} = System.change_config(config)
    end
  end

  describe "configs" do
    alias Hello.System.Config

    @valid_attrs %{config_key: "some config_key", config_name: "some config_name", config_type: "some config_type", config_value: "some config_value", id: 42, inserted_by: "some inserted_by", remark: "some remark", status: 42, updated_by: "some updated_by"}
    @update_attrs %{config_key: "some updated config_key", config_name: "some updated config_name", config_type: "some updated config_type", config_value: "some updated config_value", id: 43, inserted_by: "some updated inserted_by", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
    @invalid_attrs %{config_key: nil, config_name: nil, config_type: nil, config_value: nil, id: nil, inserted_by: nil, remark: nil, status: nil, updated_by: nil}

    def config_fixture(attrs \\ %{}) do
      {:ok, config} =
        attrs
        |> Enum.into(@valid_attrs)
        |> System.create_config()

      config
    end

    test "list_configs/0 returns all configs" do
      config = config_fixture()
      assert System.list_configs() == [config]
    end

    test "get_config!/1 returns the config with given id" do
      config = config_fixture()
      assert System.get_config!(config.id) == config
    end

    test "create_config/1 with valid data creates a config" do
      assert {:ok, %Config{} = config} = System.create_config(@valid_attrs)
      assert config.config_key == "some config_key"
      assert config.config_name == "some config_name"
      assert config.config_type == "some config_type"
      assert config.config_value == "some config_value"
      assert config.id == 42
      assert config.inserted_by == "some inserted_by"
      assert config.remark == "some remark"
      assert config.status == 42
      assert config.updated_by == "some updated_by"
    end

    test "create_config/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = System.create_config(@invalid_attrs)
    end

    test "update_config/2 with valid data updates the config" do
      config = config_fixture()
      assert {:ok, %Config{} = config} = System.update_config(config, @update_attrs)
      assert config.config_key == "some updated config_key"
      assert config.config_name == "some updated config_name"
      assert config.config_type == "some updated config_type"
      assert config.config_value == "some updated config_value"
      assert config.id == 43
      assert config.inserted_by == "some updated inserted_by"
      assert config.remark == "some updated remark"
      assert config.status == 43
      assert config.updated_by == "some updated updated_by"
    end

    test "update_config/2 with invalid data returns error changeset" do
      config = config_fixture()
      assert {:error, %Ecto.Changeset{}} = System.update_config(config, @invalid_attrs)
      assert config == System.get_config!(config.id)
    end

    test "delete_config/1 deletes the config" do
      config = config_fixture()
      assert {:ok, %Config{}} = System.delete_config(config)
      assert_raise Ecto.NoResultsError, fn -> System.get_config!(config.id) end
    end

    test "change_config/1 returns a config changeset" do
      config = config_fixture()
      assert %Ecto.Changeset{} = System.change_config(config)
    end
  end

  describe "configs" do
    alias Hello.System.Config

    @valid_attrs %{config_key: "some config_key", config_name: "some config_name", config_type: "some config_type", config_value: "some config_value", inserted_by: "some inserted_by", remark: "some remark", status: 42, updated_by: "some updated_by"}
    @update_attrs %{config_key: "some updated config_key", config_name: "some updated config_name", config_type: "some updated config_type", config_value: "some updated config_value", inserted_by: "some updated inserted_by", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
    @invalid_attrs %{config_key: nil, config_name: nil, config_type: nil, config_value: nil, inserted_by: nil, remark: nil, status: nil, updated_by: nil}

    def config_fixture(attrs \\ %{}) do
      {:ok, config} =
        attrs
        |> Enum.into(@valid_attrs)
        |> System.create_config()

      config
    end

    test "list_configs/0 returns all configs" do
      config = config_fixture()
      assert System.list_configs() == [config]
    end

    test "get_config!/1 returns the config with given id" do
      config = config_fixture()
      assert System.get_config!(config.id) == config
    end

    test "create_config/1 with valid data creates a config" do
      assert {:ok, %Config{} = config} = System.create_config(@valid_attrs)
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
      assert {:error, %Ecto.Changeset{}} = System.create_config(@invalid_attrs)
    end

    test "update_config/2 with valid data updates the config" do
      config = config_fixture()
      assert {:ok, %Config{} = config} = System.update_config(config, @update_attrs)
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
      assert {:error, %Ecto.Changeset{}} = System.update_config(config, @invalid_attrs)
      assert config == System.get_config!(config.id)
    end

    test "delete_config/1 deletes the config" do
      config = config_fixture()
      assert {:ok, %Config{}} = System.delete_config(config)
      assert_raise Ecto.NoResultsError, fn -> System.get_config!(config.id) end
    end

    test "change_config/1 returns a config changeset" do
      config = config_fixture()
      assert %Ecto.Changeset{} = System.change_config(config)
    end
  end
end
