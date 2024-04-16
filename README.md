# The Vex Programming Language

A language designed to be minimal, expressive, elegant.

## Example

```rb
--
-- simple example to showcase *some* features
--

-- import the IO module
require std'io
-- libc bindings
require libc 

const Name = "vex"

def main(argc, argv)
    io'println("Hello, World!")

    my_var = "This is my variable, dont touch it!"

    libc'printf("My name is %s", Name)

    my_var = "I touched it ;D"

    for arg in argv
        io'println(arg)
    end

    if argc >= 69 
        return 420
    end

    return 0
end
```

__note: the syntax may change__

## Planned "big" features

* [ ] powerful macros
* [ ] hopefully simple generics
* [ ] compile-time things


