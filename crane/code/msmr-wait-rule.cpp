wait_global_turn() {
  ...; /* Wait until current thread is the head of the run queue. Omitted (in Parrot). */

  /* Starting from this point, current thread is head of the Parrot run queue,
  and it's free (and the only one thread) to manipulate the run queue. */
  if (Current thread doing a socket operation, or
        there are threads waiting for socket operations in the wait queue) {

    /* This busy wait is the key of synchronizing the Paxos queue with the run queue. */
    busy wait until (Paxos queue is not empty, or n_conn is 0);

    if (Paxos queue is not empty) {
      Dequeue the first operation OP from the Paxos queue, and execute it on device;
      if (Current thread is not the receiver of this OP) {
        /* Wake up the right thread to handle this socket operation. */
        Find the corresponding server thread T of OP from the wait queue;
        Put T at the head of the run queue;

        /* Put myself to wait queue. */
        Put current thread to wait queue;
        return;
    }
  }

  ...; /* Do the actual operation. E.g., lock or recv. */
}
