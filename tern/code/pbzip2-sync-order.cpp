// main                 // worker 1          // worker 2
4: pthread_create(worker);
4: pthread_create(worker);
6: worklist.add();
                    12: worklist.get();
6: worklist.add();
                                        12: worklist.get();
8: worklist.clear();
