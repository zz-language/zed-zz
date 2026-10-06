; zed-zz — tree-sitter highlights for ZZ (Zed capture set).
; Node names come from zz-language/tree-sitter-zz; ported from its
; queries/highlights.scm with captures limited to what Zed supports.

; ── Keywords ──
[
  "import" "as" "func" "return" "if" "else" "while" "match"
  "struct" "for" "in" "defer"
  "pub" "impl" "const" "extern"
] @keyword

(break_statement) @keyword
(continue_statement) @keyword

"true" @boolean
"false" @boolean

; ── Types ──
(primitive_type) @type
(named_type name: (type_identifier) @type)
(named_type name: (identifier) @type)

; ── Functions / structs / consts ──
(function_definition name: (identifier) @function)
(struct_definition name: (type_identifier) @type)
(impl_block name: (type_identifier) @type)
(const_definition name: (identifier) @constant)
(parameter name: (identifier) @variable)

; ── Calls / fields / variants ──
(call_expression function: (identifier) @function)
(call_expression function: (field_expression field: (identifier) @function.method))
(field_expression field: (identifier) @property)
(variant) @constant

; ── Modules ──
(import_statement module: (module_path) @module)
(module_path) @module

; ── Literals ──
(string) @string
(triple_string) @string
(string_content) @string
(brace_content) @string
(escape_sequence) @string.escape
(interpolation "{") @punctuation.special
(interpolation "}") @punctuation.special
(int_literal) @number
(float_literal) @number

; ── Operators / punctuation ──
[
  "+" "-" "*" "**" "/" "%"
  "=" "==" "!=" "<" ">" "<=" ">="
  "&&" "||" "!" "?" "??"
  ":=" ":" "," "." ".." "|" "|>" "->" "=>"
  "&" "^" "~" "<<" ">>"
  "+=" "-=" "*=" "/=" "%=" "**=" "&=" "|=" "^=" "<<=" ">>="
  "@" ";"
] @operator

[
  "(" ")" "[" "]" "{" "}"
] @punctuation.bracket

(decorator) @attribute

; ── Comments ──
(line_comment) @comment
(block_comment) @comment
