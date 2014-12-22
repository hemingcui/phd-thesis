// detect input-dependent races, and add involved dynamic instruction instances to @slicing_targets@
// used by the inter-thread step. @r1@ and @r2@ are two concurrent regions
void detect_input_dependent_races(r1, r2) {
  for (i1, i2) in (r1, r2) { // iterate through all instruction pairs in r1, r2
    if (neither i1 nor i2 is a branch instruction) {
      if(mayrace(i1, i2))
        { slicing_targets.add(i1); slicing_targets.add(i2); } // add @i1@ and @i2@ to slicing targets
    } else if (exactly one of i1, i2 is a branch instruction) {
      br = branch instruction in i1, i2;
      inst = the other instruction in i1, i2;
      nottaken = the not taken branch of br in the execution trace;
      if(mayrace_br(br, nottaken, inst)) {
        taken = the taken branch of br in trace; // add the taken branch of @br@ to slicing targets
        slicing_targets.add_br(br, taken);
      }
    } else { // both @i1@, @i2@ are branches
      nottaken1 = the not taken branch of i1 in trace;
      nottaken2 = the not taken branch of i2 in trace;
      if(mayrace_br_br(i1, nottaken1, i2, nottaken2) {
        taken1 = the taken branch of i1 in trace;
        slicing_targets.add_br(i1, taken1);
      }
    }
  }
}
bool mayrace(i1, i2) { return mayalias(i1, i2) && ((i1 is a store) || (i2 is a store)); }
bool mayrace_br(br, nottaken, inst) { // return true if the not-taken branch of @br@ may race with @inst@
  for i in (instructions in the nottaken branch of br)
    if(mayrace(i, inst)) return true;
  return false; }
// return true if the not-taken branch of @br1@ may race with the not-taken branch of @br2@
bool mayrace_br_br(br1, nottaken1, br2, nottaken2) {
  for inst in (instructions in the nottaken2 branch of br2)
    if(mayrace_br(br1, nottaken1, inst)) return true;
  return false; }
