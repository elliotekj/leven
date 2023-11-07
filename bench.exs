random_string = fn chars ->
  for _ <- 1..chars, into: "", do: <<Enum.random(~c"0123456789abcdef")>>
end

Benchee.run(
  %{"distance" => fn {lhs, rhs} -> Leven.distance(lhs, rhs) end},
  inputs: %{
    "empty_lhs" => {"", random_string.(4)},
    "empty_rhs" => {random_string.(4), ""},
    "4_char_strings" => {random_string.(4), random_string.(4)},
    "8_char_strings" => {random_string.(8), random_string.(8)},
    "16_char_strings" => {random_string.(16), random_string.(16)},
    "32_char_strings" => {random_string.(32), random_string.(32)},
    "64_char_strings" => {random_string.(64), random_string.(64)},
    "128_char_strings" => {random_string.(128), random_string.(128)},
    "256_char_strings" => {random_string.(256), random_string.(256)}
  }
)
