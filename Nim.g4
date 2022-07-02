grammar Nim;

start: INT_LIT;

TAB: '\u0009';
F: '\u000A';
VTAB: '\u000B';
FF: '\u000C';
CR: '\u000D';
BACKSLASH: '\\';
QUOTE: '"';
APOS: '\u0027';

LETTER: 'A'..'Z' | 'a'..'z' | '\u0080'..'\u00FF';
DIGIT: '0'..'9';
HEXDIGIT: DIGIT | 'A'..'F' | 'a'..'f';
OCTDIGIT: '0'..'7';
BINDIGIT: '0'|'1';
UNARY_MINUS: '-';
HEX_LIT: UNARY_MINUS? '0' ('x'|'X') HEXDIGIT ('_' | HEXDIGIT)*;
DEC_LIT: UNARY_MINUS? DIGIT ('_' | DIGIT)*;
OCT_LIT: UNARY_MINUS? '0' 'o' OCTDIGIT ('_' | OCTDIGIT)*;
BIN_LIT: UNARY_MINUS? '0' ('b'|'B') BINDIGIT ('_' | BINDIGIT)*;

INT_LIT: HEX_LIT
       | DEC_LIT
       | OCT_LIT
       | BIN_LIT
       ;

INT8_LIT: INT_LIT APOS? ('i'|'I') '8';
INT16_LIT: INT_LIT APOS? ('i'|'I') '16';
INT32_LIT: INT_LIT APOS? ('i'|'I') '32';
INT64_LIT: INT_LIT APOS? ('i'|'I') '64';

UINT_LIT: INT_LIT APOS? ('u'|'U');
UINT8_LIT: INT_LIT APOS? ('u'|'U') '8';
UINT16_LIT: INT_LIT APOS? ('u'|'U') '16';
UINT32_LIT: INT_LIT APOS? ('u'|'U') '32';
UINT64_LIT: INT_LIT APOS? ('u'|'U') '64';

EXPONENT: ('e' | 'E') ('+' | '-')? DIGIT ( '_' | DIGIT )*;
FLOAT_LIT: UNARY_MINUS? DIGIT ('_' | DIGIT)* (('.' DIGIT ('_' | DIGIT) EXPONENT?) | EXPONENT);
FLOAT32_SUFFIX: ('f' | 'F') '32'?;
FLOAT32_LIT: HEX_LIT '\'' FLOAT32_SUFFIX
           | (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) '\''? FLOAT32_SUFFIX;
FLOAT64_SUFFIX: (('f' | 'F') '64' ) | 'd' | 'D';
FLOAT64_LIT: HEX_LIT '\'' FLOAT64_SUFFIX
           | (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) '\''? FLOAT64_SUFFIX;

CUSTOM_NUMERIC_LIT: (FLOAT_LIT | INT_LIT) '\'' CUSTOM_NUMERIC_SUFFIX

ID: LETTER ( LETTER | DIGIT|'_')*;
CHAR: '\\' ('0'..'9')+;

