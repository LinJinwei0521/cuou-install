cat /sys/firmware/efi/fw_platform_size
pacman -Syy
fdisk -l
fdisk /dev/nvme0n1
g
n
1
First Sector: (Enter)
Last Sector: +512M
yes
t
uefi
n
2
Fisrt sector: Enter
Last Sector: +32GB
t
2
swap
n
3
First Sector: (Enter)
Last Sector: (Enter)
w
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p3
mkswap /dev/nvme0n1p2
swapon /dev/nvme0n1p2
mount /dev/nvme0n1p3 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
pacstrap -K /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
