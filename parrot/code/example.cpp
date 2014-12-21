int main(int argc, char *argv[]) {
  ...
  soba_init(nthreads); /* performance hint */
  for (i = 0; i < nthreads; ++i)
    pthread_create(..., NULL, consumer, NULL);
  for (i = 0; i < nblocks; ++i) {
    char *block = read_block(i);
    pthread_mutex_lock(&mu);
    enqueue(q, block);
    pthread_cond_signal(&cv);
    pthread_mutex_unlock(&mu);
  }
  ...
}
void *consumer(void *arg) {
  while(1) {
    pthread_mutex_lock(&mu);
    while (empty(q)) // termination logic elided for clarity
      pthread_cond_wait(&cv, &mu);
    char *block = dequeue(q);
    pthread_mutex_unlock(&mu);
    ...
    soba_wait(); /* performance hint */
    compress(block);
  }
}
