defmodule Machinex.Backends.Native.Complex do
  @moduledoc false

  alias Machinex.Backend.Complex
  @behaviour Complex

  def add(%Complex{r: r1, i: i1}, %Complex{r: r2, i: i2}) do
    %Complex{r: r1 + r2, i: i1 + i2}
  end

  def add_real(%Complex{r: r, i: i}, real) do
    %Complex{r: r + real, i: i}
  end

  def add_imag(%Complex{r: r, i: i}, imag) do
    %Complex{r: r, i: i + imag}
  end

  def sub(%Complex{r: r1, i: i1}, %Complex{r: r2, i: i2}) do
    %Complex{r: r1 - r2, i: i1 - i2}
  end

  def sub_real(%Complex{r: r, i: i}, real) do
    %Complex{r: r - real, i: i}
  end

  def sub_imag(%Complex{r: r, i: i}, imag) do
    %Complex{r: r, i: i - imag}
  end

  def mul(%Complex{r: r1, i: i1}, %Complex{r: r2, i: i2}) do
    %Complex{r: r1 * r2 - i1 * i2, i: r1 * i2 + i1 * r2}
  end

  def mul_real(%Complex{r: r, i: i}, real) do
    %Complex{r: r * real, i: i * real}
  end

  def mul_imag(%Complex{r: r, i: i}, imag) do
    %Complex{r: - i * imag, i: r * imag}
  end

  def div(%Complex{r: r1, i: i1}, %Complex{r: r2, i: i2} = b) do
    s = 1.0 / mag(b)
    sbr2 = s * r2
    sbi2 = s * i2
    zr = (r1 * sbr2 + i1 * sbi2) * s
    zi = (i1 * sbr2 - r1 * sbi2) * s

    %Complex{r: zr, i: zi}
  end

  def div_real(%Complex{r: r, i: i}, real) do
    %Complex{r: r / real, i: i / real}
  end

  def div_imag(%Complex{r: r, i: i}, imag) do
    %Complex{r: i / imag, i: - r / imag}
  end

  def get_imag(%Complex{i: i}), do: i

  def set_imag(%Complex{r: r}, imag), do: %Complex{r: r, i: imag}

  def new(real, imag), do: %Complex{r: real, i: imag}

  def get_real(%Complex{r: r}), do: r

  def set_real(%Complex{i: i}, real), do: %Complex{r: real, i: i}

  def conjugate(%Complex{r: r, i: i}) do
    %Complex{r: r, i: - i}
  end

  def negative(%Complex{r: r, i: i}) do
    %Complex{r: - r, i: - i}
  end

  def inverse(%Complex{r: r, i: i} = a) do
    s = 1.0 / mag(a)

    %Complex{r: r * s * s, i: - (i * s * s)}
  end

  def arg(%Complex{r: r, i: i}) do
    if r == 0.0 and i == 0.0 do # There is no need to compare for type as well.
      0
    else
      :math.atan2(i, r)
    end
  end

  def mag(%Complex{r: r, i: i}) do
    :math.sqrt(:math.pow(r, 2) + :math.pow(i, 2))
  end
end
