#include <stdio.h>
#include <assert.h>
#include <malloc.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>

#define MAX_THREADS (100)
pthread_barrier_t barrier;
pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
pthread_t threads[MAX_THREADS];
void* worker(void *arg);

char data[100];
int size; // size of @data@
int nthread; // total number of threads
unsigned long result = 0;

int main(int argc, char *argv[]) {
  nthread = atoi(argv[1]);
  size = atoi(argv[2]);
  assert(nthread>0 && size>=nthread);
  pthread_barrier_init(&barrier, NULL, nthread);
  for(long i=1; i<nthread;++i)
    pthread_create(&threads[i], NULL, worker, (void*)i);
  worker(0); // participate in computation
  // missing @pthread_join()@
  if(atoi(argv[3]) == 1)
    result += 10; // race with line 15
  printf("result = %lu\n", result);
  return 0;
}
void* worker(void *arg) {
  int start = size/nthread * (long)arg;
  int end = size/nthread * ((long)arg+1);
  printf("start=%d, end=%d\n", start, end);
  for(int i=start; i<=end; ++i)
    data[i] = data[i] * 50; // race with line 8 and 9
  pthread_mutex_lock(&m);
  result += 10000;
  pthread_mutex_unlock(&m);
}
int atoi(const char *str) {
  int number = 0, i = 0;
  for(i=0; str[i]>='0'&&str[i]<='9'; ++i)
    number = number * 10 + (str[i]-'0');
  return number;
}
