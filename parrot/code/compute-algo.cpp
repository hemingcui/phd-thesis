void soba_init(int group_size, void *key, int timeout) {
  scheduler.get_turn();
  soba_set[key] = new soba;
  soba &bar = *soba_set[key];
  bar.group_size = group_size;
  bar.timeout = timeout;
  bar.nactive = 0;
  bar.phase = ARRIVE;
  scheduler.put_turn();
}
void soba_wait(void *key) {
  scheduler.get_turn();
  soba &bar = *soba_set[key];
  bar.nactive++;
  if(bar.nactive==bar.group_size){
    if(bar.phase==ARRIVE){
      bar.phase = LEAVE;         // success, wakeup all.
      scheduler.broadcast((void*)&bar);
    }
  }else{
    if(bar.phase==ARRIVE){
      wait((void*)&bar, bar.timeout);
      if(bar.phase==ARRIVE && bar.nactive<bar.group_size){
        bar.phase = LEAVE;       // handle timeout.
        scheduler.broadcast((void*)&bar);
      }
    }
  }
  bar.nactive--;
  if(bar.phase==LEAVE && bar.nactive==0)
    bar.phase = ARRIVE;
  scheduler.put_turn();
}
