lock(); // in schedule
if(...) 
  pthread_create(); // not in schedule
unlock(); // in schedule
