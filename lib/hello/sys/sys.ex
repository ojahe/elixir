defmodule Hello.Sys do
  @moduledoc false
  import Ecto.Query, warn: false
  require Ecto.Repo
  alias Hello.Repo

  alias Hello.Sys.User
  alias Hello.Sys.Account
  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]
  AND (u.dept_id =  OR u.dept_id IN (
  	 SELECT t.dept_id FROM sys_dept t WHERE FIND_IN_SET (,ancestors)
  	  )
  	  )
  """
  def list_users (params)do
    conditions = true
    conditions =
      if params["user_name"] && params["user_name"]!="" do
        dynamic([q],  like(q.user_name, ^("%" <> params["user_name"]<> "%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["phone"] && params["phone"]!="" do
        dynamic([q], q.phone == ^(params["phone"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status == ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end

    conditions =
      if params["deptId"]  && params["deptId"]!="" do
        dynamic([s],fragment(" dept_id = ?  or dept_id IN ( select t.id from  sys_dept t where  FIND_IN_SET ( ?,t.ancestors))",^(params["deptId"]),^(params["deptId"]))  and ^conditions)

      else
        conditions
      end

    params = Map.put(params, "page", String.to_integer(params["pageNum"]))
    params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    User
    |> where([p],^conditions)
    |> order_by(^(Utils.get_order_by(params["orderByColumn"],params["isAsc"])))
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |> preload(:dept)
    |> preload(:roles)
    |> preload(:posts)
    |>  Repo.paginate(params)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    Repo.get!(User, id)
    |>  Repo.preload(:dept)
    |>  Repo.preload(:inserted_by)
    |>  Repo.preload(:updated_by)
    |>  Repo.preload(:roles)
    |>  Repo.preload(:posts)
    |>  Repo.preload(:account)
   end
  def get_user2!(id) do
    Repo.get!(User, id)
#    |>  Repo.preload(:dept)
#    |>  Repo.preload(:inserted_by)
#    |>  Repo.preload(:updated_by)
#    |>  Repo.preload(:roles)
#    |>  Repo.preload(:posts)
  end
  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(user_id,attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Ecto.Changeset.put_assoc(:roles, list_role(attrs["roles"]))
    |> Ecto.Changeset.put_assoc(:posts, list_role(attrs["posts"]))
    |> Ecto.Changeset.cast_assoc(:account, with: &Account.changeset/2)
    |> Repo.insert()
  end
  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(user_id,%User{} = user, attrs) do
    user
    #|> Repo.preload(:roles) # Load existing data
    |> User.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Ecto.Changeset.put_assoc(:roles, list_role(attrs["roles"]))
    |> Ecto.Changeset.put_assoc(:posts, list_post(attrs["posts"]))
    |> Ecto.Changeset.cast_assoc(:account, with: &Account.changeset/2)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def delete_user(ids) do
    from( p in User, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
  def change_user_new(%User{} = user) do
    user
    |> Repo.preload(:roles)
    |> Repo.preload(:posts)
    |>User.changeset( %{})
    |> Ecto.Changeset.put_assoc(:roles, [])
    |> Ecto.Changeset.put_assoc(:posts, [])
  end
  alias Hello.Sys.Module

  @doc """
  Returns the list of modules.

  ## Examples

      iex> list_modules()
      [%Module{}, ...]

  """
  def list_modules (params)do
    conditions = true
    conditions =
      if params["name"] && params["name"]!="" do
        dynamic([q],  like(q.name, ^("%#{params["name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    params = Map.put(params, "page", String.to_integer(params["pageNum"]))
    params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    Module
    |> where([p],^conditions)
    |> order_by(^(Utils.get_order_by(params["orderByColumn"],params["isAsc"])))
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |> Repo.paginate(params)
  end

  @doc """
  Gets a single module.

  Raises `Ecto.NoResultsError` if the Module does not exist.

  ## Examples

      iex> get_module!(123)
      %Module{}

      iex> get_module!(456)
      ** (Ecto.NoResultsError)

  """
  def get_module!(id) do
     Module
     |>Repo.get!( id)
     |> Repo.preload(:inserted_by)
     |> Repo.preload(:updated_by)
  end
  @doc """
  Creates a module.

  ## Examples

      iex> create_module(%{field: value})
      {:ok, %Module{}}

      iex> create_module(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_module(user_id,attrs \\ %{}) do
    %Module{}
    |> Module.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a module.

  ## Examples

      iex> update_module(module, %{field: new_value})
      {:ok, %Module{}}

      iex> update_module(module, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_module(user_id,%Module{} = module, attrs) do
    module
    |> Module.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.update()
  end

  @doc """
  Deletes a Module.

  ## Examples

      iex> delete_module(module)
      {:ok, %Module{}}

      iex> delete_module(module)
      {:error, %Ecto.Changeset{}}

  """
  def delete_module(%Module{} = module) do
    Repo.delete(module)
  end

  def delete_module(ids) do
    from( p in Module, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking module changes.

  ## Examples

      iex> change_module(module)
      %Ecto.Changeset{source: %Module{}}

  """
  def change_module(%Module{} = module) do
    Module.changeset(module, %{})
  end

  alias Hello.Sys.Config

  @doc """
  Returns the list of configs.

  ## Examples

      iex> list_configs()
      [%Config{}, ...]

  """
  def list_configs (params)do
    conditions = true
    conditions =
      if params["config_name"] && params["config_name"]!="" do
        dynamic([q],  like(q.config_name, ^("%#{params["config_name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["config_key"] && params["config_key"]!="" do
        dynamic([q], q.config_key == ^(params["config_key"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["config_type"] && params["config_type"]!="" do
        dynamic([q], q.config_type == ^(params["config_type"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end

    params = Map.put(params, "page", String.to_integer(params["pageNum"]))
    params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    Config
    |> where([p],^conditions)
    |> order_by(^(Utils.get_order_by(params["orderByColumn"],params["isAsc"])))
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |>  Repo.paginate(params)
  end

  @doc """
  Gets a single config.

  Raises `Ecto.NoResultsError` if the Config does not exist.

  ## Examples

      iex> get_config!(123)
      %Config{}

      iex> get_config!(456)
      ** (Ecto.NoResultsError)

  """
  def get_config!(id), do: Repo.get!(Config, id)  |> Repo.preload(:inserted_by) |> Repo.preload(:updated_by)

  @doc """
  Creates a config.

  ## Examples

      iex> create_config(%{field: value})
      {:ok, %Config{}}

      iex> create_config(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_config(user_id,attrs \\ %{}) do
    %Config{}
    |> Config.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a config.

  ## Examples

      iex> update_config(config, %{field: new_value})
      {:ok, %Config{}}

      iex> update_config(config, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_config(user_id,%Config{} = config, attrs) do
    config
    |> Config.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.update()
  end

  @doc """
  Deletes a Config.

  ## Examples

      iex> delete_config(config)
      {:ok, %Config{}}

      iex> delete_config(config)
      {:error, %Ecto.Changeset{}}

  """
  def delete_config(%Config{} = config) do
    Repo.delete(config)
  end

  def delete_config(ids) do
    from( p in Config, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking config changes.

  ## Examples

      iex> change_config(config)
      %Ecto.Changeset{source: %Config{}}

  """
  def change_config(%Config{} = config) do
    Config.changeset(config, %{})
  end

  alias Hello.Sys.Dicttype

  @doc """
  Returns the list of dicttypes.

  ## Examples

      iex> list_dicttypes()
      [%Dicttype{}, ...]

  """
  def list_dicttypes (params)do
    conditions = true
    conditions =
      if params["dict_name"] && params["dict_name"]!="" do
        dynamic([q],  like(q.dict_name, ^("%#{params["dict_name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    params = Map.put(params, "page", String.to_integer(params["pageNum"]))
    params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    Dicttype
    |> where([p],^conditions)
    |> order_by(^(Utils.get_order_by(params["orderByColumn"],params["isAsc"])))
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |>  Repo.paginate(params)
  end

  def list_dicttypes_all (params)do
    conditions = true
    conditions =
      if params["dict_name"] && params["dict_name"]!="" do
        dynamic([q],  like(q.dict_name, ^("%#{params["dict_name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
  #  params = Map.put(params, "page", String.to_integer(params["pageNum"]))
  #  params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    Dicttype
    |> where([p],^conditions)
    |> order_by(^({:asc, :dict_type}))
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |> Repo.all
  end

  @doc """
  Gets a single dicttype.

  Raises `Ecto.NoResultsError` if the Dicttype does not exist.

  ## Examples

      iex> get_dicttype!(123)
      %Dicttype{}

      iex> get_dicttype!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dicttype!(id), do: Repo.get!(Dicttype, id)  |>  Repo.preload(:inserted_by) |>  Repo.preload(:updated_by)

  @doc """
  Creates a dicttype.

  ## Examples

      iex> create_dicttype(%{field: value})
      {:ok, %Dicttype{}}

      iex> create_dicttype(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dicttype(user_id,attrs \\ %{}) do
    %Dicttype{}
    |> Dicttype.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a dicttype.

  ## Examples

      iex> update_dicttype(dicttype, %{field: new_value})
      {:ok, %Dicttype{}}

      iex> update_dicttype(dicttype, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dicttype(user_id,%Dicttype{} = dicttype, attrs) do
    dicttype
    |> Dicttype.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.update()
  end

  @doc """
  Deletes a Dicttype.

  ## Examples

      iex> delete_dicttype(dicttype)
      {:ok, %Dicttype{}}

      iex> delete_dicttype(dicttype)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dicttype(%Dicttype{} = dicttype) do
    Repo.delete(dicttype)
  end

  def delete_dicttype(ids) do
    from( p in Dicttype, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dicttype changes.

  ## Examples

      iex> change_dicttype(dicttype)
      %Ecto.Changeset{source: %Dicttype{}}

  """
  def change_dicttype(%Dicttype{} = dicttype) do
    Dicttype.changeset(dicttype, %{})
  end

  alias Hello.Sys.Dictdata

  @doc """
  Returns the list of dictdatas.

  ## Examples

      iex> list_dictdatas()
      [%Dictdata{}, ...]

  """
  def list_dictdatas (params)do
    conditions = true
    conditions =
      if params["dict_label"] && params["dict_label"]!="" do
        dynamic([q],  like(q.dict_label, ^("%#{params["dict_label"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["dict_type"] && params["dict_type"]!="" do
        dynamic([q], q.dict_type == ^(params["dict_type"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    params = Map.put(params, "page", String.to_integer(params["pageNum"]))
    params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    Dictdata
    |> where([p],^conditions)
    |> order_by(^(Utils.get_order_by(params["orderByColumn"],params["isAsc"])))
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |>  Repo.paginate(params)
  end

  def list_dictdatas2 (dict_type)do
    from(s in Dictdata,  where: s.dict_type == ^dict_type)
    |> Repo.all
  end

  @doc """
  Gets a single dictdata.

  Raises `Ecto.NoResultsError` if the Dictdata does not exist.

  ## Examples

      iex> get_dictdata!(123)
      %Dictdata{}

      iex> get_dictdata!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dictdata!(id), do: Repo.get!(Dictdata, id)  |>  Repo.preload(:inserted_by) |>  Repo.preload(:updated_by)

  @doc """
  Creates a dictdata.

  ## Examples

      iex> create_dictdata(%{field: value})
      {:ok, %Dictdata{}}

      iex> create_dictdata(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dictdata(user_id,attrs \\ %{}) do
    %Dictdata{}
    |> Dictdata.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a dictdata.

  ## Examples

      iex> update_dictdata(dictdata, %{field: new_value})
      {:ok, %Dictdata{}}

      iex> update_dictdata(dictdata, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dictdata(user_id,%Dictdata{} = dictdata, attrs) do
    dictdata
    |> Dictdata.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.update()
  end

  @doc """
  Deletes a Dictdata.

  ## Examples

      iex> delete_dictdata(dictdata)
      {:ok, %Dictdata{}}

      iex> delete_dictdata(dictdata)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dictdata(%Dictdata{} = dictdata) do
    Repo.delete(dictdata)
  end

  def delete_dictdata(ids) do
    from( p in Dictdata, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dictdata changes.

  ## Examples

      iex> change_dictdata(dictdata)
      %Ecto.Changeset{source: %Dictdata{}}

  """
  def change_dictdata(%Dictdata{} = dictdata) do
    Dictdata.changeset(dictdata, %{})
  end

  alias Hello.Sys.Menu

  @doc """
  Returns the list of menus.

  ## Examples

      iex> list_menus()
      [%Menu{}, ...]

  """
  def list_menus (params)do
    conditions = true
    conditions =
      if params["menu_name"] && params["menu_name"]!="" do
        dynamic([q],  like(q.menu_name, ^("%#{params["menu_name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    from(s in Menu)
    |> preload(:parent)
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |> where([p],^conditions)
    |> order_by(^({:asc, :order_num}))
    |> Repo.all
  end

  @doc """
  Gets a single menu.

  Raises `Ecto.NoResultsError` if the Menu does not exist.

  ## Examples

      iex> get_menu!(123)
      %Menu{}

      iex> get_menu!(456)
      ** (Ecto.NoResultsError)

  """
  def get_menu!(nil) do
    %Menu{}
  end
  def get_menu!("") do
    %Menu{}
  end
  def get_menu!(0) do
    %Menu{}
  end

  def get_menu!(id) do
    Repo.get!(Menu, id)
    |>  Repo.preload(:parent)
    |>  Repo.preload(:inserted_by)
    |>  Repo.preload(:updated_by)
  end

  @doc """
  Creates a menu.

  ## Examples

      iex> create_menu(%{field: value})
      {:ok, %Menu{}}

      iex> create_menu(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_menu(user_id,attrs \\ %{}) do
    %Menu{}
    |> Repo.preload(:parent)
    |> Menu.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a menu.

  ## Examples

      iex> update_menu(menu, %{field: new_value})
      {:ok, %Menu{}}

      iex> update_menu(menu, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_menu(user_id,%Menu{} = menu, attrs) do
    menu
    |> Menu.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.update()
  end

  @doc """
  Deletes a Menu.

  ## Examples

      iex> delete_menu(menu)
      {:ok, %Menu{}}

      iex> delete_menu(menu)
      {:error, %Ecto.Changeset{}}

  """
  def delete_menu(%Menu{} = menu) do
    Repo.delete(menu)
  end

  def delete_menu(ids) do
    from( p in Menu, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking menu changes.

  ## Examples

      iex> change_menu(menu)
      %Ecto.Changeset{source: %Menu{}}

  """
  def change_menu(%Menu{} = menu) do
    Menu.changeset(menu, %{})
  end

  alias Hello.Sys.Dept

  @doc """
  Returns the list of depts.

  ## Examples

      iex> list_depts()
      [%Dept{}, ...]

  """
  def list_depts (params) do
    conditions = true
    conditions =
      if params["deptName"] && params["deptName"]!="" do
        dynamic([q],  like(q.dept_name, ^("%#{params["deptName"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions = if params["parent_id"]  && params["parent_id"]!="" do
      dynamic([s], s.parent_id == ^(params["parent_id"] ) and ^conditions)
    else
      conditions
    end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    from(s in Dept)
    |> where([p],^conditions)
    |> order_by(^({:asc,:order_num}))
    |> preload(:parent)
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |> Repo.all
  end
  def list_depts_all (params) do
    from(s in Dept)
    |> order_by(^({:asc,:order_num}))
    |> preload(:parent)
    |> preload(:inserted_by)
    |> preload(:updated_by)
    |> Repo.all
  end
  @doc """
  Gets a single dept.

  Raises `Ecto.NoResultsError` if the Dept does not exist.

  ## Examples

      iex> get_dept!(123)
      %Dept{}

      iex> get_dept!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dept!("") do
    %Dept{}
  end
  def get_dept!(nil) do
    %Dept{}
  end
  def get_dept!(0) do
    %Dept{}
  end
  def get_dept!(id) do
    Repo.get!(Dept, id)
    |> Repo.preload(:parent)
    |> Repo.preload(:inserted_by)
    |> Repo.preload(:updated_by)
  end
  @doc """
  Creates a dept.

  ## Examples

      iex> create_dept(%{field: value})
      {:ok, %Dept{}}

      iex> create_dept(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dept(user_id,attrs \\ %{}) do
    p=get_dept!(attrs["parent_id"])
    %Dept{}
    |> Dept.changeset(attrs)
    |> Ecto.Changeset.put_change(:ancestors, "#{p.ancestors},#{Integer.to_string( p.id)}")
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a dept.

  ## Examples

      iex> update_dept(dept, %{field: new_value})
      {:ok, %Dept{}}

      iex> update_dept(dept, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dept(user_id,%Dept{} = dept, attrs) do
    p=get_dept!(attrs["parent_id"] || dept.parent_id)
    c=dept
    |> Dept.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)

   c= if p.id != nil do
      Ecto.Changeset.put_change(c,:ancestors, "#{p.ancestors},#{Integer.to_string( p.id)}")
    else
      c
    end

     Repo.update(c)
  end

  @doc """
  Deletes a Dept.

  ## Examples

      iex> delete_dept(dept)
      {:ok, %Dept{}}

      iex> delete_dept(dept)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dept(%Dept{} = dept) do
    Repo.delete(dept)
  end

  def delete_dept(ids) do
    from( p in Dept, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dept changes.

  ## Examples

      iex> change_dept(dept)
      %Ecto.Changeset{source: %Dept{}}

  """
  def change_dept(%Dept{} = dept) do
    dept= Repo.preload(dept,:parent)
    Dept.changeset(dept, %{})
  end

  alias Hello.Sys.Post


  def list_post_all do
    conditions = true
    Post
    |> where([p],^conditions)
    |>  Repo.all()
  end
  def list_post(nil) do
    []
  end
  def list_post(ids) do
    from( p in Post, where: p.id in ^(ids))
    |>  Repo.all()
  end

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts (params)do
    conditions = true
    conditions =
      if params["post_name"] && params["post_name"]!="" do
        dynamic([q],  like(q.post_name, ^("%#{params["post_name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status == ^(params["status"]) and ^conditions)
      else
        conditions
      end

    conditions =
      if params["deptId"]  && params["deptId"]!="" do
        dynamic([s],s.dept_id == ^(params["deptId"])  and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    params = Map.put(params, "page", String.to_integer(params["pageNum"]))
    params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    Post
    |> where([p],^conditions)
    |> order_by(^(Utils.get_order_by(params["orderByColumn"],params["isAsc"])))
    |>preload(:inserted_by)
    |>preload(:updated_by)
    |> preload(:dept)
    |>  Repo.paginate(params)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id) |>  Repo.preload(:dept)   |>  Repo.preload(:inserted_by)  |>  Repo.preload(:updated_by)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(user_id,attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(user_id,%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.update()
  end

  @doc """
  Deletes a Post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def delete_post(ids) do
    from( p in Post, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{source: %Post{}}

  """
  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end
  alias Hello.Sys.Role

  @doc """
  Returns the list of roles.

  ## Examples

      iex> list_roles()
      [%Role{}, ...]

  """
  def list_roles (params)do
    conditions = true
    conditions =
      if params["role_name"] && params["role_name"]!="" do
        dynamic([q],  like(q.role_name, ^("%#{params["role_name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    params = Map.put(params, "page", String.to_integer(params["pageNum"]))
    params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    Role
    |> where([p],^conditions)
    |> order_by(^(Utils.get_order_by(params["orderByColumn"],params["isAsc"])))
    |>preload(:inserted_by)
    |>preload(:updated_by)
    |>  Repo.paginate(params)
  end

  def list_role_all do
    conditions = true
    Role
    |> where([p],^conditions)
    |>  Repo.all()
  end
  def list_role(nil) do
   []
  end
  def list_role(ids) do
    Role
    from( p in Role, where: p.id in ^(ids))
    |>  Repo.all()
  end

  @doc """
  Gets a single role.

  Raises `Ecto.NoResultsError` if the Role does not exist.

  ## Examples

      iex> get_role!(123)
      %Role{}

      iex> get_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role!(id) do
    Repo.get!(Role, id)
    |>  Repo.preload(:inserted_by)
    |>  Repo.preload(:updated_by)
  end
  @doc """
  Creates a role.

  ## Examples

      iex> create_role(%{field: value})
      {:ok, %Role{}}

      iex> create_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role(user_id,attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a role.

  ## Examples

      iex> update_role(role, %{field: new_value})
      {:ok, %Role{}}

      iex> update_role(role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role(user_id,%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.update()
  end

  @doc """
  Deletes a Role.

  ## Examples

      iex> delete_role(role)
      {:ok, %Role{}}

      iex> delete_role(role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  def delete_role(ids) do
    from( p in Role, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role changes.

  ## Examples

      iex> change_role(role)
      %Ecto.Changeset{source: %Role{}}

  """
  def change_role(%Role{} = role) do
    Role.changeset(role, %{})
  end

  alias Hello.Sys.Area

  @doc """
  Returns the list of areas.

  ## Examples

      iex> list_areas()
      [%Area{}, ...]

  """
  def list_areas (params)do
    conditions = true
    conditions =
      if params["name"] && params["name"]!="" do
        dynamic([q],  like(q.name, ^("%#{params["name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      dynamic([s], s.parent_id ==  ^(params["parent_id"]|| 1)  and ^conditions)
    Area
    |> where([p],^conditions)
    |> order_by(^({:asc,:code}))
    #|>preload(:parent)
    |>preload(:inserted_by)
    |>preload(:updated_by)
    |>preload(:parent)
    |>  Repo.all
  end

  def list_areas_all (params)do
    Area
    |> order_by(^({:asc,:code}))
    |>preload(:inserted_by)
    |>preload(:updated_by)
    |>preload(:parent)
    |>  Repo.all
 end
  @doc """
  Gets a single area.

  Raises `Ecto.NoResultsError` if the Area does not exist.

  ## Examples

      iex> get_area!(123)
      %Area{}

      iex> get_area!(456)
      ** (Ecto.NoResultsError)

  """
  def get_area!(nil) do
    %Area{}
  end
  def get_area!("") do
    %Area{}
  end
  def get_area!(id) do
    Repo.get!(Area, id)
    |>  Repo.preload(:inserted_by)
    |>  Repo.preload(:updated_by)
    |>  Repo.preload(:parent)
  end
  @doc """
  Creates a area.

  ## Examples

      iex> create_area(%{field: value})
      {:ok, %Area{}}

      iex> create_area(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_area(user_id,attrs \\ %{}) do
    p=get_area!(attrs["parent_id"])
    %Area{}
    |> Area.changeset(attrs)
    |> Ecto.Changeset.put_change(:type, p.type+1)
    |> Ecto.Changeset.put_change(:ancestors, "#{p.ancestors}#{Integer.to_string( p.id)},")
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a area.

  ## Examples

      iex> update_area(area, %{field: new_value})
      {:ok, %Area{}}

      iex> update_area(area, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_area(user_id,%Area{} = area, attrs) do
    p=get_area!(attrs["parent_id"]||area.parent_id)
    area
    |> Area.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Ecto.Changeset.put_change(:type, p.type+1)
    |> Ecto.Changeset.put_change(:ancestors, "#{p.ancestors}#{Integer.to_string( p.id)},")
    |> Repo.update()
  end

  @doc """
  Deletes a Area.

  ## Examples

      iex> delete_area(area)
      {:ok, %Area{}}

      iex> delete_area(area)
      {:error, %Ecto.Changeset{}}

  """
  def delete_area(%Area{} = area) do
    Repo.delete(area)
  end

  def delete_area(ids) do
    from( p in Area, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking area changes.

  ## Examples

      iex> change_area(area)
      %Ecto.Changeset{source: %Area{}}

  """
  def change_area(%Area{} = area) do
    Area.changeset(area, %{})
  end
  def change_area_new(%Area{} = area) do
    area
    |>  Repo.preload(:parent)
    |> Area.changeset( %{})
   # |> Ecto.Changeset.put_assoc(:parent,%Area{id: 1 })
  end

  alias Hello.Sys.Company

  @doc """
  Returns the list of companys.

  ## Examples

      iex> list_companys()
      [%Company{}, ...]

  """
  def list_companys (params)do
    conditions = true
    conditions =
      if params["name"] && params["name"]!="" do
        dynamic([q],  like(q.name, ^("%#{params["name"]}%")) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["status"]  && params["status"]!="" do
        dynamic([s], s.status== ^(params["status"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["area_id"]  && params["area_id"]!="" do
        dynamic([s], s.area_id== ^(params["area_id"]) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["beginTime"]  && params["beginTime"]!="" do
        dynamic([s], s.inserted_at >=  type(^(params["beginTime"]), :date) and ^conditions)
      else
        conditions
      end
    conditions =
      if params["endTime"]  && params["endTime"]!="" do
        dynamic([s], s.inserted_at <= type(^(params["endTime"]), :date) and ^conditions)
      else
        conditions
      end
    params = Map.put(params, "page", String.to_integer(params["pageNum"]))
    params = Map.put(params, "page_size", String.to_integer(params["pageSize"]))
    Company
    |> where([p],^conditions)
    |> order_by(^(Utils.get_order_by(params["orderByColumn"],params["isAsc"])))
    |>preload(:inserted_by)
    |>preload(:updated_by)
    |>preload(:area)
    |>  Repo.paginate(params)
  end

  @doc """
  Gets a single company.

  Raises `Ecto.NoResultsError` if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

      iex> get_company!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company!(id) do
    Repo.get!(Company, id)
    |>  Repo.preload(:inserted_by)
    |>  Repo.preload(:updated_by)
    |>  Repo.preload(:area)
  end
  @doc """
  Creates a company.

  ## Examples

      iex> create_company(%{field: value})
      {:ok, %Company{}}

      iex> create_company(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company(user_id,attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Ecto.Changeset.put_change(:inserted_by_id, user_id)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.insert()
  end
  @doc """
  Updates a company.

  ## Examples

      iex> update_company(company, %{field: new_value})
      {:ok, %Company{}}

      iex> update_company(company, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company(user_id,%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Ecto.Changeset.put_change(:updated_by_id, user_id)
    |> Repo.update()
  end

  @doc """
  Deletes a Company.

  ## Examples

      iex> delete_company(company)
      {:ok, %Company{}}

      iex> delete_company(company)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  def delete_company(ids) do
    from( p in Company, where: p.id in ^(String.split(ids,",")))
    |> Repo.delete_all()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company changes.

  ## Examples

      iex> change_company(company)
      %Ecto.Changeset{source: %Company{}}

  """
  def change_company(%Company{} = company) do
    Company.changeset(company, %{})
  end
  def change_company_new(%Company{} = company) do
    company
    |>  Repo.preload(:area)
    |> Company.changeset( %{})
  end
end
