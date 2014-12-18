int *matrix = NULL;
int size; // size of @matrix@
int nthread; // total number of threads
unsigned long finishtime = 0;

void main(int argc, char *argv[]) {
    nthread = atoi(argv[1]);
    size = atoi(argv[2]);
    matrix = (int*)malloc(size*sizeof(int));
    ... // initialize @matrix
    pthread_create(..., SlaveStart1, (void*)1);
    SlaveStart0(0);
    // NOTE: missing @pthread_join()@
    printf("finish time: %lu\n", finishtime);
}

void* SlaveStart0(void *arg) {
    int *upriv = (int*)malloc(...); // temp buffer
    int start = 0;
    int end = size/nthread;
    for(int i=start; i<=end; ++i) {
        // compute using @upriv@ and @matrix@
        upriv[...] = matrix[i] ...;
        matrix[i] = ...;
    }
    pthread_barrier_wait(...);
    finishtime = ...;
}

void* SlaveStart1(void *arg) {
    int *upriv = (int*)malloc(...); // temp buffer
    int start = size/nthread;
    int end = size/nthread * 2;
    for(int i=start; i<=end; ++i) {
        // compute using @upriv@ and @matrix@
        upriv[...] = matrix[i] ...;
        matrix[i] = ...;
    }
    pthread_barrier_wait(...);
    finishtime = ...;
}
