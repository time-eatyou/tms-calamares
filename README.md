# calamares 安装程序源码

修复bios传统引导，执行bootload时，报错gurb问题
    
    if install_hybrid_grub == True and efi_boot_loader != "grub":
        raise ValueError(f"efi_boot_loader '{efi_boot_loader}' is illegal when install_hybrid_grub is 'true'!")
        return

判断问题，去除 return，后正常执行

    if install_hybrid_grub == True and efi_boot_loader != "grub":
        raise ValueError(f"efi_boot_loader '{efi_boot_loader}' is illegal when install_hybrid_grub is 'true'!")
