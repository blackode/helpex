defprotocol Helpex.Empty do
  @doc "Checks whether the given data is empty or not."
  def empty?(data)
end

defimpl Helpex.Empty, for: [String, BitString] do
  def empty?(string) do
    string = String.trim(string)
    string === ""
  end
end

defimpl Helpex.Empty, for: [Map, MapSet] do
  def empty?(map) do
    case Map.keys(map) do
      [] -> true
      [:__struct__] -> true
      _ -> false
    end
  end
end

defimpl Helpex.Empty, for: List do
  def empty?([]) do
    true
  end

  def empty?(_) do
    false
  end
end

defimpl Helpex.Empty, for: Tuple do
  def empty?({}) do
    true
  end

  def empty?(_) do
    false
  end
end
