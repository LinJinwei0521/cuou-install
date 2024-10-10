pacman -S intel-media-driver vulkan-intel
lspci | egrep -i 'wifi|wireless|intel|broadcom|realtek'
pacman -S linux-firmware
pacman -S sudo networkmanager vim firefox noto-fonts-cjk noto-fonts-emoji
pacman -S xorg xorg-server pipewire wireplumber pipewire-pulse intel-ucode nvtop
pacman -S sddm plasma-meta kde-applications packagekit-qt6
pacman -S fcitx5-im fcitx5-chewing fcitx5-qt fcitx5-gtk fcitx5-chinese-addons
pacman -S git openssh fakeroot base-devel
ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc
vim /etc/locale.gen
locale-gen
echo "LANG=zh_TW.UTF-8" >> /etc/locale.conf
echo "ArchLinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 ArchLinux" >> /etc/hosts
systemctl enable sddm.service
systemctl enable NetworkManager.service
systemctl enable sshd.service
passwd
useradd -m -g users -G wheel,audio,video,storage -s /bin/bash user
passwd user
vim /etc/sudoers
pacman -S grub efibootmgr
mount /dev/sda1 /boot
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
ls /boot
exit
umount /mnt/boot
umount /mnt
shutdown now 
