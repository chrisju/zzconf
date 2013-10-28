#!/usr/bin/sh

# ###############
# backup
# ###############
echo -n "backup system? (yes/no): "
read answer
if [ "$answer" = "yes" ] 
then

sudo rsync -avAXP --delete-excluded --exclude-from=/mnt/DATA/soft/zzconfbak/exclude  / /mnt/DATA/soft/zzconfbak/system/ > /dev/null 2>/tmp/2
echo "system backup finished."
cat /tmp/2
fi

# dry run
#sudo rsync -avAXP --delete --exclude-from=/mnt/DATA/soft/zzconfbak/exclude  /

# ###############
# recover
# ###############
#sudo rsync -avAXP --delete --exclude-from=/mnt/DATA/soft/zzconfbak/exclude  /mnt/DATA/soft/zzconfbak/system/ / > /dev/null 2>/tmp/2

# dry run
#sudo rsync -avAXP --delete --exclude-from=/mnt/DATA/soft/zzconfbak/exclude  /mnt/DATA/soft/zzconfbak/system/ 

