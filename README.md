# elementaryinstall
Some scripts and options for elementary install

for Lenovo Z51-70

- Fix for WIFI  :

After install Linux Image 4.0.0,Reboot

After that Extract Both Backports and Ath10k modified Zips

Then run the commands
```

cd backports

make default

make

sudo make install

```

and from ath10k-modified folder,copy entire ath10k folder to /lib/firmware/ and chmod -R 755 to the folder

sudo echo "options ath10k_core skip_otp=y" >> /etc/modprobe.d/ath10k.conf

sudo reboot

# Voila,Now you have WIFI and most of the bugs are fixed!!