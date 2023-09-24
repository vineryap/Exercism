defmodule Username do
  @spec sanitize(charlist()) :: charlist()
  def sanitize(~c""), do: ~c""

  def sanitize([first_char_code | rest]) do
    sanitised_char =
      case first_char_code do
        # accept lowercase letters (a-z letters are sequentially ordered)
        char when char >= ?a and char <= ?z -> [char]
        # allow underscores
        ?_ -> ~c"_"
        # ä becomes ae
        ?ä -> ~c"ae"
        # ü becomes ue
        ?ü -> ~c"ue"
        # ö becomes oe
        ?ö -> ~c"oe"
        # ß becomes ss
        ?ß -> ~c"ss"
        # remove anything else
        _ -> ~c""
      end

    sanitised_char ++ sanitize(rest)
  end
end
