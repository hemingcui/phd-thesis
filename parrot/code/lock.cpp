int wrap_mutex_lock(pthread_mutex_t *mu){
  scheduler.get_turn();
  while(pthread_mutex_trylock(mu))
    scheduler.wait(mu, 0);
  scheduler.put_turn();
  return 0; /* error handling is omitted for clarity. */
}
int wrap_mutex_unlock(pthread_mutex_t *mu){
  scheduler.get_turn();
  pthread_mutex_unlock(mu);
  scheduler.signal(mu);
  scheduler.put_turn();
  return 0; /* error handling is omitted for clarity. */
}
