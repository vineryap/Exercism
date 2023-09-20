defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(min), do: expected_minutes_in_oven() - min

  def preparation_time_in_minutes(n_layer), do: n_layer * 2

  def total_time_in_minutes(n_layer, min), do: preparation_time_in_minutes(n_layer) + min

  def alarm(), do: "Ding!"
end
