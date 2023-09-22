defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> String.trim() |> String.first()

  def initial(name),
    do:
      first_letter(name)
      |> String.upcase()
      |> Kernel.<>(".")

  def initials(full_name) do
    [first, last] = String.split(full_name, " ")
    "#{first |> initial()} #{last |> initial()}"
  end

  def pair(full_name1, full_name2),
    do: """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
end
