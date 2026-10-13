# tree-sitter-cel

[Common Expression Language (CEL)](https://cel.dev/) grammar for [tree-sitter](https://github.com/tree-sitter/tree-sitter).

For directions on how to use this grammar, see the [tree-sitter](https://tree-sitter.github.io/tree-sitter/) documentation.

## What is this repository?

This repo contains a tree-sitter version of the [CEL grammar](https://github.com/google/cel-spec/blob/master/doc/langdef.md#syntax) for use with editors and CEL evaluators.

## Go

```
go get github.com/stefanvanburen/tree-sitter-cel
```

```go
import (
	tree_sitter_cel "github.com/stefanvanburen/tree-sitter-cel/bindings/go"
	tree_sitter "github.com/tree-sitter/go-tree-sitter"
)

parser := tree_sitter.NewParser()
defer parser.Close()
parser.SetLanguage(tree_sitter.NewLanguage(tree_sitter_cel.Language()))

tree := parser.Parse([]byte(`size(request.items) > 0`), nil)
defer tree.Close()
```

## References

- [cel-spec](https://github.com/google/cel-spec)

## Legal

Offered under the [Apache 2 license][license].

[license]: LICENSE
