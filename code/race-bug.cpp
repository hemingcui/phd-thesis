// thread 1          // thread 2            
// deposit 100       // withdraw 100
t = balance + 100;
                     balance = balance - 100;
balance = t;
