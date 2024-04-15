# The Vex Programming Language

A language designed to be minimal, expressive, elegant.

## Example

```
-- simple example to showcase *some* features
with std\io

const main = {argc, argv
    io\println("Hello, World!");

    for arg in argv {
        io\println(arg);
    };

    if argc >= 69 {
        return 420;
    };

    return 0;
}
```

__note: the example might change__

## Planned "big" features

* [ ] powerful macros
* [ ] hopefully simple generics
* [ ] compile-time things


