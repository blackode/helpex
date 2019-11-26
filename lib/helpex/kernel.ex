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

  @spec empty_string?(String.t())
end
