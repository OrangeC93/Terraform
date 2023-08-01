## Overview of Debugging Terraform
Terraform has detailed logs which can be ena led by setting the TF_LOG environment variable to any value. You can set TF_LOG to one of the log level TRACE, DEBUG, INFO, WARN or ERROR to change the verbosity of the logs

## Important Pointers
TRACE is the most verbose and it's the default if TF_LOG is set to something other than a log level name. To persist logged output you can set TF_LOG_PATH in order to force the log to alwasy be appended to a specific file when logging is enabled. 
## This snippet is from the Debugging Terraform video.

```sh
export TF_LOG_PATH=/tmp/crash.log # no longer see it in screen
export TF_LOG=TRACE # output in the screen
```
