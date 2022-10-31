## Understanding State Lock
Whenever you are performing write operation, terraform would lock the state file. This is very important as otherwise during your ongoing terraform apply operation, if others also try for the same, it can corrupt your state file. 

## Important note
- State locking happens automatically on all operations that could write state. You won't see any message that it's happening. 
- If state locking fails, Teffaform will not continue. 
- Not all backends support locking. The documentation for each backend includes details on wether it supports locking or not. 

## Force Unlocking State
- Terraform has a force-unlock command to munually unlock the state if unlocking failed.
- If you unlock the state when someone else is holding the lock it could cause multiple writers.
- Force unlock only be used to unlock your own lock in the situation where automatic unlocking failed. 
