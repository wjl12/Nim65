grammar Nim;

start: INT_LIT;

CR: '\r'|'\c';
LF: '\n'|'\l';
FF: '\f';
TAB: '\t';
VERT_TAB: '\u0011';
BACKSLASH: '\\';
QUOTE: '"';
APOSTROPHE: '\'';

LETTER: 'A'..'Z' | 'a'..'z' | '\x80'..'\xFF';
DIGIT: '0'..'9';
HEXDIGIT: DIGIT | 'A'..'F' | 'a'..'f';
OCTDIGIT: '0'..'7';
BINDIGIT: '0'|'1';
UNARY_MINUS: '-';
HEX_LIT: UNARY_MINUS? '0' ('x'|'X') HEXDIGIT (['_'] HEXDIGIT)*;
DEC_LIT: UNARY_MINUS? DIGIT ('_' DIGIT)*;
OCT_LIT: UNARY_MINUS? '0' 'o' OCTDIGIT (['_'] OCTDIGIT)*;
BIN_LIT: UNARY_MINUS? '0' ('b'|'B') BINDIGIT ([_] BINDIGIT)*;

INT_LIT: HEX_LIT
       | DEC_LIT
       | OCT_LIT
       | BIN_LIT
       ;

INT8_LIT: INT_LIT ['\''] ('i'|'I') '8';
INT16_LIT: INT_LIT ['\''] ('i'|'I') '16';
INT32_LIT: INT_LIT ['\''] ('i'|'I') '32';
INT64_LIT: INT_LIT ['\''] ('i'|'I') '64';

UINT_LIT: INT_LIT ['\''] ('u'|'U');
UINT8_LIT: INT_LIT ['\''] ('u'|'U') '8';
UINT16_LIT: INT_LIT ['\''] ('u'|'U') '16';
UINT32_LIT: INT_LIT ['\''] ('u'|'U') '32';
UINT64_LIT: INT_LIT ['\''] ('u'|'U') '64';

EXPONENT: ('e' | 'E') ['+' | '-'] DIGIT ( ['_' DIGIT] )*;
FLOAT_LIT: UNARY_MINUS? DIGIT ( ['_'] DIGIT)* (('.' DIGIT (['_'] DIGIT) [EXPONENT]) | EXPONENT);

ID: LETTER ( LETTER | DIGIT|'_')*;
CHAR: '\\' ('0'..'9')+;

