defmodule Secrets do
  @spec secret_add(number) :: (number -> number)
  def secret_add(secret), do: &(&1 + secret)

  @spec secret_subtract(number) :: (number -> number)
  def secret_subtract(secret), do: &(&1 - secret)

  @spec secret_multiply(number) :: (number -> number)
  def secret_multiply(secret), do: &(&1 * secret)

  @spec secret_divide(number) :: (integer -> integer)
  def secret_divide(secret), do: &div(&1, secret)

  @spec secret_and(number) :: (integer -> integer)
  def secret_and(secret), do: &Bitwise.band(&1, secret)

  @spec secret_xor(number) :: (integer -> integer)
  def secret_xor(secret), do: &Bitwise.bxor(&1, secret)

  @spec secret_combine((number -> number), (number -> number)) ::
          (number -> number)
  def secret_combine(secret_function1, secret_function2),
    do: &secret_function2.(secret_function1.(&1))
end
