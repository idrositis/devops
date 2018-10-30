# Note - `tar`

Notes on the `tar` Linux/Unix command:

  - [Directory-Structure Only](#1-directory-structure-only)
  - [References](#2-references)

## 1. Directory-Structure Only

To only include the directory structure in your `tar` file, you can perform the below command:

~~~
$ find my_dir -type d -print0 | tar cf my_dir_structure_only.tar --null --no-recursion --files-from -

$ tar tvf my_dir_structure_only.tar
drwxrws--- mule/mule         0 2018-07-12 11:13 my_dir/
drwxrws--- mule/mule         0 2018-07-12 11:13 my_dir/archive/
drwxrws--- mule/mule         0 2018-10-30 14:54 my_dir/archive/MDM/
drwxrws--- mule/mule         0 2018-10-22 17:20 my_dir/archive/MDM/EU_NCA/
drwxrws--- mule/mule         0 2018-10-08 11:28 my_dir/archive/MDM/IS_NCA/
drwxrws--- mule/mule         0 2018-10-23 11:05 my_dir/archive/MDM/IS_NCA/
drwxrws--- mule/mule         0 2018-10-30 11:25 my_dir/archive/MDM/BG_NCA/
drwxrws--- mule/mule         0 2018-07-12 11:13 my_dir/input/
drwxrws--- mule/mule         0 2018-10-30 14:54 my_dir/input/CPR/
drwxrws--- mule/mule         0 2018-10-30 14:54 my_dir/input/CPR/DE_NCA/
drwxrws--- mule/mule         0 2018-10-24 14:07 my_dir/input/CPR/SE_NCA/
drwxrws--- mule/mule         0 2018-10-29 22:37 my_dir/input/CPR/PT_NCA/
drwxrws--- mule/mule         0 2018-10-29 22:49 my_dir/input/CPR/CZ_NCA/
.
.
.
~~~


## 2. References

  - [TAR Only the Directory Structure](https://stackoverflow.com/questions/12057925/tar-only-the-directory-structure)
