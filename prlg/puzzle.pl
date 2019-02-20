word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

crossword((V1, L1, L5, L11, L15, L21, L25, L31), (V2, L2, L7, L12, L17, L22, L27, L32), (V3, L3, L9, L13, L19, L23, L29, L33)
, (H1, L4, L5, L6, L7, L8, L9, L10), (H2, L14, L15, L16, L17, L18, L19, L20), (H3, L24, L25, L26, L27, L28, L29, L30)) :-
  word(V1, L1, L5, L11, L15, L21, L25, L31),
  word(V2, L2, L7, L12, L17, L22, L27, L32),
  word(V3, L3, L9, L13, L19, L23, L29, L33),
  word(H1, L4, L5, L6, L7, L8, L9, L10),
  word(H2, L14, L15, L16, L17, L18, L19, L20),
  word(H3, L24, L25, L26, L27, L28, L29, L30).