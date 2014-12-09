  pthread_mutex_lock_wrapper(mutex) {
    down(sem[self()]); // wait for our turn
    pthread_mutex_lock(mutex);
    next = shift schedule; // find next thread in schedule
    up(sem[next]); // wake up next thread
  }
