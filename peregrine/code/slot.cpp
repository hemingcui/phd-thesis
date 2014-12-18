void slot(int sid) { // @sid@ is static instruction id
  if(instruction sid is branch)
    nbr[self()] ++; // increment per-thread branch counter
  // get semaphore operations for current thread at instruction @sid@
  my_actions = actions[sid][self()];
  for action in my_actions
    if nbr[self()] == action.nbr // check branch counter
      actions.do(); // perform @up()@ or @down()@
}
