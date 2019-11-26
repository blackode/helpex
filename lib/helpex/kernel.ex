defmodule Helpex.Kernel do
  @moduledoc """
  All kernel helper functions for regular usage
  """

  @doc """
  Determines if the data is empty.
  Returns `true` if data is empty, otherwise `false`.

  ## Examples

        iex> Helpex.Kernel.empty?("")
        true

        iex> Helpex.Kernel.empty?(" ")
        true

        iex> Helpex.Kernel.empty?(<<>>)
        true

        iex> Helpex.Kernel.empty?([])
        true

        iex> Helpex.Kernel.empty?(%{})
        true

        iex> Helpex.Kernel.empty?(%{a: 1})
        false

        iex> Helpex.Kernel.empty?([1, 2, 3])
        false

  """

  @spec empty?(Helpex.Empty.t()) :: boolean()
  def empty?(data) do
    Helpex.Empty.empty?(data)
  end

  @doc """
  Determines if the string is empty.
  If the string is empty it returns `true`, otherwise `false` 

  However, if other type is passed it raises No `FunctionClauseError`.

  ## Examples

        iex> Helpex.Kernel.empty_string? ""
        true

        iex> Helpex.Kernel.empty_string? "   "
        true

        iex> Helpex.Kernel.empty_string? "   hello"
        false

        iex> Helpex.Kernel.empty_string? 123
        ** (FunctionClauseError) no function clause matching in Helpex.Kernel.empty_string?/1
  """
  @spec empty_string?(String.t()) :: boolean()
  def empty_string?(string) when is_binary(string) do
    Helpex.Empty.empty?(string)
  end

  @doc """
  Determines if `this` or `that` evaluates to truthy. If so returns
  `true`, `false` if not.

  ## Examples

        iex> Helpex.Kernel.either?(4, 5)
        true

        iex> Helpex.Kernel.either?(false, 5)
        true

        iex> Helpex.Kernel.either?(5, nil)
        true

        iex> Helpex.Kernel.either?(false, nil)
        false

        iex> Helpex.Kernel.either?(nil, nil)
        false

        iex> Helpex.Kernel.either?(false, false)
        false
  """

  @spec either?(Any.t(), Any.t()) :: boolean()
  def either?(this, that) do
    !!(this || that)
  end

  @doc """
  Determines if `this` and `that` evaluates to truth. If so returns
  `true`, `false` if not.

  ## Examples

        iex> Helpex.Kernel.neither?(4, 5)
        false

        iex> Helpex.Kernel.neither?(false, 5)
        false

        iex> Helpex.Kernel.neither?(5, nil)
        false

        iex> Helpex.Kernel.neither?(false, nil)
        true

        iex> Helpex.Kernel.neither?(nil, nil)
        true

        iex> Helpex.Kernel.neither?(false, false)
        true
  """

  @spec neither?(Any.t(), Any.t()) :: boolean()
  def neither?(this, that) do
    !(this || that)
  end

  @doc """
  Determines the value is truthy or not. 

  If value is neither `false` nor `nil` it returns `true` else `false`.

  ## Examples

        iex> Helpex.Kernel.truthy?(true)
        true

        iex> Helpex.Kernel.truthy?(5)
        true

        iex> Helpex.Kernel.truthy?("hello")
        true

        iex> Helpex.Kernel.truthy?({:tuple})
        true

        iex> Helpex.Kernel.truthy?(%{key: :value})
        true

        iex> Helpex.Kernel.truthy?(false)
        false

        iex> Helpex.Kernel.truthy?(nil)
        false
  """
  def truthy?(value) do
    false_condition? = value === false
    nil_condition? = is_nil(value)

    neither?(false_condition?, nil_condition?)
  end

  @doc """
  Determines the value is falsy or not. 

  If value is either `false` or `nil` it returns `true` else `false`.

  ## Examples

        iex> Helpex.Kernel.falsy?(false)
        true

        iex> Helpex.Kernel.falsy?(nil)
        true

        iex> Helpex.Kernel.falsy?(true)
        false

        iex> Helpex.Kernel.falsy?(5)
        false

        iex> Helpex.Kernel.falsy?("hello")
        false

        iex> Helpex.Kernel.falsy?({:tuple})
        false

        iex> Helpex.Kernel.falsy?(%{key: :value})
        false

  """
  def falsy?(value) do
    false_condition? = value === false
    nil_condition? = is_nil(value)

    either?(false_condition?, nil_condition?)
  end
end

