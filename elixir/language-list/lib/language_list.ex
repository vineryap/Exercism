defmodule LanguageList do
  @spec new() :: []
  def new(), do: []

  @spec add(charlist, String.t()) :: charlist
  def add(list, language), do: [language | list]

  @spec remove(charlist) :: charlist
  def remove(list), do: tl(list)

  @spec first(charlist) :: charlist
  def first(list), do: hd(list)

  @spec count(charlist) :: integer
  def count(list), do: length(list)

  @spec functional_list?(charlist) :: boolean
  def functional_list?(list), do: "Elixir" in list
end
