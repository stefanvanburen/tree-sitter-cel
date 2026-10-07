; Variables in CEL come from the evaluation environment, except those bound by
; macros: comprehensions such as `xs.all(x, x > 0)` and `m.all(k, v, k < v)`,
; and `cel.bind(name, init, body)`. Each binding is scoped to the macro's
; arguments.
; Scopes
(member_call_expression
  function: (identifier) @_macro
  arguments: (arguments) @local.scope
  (#any-of? @_macro
    "all" "exists" "exists_one" "existsOne" "map" "filter" "transformList" "transformMap"
    "transformMapEntry" "sortBy" "optMap" "optFlatMap" "bind"))

; Definitions
(member_call_expression
  function: (identifier) @_macro
  arguments: (arguments
    .
    (identifier) @local.definition)
  (#any-of? @_macro
    "all" "exists" "exists_one" "existsOne" "map" "filter" "transformList" "transformMap"
    "transformMapEntry" "sortBy" "optMap" "optFlatMap" "bind"))

(member_call_expression
  function: (identifier) @_macro
  arguments: (arguments
    .
    (identifier)
    .
    (identifier) @local.definition
    .
    (_) .)
  (#any-of? @_macro "all" "exists" "existsOne"))

(member_call_expression
  function: (identifier) @_macro
  arguments: (arguments
    .
    (identifier)
    .
    (identifier) @local.definition)
  (#any-of? @_macro "transformList" "transformMap" "transformMapEntry"))

; References: identifiers in expression position, not field, function or type
; names
(binary_expression
  [
    left: (identifier)
    right: (identifier)
  ] @local.reference)

(conditional_expression
  [
    condition: (identifier)
    consequence: (identifier)
    alternative: (identifier)
  ] @local.reference)

(unary_expression
  operand: (identifier) @local.reference)

(index_expression
  [
    operand: (identifier)
    index: (identifier)
  ] @local.reference)

(select_expression
  operand: (identifier) @local.reference)

(member_call_expression
  operand: (identifier) @local.reference)

(map_entry
  [
    key: (identifier)
    value: (identifier)
  ] @local.reference)

(field_initializer
  value: (identifier) @local.reference)

(expr
  (identifier) @local.reference)

(arguments
  (identifier) @local.reference)

(list_expression
  (identifier) @local.reference)

(parenthesized_expression
  (identifier) @local.reference)
