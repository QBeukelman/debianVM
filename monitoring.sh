
#!/bin/bash

# Architecture
architecture=$(uname -a)

# Physical CPU
cpu_physical=$(cat /proc/cpuinfo | grep processor | wc -l)

# vCPU
vcpu=$(cat /proc/cpuinfo | grep processor | wc -l)

# Memory Used
free_ram=$(free -m | awk '$1 == "Mem:" {print $2}')
used_ram=$(free -m | awk '$1 == "Mem:" {print $3}')
ram_percent=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

# Disc Usage
disc_usage=$(df -h | awk '$NF=="/"{printf("%d/%dGB (%s)"), $3,$2,$5}')

# CPU Load
cpu_load=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')

# Last Boot
last_boot=$(who -b | awk '{print $3" "$4" "$5}')

# LVM Use
lvm_count=$(lsblk | grep "lvm" | wc -l)
is_lvm=$(if [ $lvm_count -eq 0 ]; then echo no; else echo yes; fi)

# Connections TCP
connections_tcp=$(netstat -an | grep ESTABLISHED | wc -l)

# User Log
user_log=$(who | cut -d " " -f1 | sort -u | wc -l)

# Network
ip_address=$(hostname -I)
network=$(ip link show | awk '$1 == "link/ether" {print $2}')

# Sudo
sudo_cmds=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

# Broadcast message
wall "  #Architecture: $architecture
        #CPU Physical: $cpu_physical
        #vCPU: $vcpu
        #Memory Used: $used_ram/${free_ram}MB ($ram_percent%)
        #Disc Usage: $disc_usage
        #CPU Load: $cpu_load
        #Last Boot: $last_boot
        #LVM Use: $is_lvm
        #Connections TCP: $connections_tcp
        #User Log: $user_log
        #Network: IP $ip_address ($network)
        #Sudo: $sudo_cmds cmd"
