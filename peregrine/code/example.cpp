     int size; // total size of data
     int nthread; // total number of threads
     unsigned long result = 0;

     int main(int argc, char *argv[]) {
 L1:     nthread = atoi(argv[1]);
 L2:     size = atoi(argv[2]);
 L3:     assert(nthread>0 && size>=nthread);
 L4:     for(int i=1; i<nthread; ++i)
 L5:         pthread_create(..., worker, NULL);
 L6:     worker(NULL);
        // NOTE: missing @pthread_join()@
 L7:     if(atoi(argv[3]) == 1)
 L8:         result += ...; // race with line @L15@
 L9:     printf("result = %lu\n", result); // race with line @L15@
         ...
     }
     void *worker(void *arg) {
L10:     char *data = malloc(size/nthread);
L11:     read(..., data, size/nthread);
L12:     for(int i=0; i<size/nthread; ++i)
L13:         data[i] = ...; // compute using @data@
L14:     pthread_mutex_lock(&mutex);
L15:     result += ...; // race with lines @L8@ and @L9@
L16:     pthread_mutex_unlock(&mutex);
         ...
     }
