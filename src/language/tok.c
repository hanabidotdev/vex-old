#include <ctype.h>
#include <language/vl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum
{
  // Single-character tokens.
  LEFT_PAREN,
  RIGHT_PAREN,
  LEFT_BRACE,
  RIGHT_BRACE,
  COMMA,
  DOT,
  MINUS,
  PLUS,
  SEMICOLON,
  SLASH,
  STAR,
  SINGlE_BANG,

  // One or two character tokens.
  BANG,
  BANG_EQUAL,
  EQUAL,
  EQUAL_EQUAL,
  GREATER,
  GREATER_EQUAL,
  LESS,
  LESS_EQUAL,

  // Literals.
  IDENTIFIER,
  STRING,
  INTEGER,
  FLOAT,

  // Keywords.
  AND,
  ELSE,
  FALSE,
  FN,
  FOR,
  IF,
  OR,
  PRINT,
  RETURN,
  TRUE,
  LET,
  WHILE,
  END,
  THEN,
  AS,

  // Classic EOF
  END_OF_FILE
} vex_lex_tok_typ_t;

typedef struct
{
  vex_lex_tok_typ_t typ;
  char *typs;
  char *lexeme;
  union
  {
    int i;
    float f;
    char *s;
  } val;
  int line;
} vex_lex_tok_t;

bool vex_lex_has_error = false;

void
vex_lex_error (int line, char *where, char *message)
{
  printf ("Error %s: %s \n", where, message);
  printf ("at line %i\n", line);
  vex_lex_has_error = true;
}

char *
vex_lex_see_tok (vex_lex_tok_t *tok)
{
  char *bfr;
  snprintf (bfr, 2048, "<%s at %d with (s: %s, f: %f, i: %d)>", tok->typs,
            tok->line, tok->val.s, tok->val.f, tok->val.i);
  return bfr;
}
