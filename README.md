# Machinex

**Machine Learning with Elixir**

## Introduction

Machinex plans to be a machine learning library running on top of Elixir. The idea
behind Machinex is to allow the user to program in native Elixir and deploy 
with C/CUDA backends, which are faster than pure Elixir.

We all are aware that Elixir and Erlang/OTP for that matter are not good with 
computations, but are great with logic and abstraction. So, the implementation of
Machinex reflects my desire to have great language abstractions to run machine learning
code.

The library is not ready yet, but I've set a small TODO list of what's going to be implemented. 
This might change as I'm doing this library as I'm learning ML.

- Complex numbers [OK]
- BLAS [In progress]
- Supervised Learning
- Unsupervised Learning
- Deep Learning


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `machinex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:machinex, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/machinex](https://hexdocs.pm/machinex).

