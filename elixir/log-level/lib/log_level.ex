defmodule LogLevel do
  @log_labels %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  @spec to_label(number, boolean) ::
          :debug | :error | :fatal | :info | :trace | :unknown | :warning
  def to_label(level, legacy?) do
    cond do
      # Get the label from only if the level is exists in the map and NOT came from a legacy app, OR if the level is from 1-4 regardless the app.
      (Map.has_key?(@log_labels, level) and not legacy?) or (level >= 1 and level <= 4) ->
        Map.fetch!(@log_labels, level)

      # Other than the condition above will be labeled as "unknown".
      true ->
        :unknown
    end
  end

  @spec alert_recipient(number, boolean) :: :dev1 | :dev2 | false | :ops
  def alert_recipient(level, legacy?) do
    cond do
      to_label(level, legacy?) == :error or to_label(level, legacy?) == :fatal -> :ops
      to_label(level, legacy?) == :unknown and legacy? -> :dev1
      to_label(level, legacy?) == :unknown -> :dev2
      true -> false
    end
  end
end
