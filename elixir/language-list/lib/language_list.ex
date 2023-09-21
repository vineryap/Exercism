defmodule LanguageList do
  @spec new() :: []
  def new(), do: []

  @spec add([string], string) :: [string]
  def add(list, language), do: [language | list]

  @spec remove([string]) :: [string]
  def remove(list), do: tl(list)

  @spec first([string]) :: [string]
  def first(list), do: hd(list)

  @spec count([string]) :: integer
  def count(list), do: length(list)

  @spec functional_list?([string]) :: boolean
  def functional_list?(list), do: "Elixir" in list
end
