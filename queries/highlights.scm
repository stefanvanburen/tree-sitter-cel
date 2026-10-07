; Syntax highlighting queries for CEL (Common Expression Language).
; Maps CEL grammar nodes to standard tree-sitter highlight capture names.
; Later patterns take precedence, so the general ones come first.
(identifier) @variable

; Operators
[
  "-"
  "!"
  "*"
  "/"
  "&&"
  "%"
  "+"
  "<"
  "<="
  "!="
  "=="
  ">"
  ">="
  "||"
] @operator

; Ternary operator
(conditional_expression
  [
    "?"
    ":"
  ] @keyword.conditional.ternary)

(map_entry
  ":" @punctuation.delimiter)

(field_initializer
  ":" @punctuation.delimiter)

; Punctuation
[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

"," @punctuation.delimiter

"." @punctuation.delimiter

; Keywords
"in" @keyword.operator

(reserved_keyword) @keyword

; Function calls
(call_expression
  function: (identifier) @function.call)

(absolute_expression
  name: (identifier) @function.call
  arguments: (arguments))

(member_call_expression
  function: [
    (identifier)
    (reserved_keyword)
  ] @function.method.call)

; Member access
(select_expression
  member: [
    (identifier)
    (reserved_keyword)
    (escaped_identifier)
  ] @variable.member)

(field_initializer
  key: [
    (identifier)
    (reserved_keyword)
    (escaped_identifier)
  ] @variable.member)

; Literals
[
  (string_literal)
  (bytes_literal)
] @string

[
  (int_literal)
  (uint_literal)
] @number

(float_literal) @number.float

[
  (true)
  (false)
  (null)
] @constant.builtin

(comment) @comment @spell

; Variables bound by macros
(member_call_expression
  function: (identifier) @function.method.call
  arguments: (arguments
    .
    (identifier) @variable.parameter)
  (#any-of? @function.method.call
    "all" "exists" "exists_one" "existsOne" "map" "filter" "transformList" "transformMap"
    "transformMapEntry" "sortBy" "optMap" "optFlatMap" "bind"))

(member_call_expression
  function: (identifier) @function.method.call
  arguments: (arguments
    .
    (identifier) @variable.parameter
    .
    (identifier) @variable.parameter
    .
    (_) .)
  (#any-of? @function.method.call "all" "exists" "existsOne"))

(member_call_expression
  function: (identifier) @function.method.call
  arguments: (arguments
    .
    (identifier) @variable.parameter
    .
    (identifier) @variable.parameter)
  (#any-of? @function.method.call "transformList" "transformMap" "transformMapEntry"))
