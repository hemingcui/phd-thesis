// thread 1     // thread 2
lock(l);        lock(l);
*p = ...;       p = NULL;
unlock(l);      unlock(l);
