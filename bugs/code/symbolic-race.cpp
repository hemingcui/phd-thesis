// T1       // T2
lock(l1);
a[i]++;     lock(l2);
            a[j]--;
unlock(l1);  
            unlock(l2);
       
