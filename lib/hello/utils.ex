defmodule Utils do
  @order_by "id asc"
  @moduledoc false

  def get_order_by( "") do
    [by, dir] =String.split(@order_by," ")
    {String.to_atom(dir ), String.to_atom(by )}
  end
  def get_order_by( order_by) do
    [by, dir] =String.split(order_by," ")
    {String.to_atom(dir ), String.to_atom(by )}
  end
  def get_order_by( by,dir) do
    {String.to_atom(dir ), String.to_atom(by )}
  end
end
