defmodule LogParser do
  def valid_line?(line), do: line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/

  def split_line(line), do: String.split(line, ~r{\<[~*=-]*\>})

  def remove_artifacts(line),
    do: String.replace(line, ~r{end-of-line\d+}i, "", global: true)

  def tag_with_user_name(line),
    do:
      line
      |> String.replace(
        ~r/\[(DEBUG|INFO|WARNING|ERROR|WARN)\](.+)User[\s\\t\\n]+([^\s\\t\\n]+)/,
        "[USER] \\g{3} \\0"
      )
end
