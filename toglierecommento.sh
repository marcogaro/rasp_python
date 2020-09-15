sub=user_allow_other; 
sudo sed -i "/^#$sub/ c$sub" /usr/local/etc/fuse.conf

#cp /usr/local/etc/fuse.conf /tmp/fuse.conf
#sed -i "/^#$sub/ c$sub" /tmp/fuse.conf
#cp /tmp/fuse.conf /usr/local/etc/fuse.conf
