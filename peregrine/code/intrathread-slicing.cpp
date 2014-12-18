slice(trace) {
   cur = remove tail from trace

   if(cur is phi) {
      if(value of cur in live) {
         take cur
         find immediate predecessor of cur  that is executed
         take operand of cur corresponding to this predecessor
         remove cur from live
      }
   } else if(cur is non-mem instruction) {
      if(value of cur in live) {
          take cur
          add operands of cur to live
          remove cur from live
      }
   } else if(cur is load) {
      if (value of cur is in live || cur is already taken in inter-thread step) {
          take cur
          add pointer operand of cur to live
      }
   } else if(cur is store) {
      if (cur is already taken in inter-thread step) {
          take cur
          // note: don't add value since we only need to fix memory
          // address to avoid race
          add pointer operand of cur to live
      }
      for each load in live {
         if (pointer operand of cur == pointer operand of load) {
             take cur if it is not taken yet
             // below code corresponds to updatebetween in bouncer
             if(both are concrete) {
                // this removal is safe since the control dependencies for
                // cur and load are fixed by taking them into the slice
                remove load from live
             } else {
                // Also possible: can leave the load in live without
                // adding constraints
                add constraints to make the two pointer operands equal
                remove load from live
             }
             add value and pointer operand of cur to live
         } else if(pointer operand of cur may alias operand of load) {
             take cur if it is not taken yet
             add value and pointer operand of cur to live
             // bouncer has an additional optimization: if cur is
             // determined by concrete values in live, don't take it.
             // since next run, the concrete values in live will get the
             // same value, so cur will get the same pointer operand value
         }
      }
   } else if(cur is branch) {
     if(!postdominate(slice.head, cur)
        || writtenbetween(cur, slice.head)
        || syncbetween(cur, slice.head)) {
      }
   } else if(cur is ret) {
     call = trace.findcall(cur);
     if(maywriteF(calledFunc(call), live)
       || maysync(calledFunc(call))) {
       take cur
     } else
       jump to call
   } else if(cur is call) {
     take cur
     take arg setup
   }
}

maywriteF(function, live) {
   for each store reachable from function {
      for each load in live {
          if pointer operand of load may alias pointer operand of store
              return true;
      }
   }
   return false;
}

writtenbetween(cur, head) {
  postdom = postdominator of (cur.true, cur.false)
  for each store in [cur, postdom]
     if pointer operand of load may alias pointer operand of store
        return true;
  for each value in liveset
     if value is defined in [cur, postdom]
        return true;
  return false;
}
