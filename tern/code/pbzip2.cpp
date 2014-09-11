  main(int argc, char *argv[]) {
    int i, nthread = atoi(argv[1]);
    for(i=0; i<nthread; ++i)
      pthread_create(worker); // create worker threads
    for(i=0; i<nthread; ++i)
      worklist.add(read_block(i)); // add block to work list
    // Error: missing @pthread_join()@ operations
    worklist.clear(); // clear work list
    ...
  }
  worker() { // worker threads for compressing file blocks
    block = worklist.get(); // get a file block from work list
    compress(block);
  }
  compress(block_t block) {
    if(block.data[0] == block.data[1])
      ...
  }
