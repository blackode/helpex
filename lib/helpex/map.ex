defmodule Helpex.Map do
  @moduledoc """
  Map helper functions
  """

  @doc """
  The safest way to get the value of a key from the given map. If the key is 
  either binary or atom, first checks for the value and if it is `nil` then it 
  converts the key to either binary or atom based on the key provided.

  ## Examples

        iex> Helpex.Map.get(%{name: "blackode", age: 25}, "name")
        "blackode"

        iex> Helpex.Map.get(%{name: "blackode", age: 25}, :age)
        25

        iex> Helpex.Map.get(%{"name" => "blackode", "age" => 25}, :name)
        "blackode"

        iex> Helpex.Map.get(%{"name" => "blackode", "age" => 25}, "age")
        25

        iex> Helpex.Map.get(%{"name" => "blackode", "age" => 25}, "unknown")
        nil
  """

  def get(map, key) when is_atom(key) do
    key_string = to_string(key)
    Map.get(map, key) || Map.get(map, key_string)
  end

  def get(map, key) when is_binary(key) do
    key_atom = String.to_atom(key)
    Map.get(map, key) || Map.get(map, key_atom)
  end

  @doc """
  It checks whether the keys are presented inside the given map or not. It gives
  `true` when all the keys exist inside the map else `false`

      Examples

          iex> Helpex.Map.has_keys?(%{a: 1, b: 2, c: 3}, [:a, :b])
          true

          iex> Helpex.Map.has_keys?(%{a: 1, b: 2, c: 3}, [:a, :b, :c])
          true

          iex> Helpex.Map.has_keys?(%{"a" => 1, "b" => 2, "c" => 3}, ["a", "b"])
          true

          iex> Helpex.Map.has_keys?(%{"a" => 1, "b" => 2, "c" => 3}, ["a", "b", "z"])
          false

          iex> Helpex.Map.has_keys?(%{a: 1, b: 2, c: 3}, [])
          true

          iex> Helpex.Map.has_keys?(%{}, [:a, :b])
          false

          iex> Helpex.Map.has_keys?(%{}, [])
          true
          
  """
  @spec has_keys?(Map, List) :: Boolean
  def has_keys?(map, keys) when is_map(map)do
    map_keys = Map.keys(map)
    Enum.all?(keys, &(&1 in map_keys))
  end

  @doc """
  Returns true if `map1` is subset of `map2`, false otherwise.
  
  ## Examples

        iex> Helpex.Map.subset?(%{a: 1}, %{a: 1, b: 2})
        true

        iex> Helpex.Map.subset?(%{a: 1, c: 3}, %{a: 1, b: 2})
        false

        iex> Helpex.Map.subset?(%{}, %{a: 1, b: 2})
        true

        iex> Helpex.Map.subset?(%{}, %{})
        true

        iex> Helpex.Map.subset?(%{a: 1}, %{a: 1})
        true
  """
  @spec subset?(Map, Map) :: Boolean

  def subset?(map1, map2) do
    set1 = MapSet.new(map1)
    set2 = MapSet.new(map2)
    MapSet.subset?(set1, set2)
  end

  @doc """
  Changes the `key1` with `key2` in the given map.

  If `key1` is present in a map then it is chnaged to `key2` and returns 
  `{:ok, changed_map}`, else returns `{:error, :enokey}` 


  ## Examples

        iex> Helpex.Map.change_key(%{a: 1, b: 2}, :a, :x)
        {:ok, %{x: 1, b: 2}}

        iex> Helpex.Map.change_key(%{a: 1, b: 2}, :c, :x)
        {:error, :enokey}
  """

  @spec change_key(Map, String|Atom, String|Atom) :: Map
  def change_key(map, key1, key2) do
    if Map.has_key?(map, key1) do
      changed_map = 
        Map.new(map, fn 
          {^key1, value} -> {key2, value}
          item -> item
        end)
      {:ok, changed_map}
    else
        {:error, :enokey}
    end
  end

  @doc """
  Similar to `change_key/3`.
  
  If `map` `key1` is changed then it gives you the changed map directly.

  If `key1` is not present in `map`, a `KeyError` exception is raised.

  ## Examples

        iex> Helpex.Map.change_key!(%{a: 1, b: 2}, :a, :x)
        %{x: 1, b: 2}

        iex> Helpex.Map.change_key!(%{a: 1, b: 2}, :c, :x)
        ** (KeyError) key :c not found in: %{a: 1, b: 2}

  """

  @spec change_key!(Map, String.t()|atom(), String.t()|atom()) :: map()
  def change_key!(map, key1, key2) do
    if Map.fetch!(map, key1) do
      Map.new(map, fn 
        {^key1, value} -> {key2, value}
        item -> item
      end)

    end
  end
end
