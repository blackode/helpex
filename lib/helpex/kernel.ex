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
end
