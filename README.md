<p align="center">
    <img src="https://github.com/elliotekj/leven/blob/master/logo.png" width="480" max-width="90%" alt="Leven" />
</p>

Welcome to **Leven**, an efficient, tabulated implementation of the [Levenshtein
distance][1] algorithm in Elixir. The Levenshtein distance, also known as edit
distance, measures the difference between two strings in terms of the minimum
number of single-character edits (insertions, deletions, or substitutions)
required to change one string into the other.

## Installation

The package can be installed by adding `leven` to your list of dependencies in
`mix.exs`:

```elixir
def deps do
  [
    {:leven, "~> 1.0.0"}
  ]
end
```

## Example

``` elixir
iex(1)> Leven.distance("house", "horses")
2
```

Two single-character edits are required to get from "house" to "horses":

1. Substitute "u" for "r", resulting in "horse"
2. Appens "s", resulting in "horses"

## Benchmarks

The benchmarks shows how many operations per second Leven can perform for two
random strings of length `N` on my machine (Ryzen 7 / 16 Core / 32 GB).

| String Length | ops/sec | 
|---------------|---------|
| Empty LHS     | 2.5 M   |
| Empty RHS     | 2.47 M  |
| N=4           | 244.5 K |
| N=8           | 86.57 K |
| N=16          | 22.51 K |
| N=32          | 4.67 K  |
| N=64          | 863     |
| N=128         | 152     |
| N=256         | 23      |

## License

Leven is released under the [`Apache License
2.0`](https://github.com/elliotekj/leven/blob/master/LICENSE).

## About

This package was written by [Elliot Jackson](https://elliotekj.com).

- Blog: [https://elliotekj.com](https://elliotekj.com)
- Email: elliot@elliotekj.com

[1]: https://en.wikipedia.org/wiki/Levenshtein_distance
