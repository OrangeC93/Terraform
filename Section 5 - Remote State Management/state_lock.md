## Understanding State Lock
Whenever you are performing write operation, terraform would lock the state file. This is very important as otherwise during your ongoing terraform apply operation, if others also try for the same, it can corrupt your state file. 
