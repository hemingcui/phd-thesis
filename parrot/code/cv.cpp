int wrap_cond_wait(pthread_cond_t *cv,pthread_mutex_t *mu){
  scheduler.get_turn();
  pthread_mutex_unlock(mu);
  scheduler.signal(mu);
  scheduler.wait(cv, 0);
  while(pthread_mutex_trylock(mu))
    scheduler.wait(mu, 0);
  scheduler.put_turn();
  return 0; /* error handling is omitted for clarity. */
}
