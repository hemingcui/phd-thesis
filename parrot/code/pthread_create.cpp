static int tid __thread; // logical thread ID
static void* (*user_func)(void*) __thread;
static void* wrap_thread_func(void *arg) {
  sem_wait(&create_sem);
  tid = scheduler.tidmap[pthread_self()];
  sem_post(&done_sem);
  return user_func(arg); // call user-provided thread function
}
int wrap_thread_create(pthread_t *th, pthread_attr_t *attr,
  void *(*func)(void*), void *arg) {
  scheduler.get_turn();
  user_func = func; // remember user-provided thread function
  pthread_create(th, attr, wrap_thread_func, arg);
  scheduler.tidmap[*th] = scheduler.next_tid ++;
  scheduler.runq.append(scheduler.tidmap[*th]);
  sem_post(&create_sem);
  sem_wait(&done_sem);
  scheduler.put_turn();
  return 0;
}
