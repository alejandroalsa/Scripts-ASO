#!/bin/bash
clear

#---->Explicación 25
exec &> >(tee -a /path/to/logfile_backup.log)

#---->Explicación 26
cat /etc/passwd | awk -F: '($3 > 999) {print $1}' | grep -v "^root$" | while read user; do
  usermod -L $user
done

#---->Explicación 27
runlevel=$(runlevel | awk '{print $2}')
if [ $runlevel != "1" ]; then
  init 1
fi

#---->Explicación 28
fecha=$(date +%Y%m%d_%H%M%S)
backup_dir="/backup"
mkdir -p $backup_dir
cat /etc/passwd | awk -F: '($3 > 999) {print $1}' | while read user; do
  home_dir=$(eval echo ~$user)
  if [ -d "$home_dir" ]; then
    zip_file="$backup_dir/bk_$user_$fecha.zip"
    zip -r $zip_file $home_dir
  fi
done

#---->Explicación 29
cat /etc/passwd | awk -F: '($3 > 999) {print $1}' | grep -v "^root$" | while read user; do
  usermod -U $user
done

reboot
