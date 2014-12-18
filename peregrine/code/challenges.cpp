   // variables @x@ and @y@ are from input
   int a[10], b, *p;
   
   // thread t1           // thread t2
   lock(l1);                   
   p = &a[0];
   if(!x)              4: if(y)
1:     p = &a[1];             b++;      
   *p++;                  lock(l2);
   unlock(l1);         2: a[1] ++;
3: b++;                   unlock(l2);       
