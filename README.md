<p align="center">
    <img src="https://github.com/elliotekj/leven/blob/main/logo.png" width="480" max-width="90%" alt="Leven" />
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
    {:leven, "~> 1.0"}
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

To benchmark Leven on your machine, clone the repo and run `mix bench`.

## License

Leven is released under the [`Apache License
2.0`](https://github.com/elliotekj/leven/blob/main/LICENSE).

## About

This package was written by [Elliot Jackson](https://elliotekj.com).

- Blog: [https://elliotekj.com](https://elliotekj.com)
- Email: elliot@elliotekj.com

[1]: https://en.wikipedia.org/wiki/Levenshtein_distance
