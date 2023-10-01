defmodule PaintByNumber do
  def palette_bit_size(color_count), do: find_bit_size(color_count)

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index),
    do: <<pixel_color_index::integer-size(palette_bit_size(color_count)), picture::bitstring>>

  def get_first_pixel(picture, _) when picture == <<>>, do: nil

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<first_pixel::integer-size(bit_size), _::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(picture, _) when picture == <<>>, do: <<>>

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_::integer-size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>

  defp find_bit_size(color_count, bit_size \\ 1),
    do:
      if(Integer.pow(2, bit_size) >= color_count,
        do: bit_size,
        else: find_bit_size(color_count, bit_size + 1)
      )
end
