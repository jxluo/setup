Instruction
================
### Generate key in ssh client:
```
/setup/ssh/gen_key.sh
```

### Copy pub key to a ssh server to avoid input pwd when ssh:
```
/setup/ssh/cp_key.sh root@1.2.3.4
```

### Copy pub key to multiple ssh server listed in a file:
```
/setup/ssh/cp_key_batch.sh server_list_file
```
