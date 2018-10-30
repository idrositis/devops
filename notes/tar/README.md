# Note - `tar`

Notes on the `tar` Linux/Unix command:

  - [Directory-Structure Only](#1-directory-structure-only)
  - [References](#2-references)

## 1. Directory-Structure Only

To only include the directory structure in your `tar` file, you can perform the below command:

~~~
$ find my_dir. -type d -print0 | tar cf my_dir_structure_only.tar --null --no-recursion --files-from -
~~~


## 2. References

  - [TAR Only the Directory Structure](https://stackoverflow.com/questions/12057925/tar-only-the-directory-structure)
