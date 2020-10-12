# Reverse engineering and debugging
## hexdump
Generate 1k of random data and dump the actual hex of the file to cout. Add ```-c``` to show character representation.
```sh
hexdump -n 1k -e '"%08x%08x\n"' /dev/urandom
```
## xxd
Like hexdump. converts a file to hex. Add -r to reverse binary to a file.
```sh
xxd data.bin | xxd -r > data2.bin
```

## file:
Shows the file type. Useful when the file has no format.
```sh
file data.bin
```

## strings:
Shows all printable strings in a file
```sh
strings data.bin
```
