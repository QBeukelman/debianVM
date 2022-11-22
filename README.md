

# 42_born2beroot

You will create your first machine in VirtualBox (or UTM if you can’t use VirtualBox) under specific instructions. Then, at the end of this project, you will be able to set up your own operating system while implementing strict rules.

> For more information visit: [Codam.nl](https://www.codam.nl "Codam.nl") or [42 Cursus Subjects](https://github.com/Surfi89/42cursus/tree/main/Subject%20PDFs "42 Cursus Subjects")

<br />



## What is a Virtual Machine

### Virtual Machine

A virtual machine is a software capable of installing an operating system within itself, making the OS think that it is hosted on a real computer. They hypervisor is responsible for isolating the VM resources from the system hardware. Host is the device that provides the resources, to which different guest machines can be assigned. They hypervisor uses a part of the host machines CPU, memory, networking and storage,.. and distributes them among different VMs.

![Logo](https://taminhluan.github.io/images/the-linux-command-line-interface/subset-of--the-linux-single-directory-hierarchy.png)
> Image from: [The Linux Programming Interface, 2010 (Michael Kerrisk)](https://sciencesoftcode.files.wordpress.com/2018/12/the-linux-programming-interface-michael-kerrisk-1.pdf "The Linux Programming Interface, 2010 (Michael Kerrisk)")

<br />



### Benifits of using a Virtual Machine

- Run different operating systems on the same machine.
- An environment to safely test unstable programs, to see if they effect the system.
- Better use of shared resources.
- Reduce costs by reducing physical architecture.
- Easy to implement, are able to clone VM to another physical device.

<br />


### Use of Debian Linux

The term operating system is commonly used with two differet meanings:

- The entire package consisting of the central software managing the computers resources, and all accompanying standard software, e.g. graphics interfaces and command-line interpreters.

- More narrowly, the central software that manages and allocates computer resources, e.g. CPU, RAM, and devices.

The term kernel is often used as a synonym for the second meaning, and it is with this meaning of the term operating system that we are concerned. Among other things, the kernel performs the following tasks:

- Process scheduling
- Memory management
- Provision of a file system
- Creation an termination o a process
- Access to devices
- Networking
- Provision of a system call application programming interface (API)

<br />

### CentOS and Debian

CentOS is a community-driven free software effort focused around the goal of providing a rich base platform for open source communities to build upon. Where as, Debian, also known as Debian GNU/Linux, is a Linux distribution composed of free and open-source software, developed by the community-supported Debian Project, which was established by Ian Murdock on August 16, 1993.

Some differences are:

| CentOS       | Debian     |
| :---        | :---      |
| User friendly interface | Less user friendly with terminal interface |
| No multi-architecture support | Multi-architecture support |
| Updates take time, making it stable | Release cycle of 2 years |
| Dificult to upgrade | Easy to upgrade |
| Complicated GUI | User friendly GUI |
| YUM package manager | apt-get package manager |
| Limited packages | Large assortment of packages |

<br />
<br />



## Simple Checks

#### 1. Check that the UFW service is started

```bash
  sudo ufw status
```

#### 2. Check that the SSH service is started

```bash
  sudo service ssh status
```

#### 3. Check that the chosen OS is Debian

```bash
  uname -a
```

<br />
<br />



## Users

### What is a user

Each user on the system is uniquely identified, and users may belong to groups. Every user of the system has a unique login name (username) and a corresponding numeric user ID (UID). For each user, these are defined by a line in the system password file, `/etc/passwd`, which includes, **group ID**, **home directory** and **login shell**.

### Groups

For administrative purposes, in particular, for controlling access to files and other system resources, it is useful to organize users into group. 

> For example, the people in a team working on a single project, and thus sharing a common set of files, might all be made members of the same group. In early UNIX implementations, a user could be a member of only one group.

<br />
<br />

## What is a Virtual Machine

Include the following header to your `.c` file:

```bash
  make
```

```c
  #include "ft_libft.h"
```

## Testing

You can use this third party tester to measure the capability of the library:

- [Francinette](https://github.com/xicodomingues/francinette "Francinette")
