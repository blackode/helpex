defmodule Helpex.String do
  @moduledoc false

  @doc """
  Converts `string` to titlecase.

  ## Examples

        iex> Helpex.String.titlecase("hello")
        "Hello"
        
        iex> Helpex.String.titlecase("ß is a SHARP s")
        "Ss is a SHARP s"

  """
  @spec titlecase(String.t()) :: String.t()
  def titlecase(string) do
    :string.titlecase(string)
  end
end
