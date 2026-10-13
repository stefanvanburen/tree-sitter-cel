package tree_sitter_cel_test

import (
	"testing"

	tree_sitter_cel "github.com/stefanvanburen/tree-sitter-cel/bindings/go"
	tree_sitter "github.com/tree-sitter/go-tree-sitter"
)

func TestParse(t *testing.T) {
	parser := tree_sitter.NewParser()
	defer parser.Close()
	if err := parser.SetLanguage(tree_sitter.NewLanguage(tree_sitter_cel.Language())); err != nil {
		t.Fatal(err)
	}
	tree := parser.Parse([]byte(`request.auth.claims.exists(c, c.startsWith("admin"))`), nil)
	defer tree.Close()
	if root := tree.RootNode(); root.HasError() {
		t.Errorf("parse error: %s", root.ToSexp())
	}
}
