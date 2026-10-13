// Package tree_sitter_cel provides the Tree-sitter grammar for the Common
// Expression Language (CEL).
package tree_sitter_cel

// #cgo CFLAGS: -std=c11 -fPIC
// #include "../../src/parser.c"
// #if __has_include("../../src/scanner.c")
// #include "../../src/scanner.c"
// #endif
import "C"

import "unsafe"

// Language returns the Tree-sitter language for CEL, for use with
// [tree_sitter.NewLanguage].
//
// [tree_sitter.NewLanguage]: https://pkg.go.dev/github.com/tree-sitter/go-tree-sitter#NewLanguage
func Language() unsafe.Pointer {
	return unsafe.Pointer(C.tree_sitter_cel())
}
