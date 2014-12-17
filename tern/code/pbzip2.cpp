  main(int argc, char *argv[]) {
    int i, nthread = argv[1], nblock = argv[2];
    symbolic(&nthread, sizeof(int)); // mark input data 
    symbolic(&nblock, sizeof(int)); // that affects schedules
    for(i=0; i<nthread; ++i)
  	  pthread_create(worker); // create worker threads
    for(i=0; i<nblock; ++i) {
      block = read_block(i); // read i'th file block
      worklist.add(block); // add block to work list
    }
  }
  worker() { // worker threads for compressing file blocks
    for(;;) {
      block = worklist.get(); // get a file block from work list
      compress(block);
    }
  }
