#!/bin/bash

echo "Sample log file archiver script :)"
echo "==================================================================================="
echo "Copying log files from log folder....."
echo "==================================================================================="
mkdir ~/log_files
sudo find /var/log -name '*.log' -exec cp {} --parents -v ~/log_files \;
echo "==================================================================================="
echo "Log files copied to log_files folder"
echo "==================================================================================="
echo "Changing file permissions....."
echo "==================================================================================="
sudo find ~/log_files/ -type d -exec sudo chmod 777 {} +
sudo find ~/log_files/var/log -type f -exec sudo chmod -v 644 {} +
echo "==================================================================================="
echo "Calculalating line count and file sizes...."
echo "==================================================================================="
echo "Line Count Summary" >> ~/log_files/log_summary.txt
echo "===================================================================================" >> ~/log_files/log_summary.txt
sudo find ~/log_files/var/log -name '*.log' | xargs wc -l >> ~/log_files/log_summary.txt
echo "===================================================================================" >> ~/log_files/log_summary.txt
echo "File Size Summary" >> ~/log_files/log_summary.txt
echo "===================================================================================" >> ~/log_files/log_summary.txt
sudo find ~/log_files/var/log -name '*.log' | xargs ls -sh >> ~/log_files/log_summary.txt
echo "===================================================================================" >> ~/log_files/log_summary.txt
echo "Archiving files to /opt/log_files_`date +%Y%m%d`" 
echo "==================================================================================="
(cd ~/ && sudo zip -r -v /opt/log_files-`date +%Y%m%d`.zip log_files )
sudo chmod 555 /opt/log_files-`date +%Y%m%d`.zip 
echo "==================================================================================="
echo "Archive process complete"
echo "Have a nice day :)"


