defmodule HelloWeb.Sys.DeptView do
  use HelloWeb, :view
  alias Hello.Sys

  def get_dict_json(dict_type) do
    #params=%{:dict_type =>dictType}
    result = Sys.list_dictdatas2(dict_type)
    Phoenix.json_library().encode!(result, escape: false)
  end

  def get_dict_list(dict_type) do
    result = Sys.list_dictdatas2(dict_type)
    [{"请选择" , ""}]++ Enum.map(result, &{&1.dict_label, &1.dict_value})
  end

  def my_get_in(f) do
    if f.data.parent !=nil do
      f.data.parent.dept_name
    else
      ""
    end

  end
end
