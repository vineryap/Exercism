defmodule KitchenCalculator do
  @_us_units_in_ml %{
    :cup => 240,
    :fluid_ounce => 30,
    :teaspoon => 5,
    :tablespoon => 15
  }

  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter({:cup, volume}), do: {:milliliter, 240 * volume}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, 30 * volume}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, 5 * volume}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, 15 * volume}
  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}

  def from_milliliter(volume_pair, :cup = unit),
    do: {unit, get_volume(volume_pair) / @_us_units_in_ml[unit]}

  def from_milliliter(volume_pair, :fluid_ounce = unit),
    do: {unit, get_volume(volume_pair) / @_us_units_in_ml[unit]}

  def from_milliliter(volume_pair, :teaspoon = unit),
    do: {unit, get_volume(volume_pair) / @_us_units_in_ml[unit]}

  def from_milliliter(volume_pair, :tablespoon = unit),
    do: {unit, get_volume(volume_pair) / @_us_units_in_ml[unit]}

  def from_milliliter(volume_pair, :milliliter = unit), do: {unit, get_volume(volume_pair)}

  def convert(volume_pair, :cup = unit),
    do: {unit, get_volume(to_milliliter(volume_pair)) / @_us_units_in_ml[unit]}

  def convert(volume_pair, :fluid_ounce = unit),
    do: {unit, get_volume(to_milliliter(volume_pair)) / @_us_units_in_ml[unit]}

  def convert(volume_pair, :teaspoon = unit),
    do: {unit, get_volume(to_milliliter(volume_pair)) / @_us_units_in_ml[unit]}

  def convert(volume_pair, :tablespoon = unit),
    do: {unit, get_volume(to_milliliter(volume_pair)) / @_us_units_in_ml[unit]}
end
