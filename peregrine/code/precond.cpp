if(x == 0) {   // statement 1
  q = foo();   // not-taken branch
  *q = 0;
}
if(*p) // may p and q alias?
  slicing_target; // statement 2
