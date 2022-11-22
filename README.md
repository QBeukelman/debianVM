

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

### What is a user group

For administrative purposes, in particular, for controlling access to files and other system resources, it is useful to organize users into group. 

> e.g. the people in a team working on a single project, and thus sharing a common set of files, might all be made members of the same group. In early UNIX implementations, a user could be a member of only one group.

<br />

#### 1. Check user with “intra” name is present and belongs to "sudo” and “user42” groups

```bash
  getent group | grep qbeukelm
```

#### 2. Create new user

```bash
  # Add user
  sudo adduser username
  # Verify password expiry info
  sudo chage -l username
```

#### 3. Check password policy

```bash
  # Password expiration policy
  cat /etc/login.defs
  # Password strength
  cat /etc/pam.d/common-password
```

#### 4. Create new group and assign user to it

```bash
  # Create group
  getent group group_name
  # Add user to group
  sudo adduser username group_name
  # Verify
  getent group | grep username
```

#### 5. Benifits of strong password policy

Passwords provide the first line of defense against unauthorized access to your computer and personal information. The stronger your password, the more protected your computer will be from hackers and malicious software.

<br />
<br />


## Hostname and Partitions

#### 1. Check that the host name is correctly formatted

```bash
  sudo cat /etc/hostname
```

#### 2. Modify hostname

```bash
  # Update hostname
  sudo nano /etc/hostname
  # Reboot
  sudo reboot
```

#### 3. View partitions on Virtual Machine

```bash
  lsblk
```
```bash
  # lsblk output
  NAME                        MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
  sda                           8:0    0    8G  0 disk  
  |-sda1                        8:1    0  487M  0 part  /boot
  |-sda2                        8:2    0    1K  0 part  
  `-sda5                        8:5    0  7.5G  0 part  
    `-sda5_crypt              254:0    0  7.5G  0 crypt 
      |-username42--vg-root   254:1    0  2.8G  0 lvm   /
      |-username42--vg-swap_1 254:2    0  976M  0 lvm   [SWAP]
      `-username42--vg-home   254:3    0  3.8G  0 lvm   /home
  sr0                          11:0    1 1024M  0 rom  
```
<br />


### What is LVM (Logical Volume Manager)

Is an abstraction layer between a storage device and file system. The main advantage is that LVM has more flexibility when it comes to managing partitions. 

> e.g. Suppose we create four partitions on our disc. If we wish to expand the storage of the first three, we will not be able to because there is no space available next to them.

With LVM, we can extend the storage of any position (A Logical Volume). This is done by using available storage located on a different physical disc (which can not be done with regular partitions). It is also possible to move logical volumes between different physical devices.

- **Physical Volume (PV)**: physical storage device, hard disc, SD card, floppy,… which provides the storage available for use.
- **Volume Group (VG)**: to use this space, it must be allocated in a volume group. It is like a virtual storage disc that will be used by Logical Volumes.
- **Logical Volume (LV)**: devices used to create file systems, swaps, virtual machines,… If the VG is the storage disc, the LV are the partitions made on the disc.

<br />
<br />


## Sudo

### What is sudo

Sudo (**s**ubstitute **u**ser, **do**) is a program for Unix-like computer operating systems that allows a system administrator to give certain users (or groups of users) the ability to run some (or all) commands as root while logging all commands and arguments. Sudo operates on a per-command basis, it is not a replacement for the shell. Its features include:

- Restrict what commands a user may run on a per-host basis.
- Logging of each command, providing a clear audit trail of who did what.
- Sudo uses timestamp files to implement a “ticketing” system. When a user invokes sudo and enters their password, they are granted a ticket for 5 minutes. This avoids the problem of leaving a root shell where others can physically get to your keyboard.
- Sudo’s configuration file, the `sudoers` file, is setup in such a way that the same sudoers file may be used on many machines. This allows for central administration while keeping the flexibility to define a user’s privileges on a per-host basis.

<br />

#### 1. Check that the “sudo” program is installed and add the new user to it

```bash
  # Verify sudo version
  sudo --version
  # Add user to group
  sudo adduser username group_name
```

#### 2. Verify sudo configuration

What is `tty`? The requiretty option means that the exploit code won't be able to directly upgrade its privileges by running sudo.

```bash
  # Check members of sudo group
  getent group sudo
  # show sudo confiuration
  sudo cat /etc/sudoers
```

#### 3. Verify sudo logs

```bash
  # Navigate to sudo directory
  cd /var/log/sudo
  # Update sudo
  sudo apt update
  # Check sudo logs
  cat sudo.log
```

<br />
<br />



## UFW

### What is UFW

UFW (Uncomplicated Firewall) is a software application responsible for ensuring that the system administrator can manage the IP-table in a simple way. Since it is very difficult to work with IPtables, UFW provides is with an interface to modify the firewall of our device (netfilter) without compromising security. We can choose which ports to make available and which to close, greatly improving all security related communication between devices.

#### 1. Check that UFW program has been installed and is functioning correctly

```bash
  # Verify UFW installation
  ufw --version
  # Check status
  sudo ufw status
```

#### 2. List the active rules in UFW

```bash
  # Active sudo rules
  sudo ufw status numbered
```

#### 3. Adding and removing ports

```bash
  # Open new port
  sudo ufw allow ####
  # Remove port
  sudo ufw delete (number, e.g. 5 or 6)
```

<br />
<br />



## Monitoring Script

### What is Crontab

There are two commands that will be very helpful in case of being system administrator, which are:

- **Cron:** Linux task manager that allows us to excite commands at a specific time. We can automate some tasks, simply by telling corn what command to run when. E.g. we want to restart the server every day at 04:00.
- **Wall:** Can be used by the root user to send a message to all users currently connected to the server. If the system administrator wants to alert about major changes in the server, that could cause users to log out, the root user can alert them with wall.

<br />


#### 1. Explain monitoring.sh

```bash
  # Nevigate to monitoring.sh
  cd /usr/local/bin/
  # Edit monitoring.sh
  nano monitoring.sh
  # Execute script
  ./monitoring.sh
```

#### 2. Monitoring script excicute every 10 minutes

```bash
  # Open Crontab configuration
  sudo crontab -u root -e
```

#### 3. Make the script runs every 30s without editing it

```bash
  # Open Crontab configuration
  sudo crontab -e
```

Remove or commit previous cron "schedule" and add next lines in crontab file:

```bash
  # Run script
  */1 * * * * /usr/local/bin/monitoring.sh
  # Wait 30s and run script
  */1 * * * * sleep 30s && /usr/local/bin/monitoring.sh
```

To stop script running on boot you just need to remove or commit the following line in `crontab` file.

```bash
  @reboot /usr/local/bin/monitoring.sh
```

<br />
