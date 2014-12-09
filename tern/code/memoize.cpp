  queue_t activeq, waitq[N];
  pthread_mutex_lock_wrapper(pthread_mutex_t *mutex) { 
   retry:
    while(self()!=activeq.head); // wait for our turn
    if(!phtread_mutex_trylock(mutex)) { // mutex acquired 
      append(schedule, self()); // add tid to schedule
      move(self(), activeq.tail); // give turn to next thread
      return;
	}
	move(self(), waitq[mutex].tail); // deterministically wait
	goto retry; // wait for our turn again
  }
  pthread_mutex_unlock_wrapper(pthread_mutex_t *mutex) {
	while(self()!=activeq.head); // wait for our turn
	pthread_mutex_unlock(mutex); // mutex released
	wake_up(waitq[mutex].head); // deterministically wake up
	append(schedule, self()); // add tid to schedule
	move(self(), activeq.tail); // give turn to next thread
  }
