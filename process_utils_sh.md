# Process Utils
## Kill all tasks with a specific NAME and USER
```sh
top -u $USER -b -n1 | \grep $NAME | awk '{print $1}' | xargs -I{} kill -9 {}
```

