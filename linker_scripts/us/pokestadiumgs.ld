SECTIONS
{
    __romPos = 0;
    _gp = 0x0;
    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    .header 0x0 : AT(header_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        header_DATA_START = .;
        header = .;
        build/asm/us/header.o(.data);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_VRAM_END = .;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    .boot 0xA4000040 : AT(boot_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        boot_TEXT_START = .;
        build/asm/us/boot.o(.text);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);
        boot_DATA_START = .;
        boot = .;
        build/asm/us/boot.o(.data);
        bootcode_font = .;
        build/assets/us/bootcode_font.o(.data);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);
        boot_RODATA_START = .;
        build/asm/us/boot.o(.rodata);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);
    }
    boot_bss_VRAM = ADDR(.boot_bss);
    .boot_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        boot_BSS_START = .;
        build/asm/us/boot.o(.bss);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);
    }
    __romPos += SIZEOF(.boot);
    boot_ROM_END = __romPos;
    boot_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    text_ROM_START = __romPos;
    text_VRAM = ADDR(.text);
    .text 0x80000400 : AT(text_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        text_TEXT_START = .;
        build/asm/us/entry.o(.text);
        build/asm/us/pre_main.o(.text);
        build/asm/us/main.o(.text);
        build/asm/us/21C0.o(.text);
        build/asm/us/2CA0.o(.text);
        build/asm/us/3280.o(.text);
        build/asm/us/3A00.o(.text);
        build/asm/us/3E40.o(.text);
        build/asm/us/4420.o(.text);
        build/asm/us/57C0.o(.text);
        build/asm/us/62E0.o(.text);
        build/asm/us/6670.o(.text);
        build/asm/us/7140.o(.text);
        build/asm/us/78D0.o(.text);
        build/asm/us/7A50.o(.text);
        build/asm/us/8470.o(.text);
        build/asm/us/95C0.o(.text);
        build/asm/us/9E00.o(.text);
        build/asm/us/AC80.o(.text);
        build/asm/us/BF50.o(.text);
        build/asm/us/C180.o(.text);
        build/asm/us/C290.o(.text);
        build/asm/us/C2A0.o(.text);
        build/asm/us/C2C0.o(.text);
        build/asm/us/C380.o(.text);
        build/asm/us/C890.o(.text);
        build/asm/us/CE80.o(.text);
        build/asm/us/10BB0.o(.text);
        build/asm/us/14640.o(.text);
        build/asm/us/1A140.o(.text);
        build/asm/us/1A360.o(.text);
        build/asm/us/1C2D0.o(.text);
        build/asm/us/1CDC0.o(.text);
        build/asm/us/20860.o(.text);
        build/asm/us/208A0.o(.text);
        build/asm/us/20C50.o(.text);
        build/asm/us/43700.o(.text);
        build/asm/us/44300.o(.text);
        build/asm/us/44E70.o(.text);
        build/asm/us/47580.o(.text);
        build/asm/us/4AAD0.o(.text);
        build/asm/us/4AC10.o(.text);
        build/asm/us/4C2E0.o(.text);
        build/asm/us/4CC20.o(.text);
        build/asm/us/4EE50.o(.text);
        build/asm/us/4F800.o(.text);
        build/asm/us/517E0.o(.text);
        build/asm/us/56F90.o(.text);
        build/asm/us/585D0.o(.text);
        build/asm/us/615D0.o(.text);
        build/asm/us/638E0.o(.text);
        build/asm/us/63CF0.o(.text);
        build/asm/us/641E0.o(.text);
        build/asm/us/654A0.o(.text);
        build/asm/us/65820.o(.text);
        build/asm/us/65E20.o(.text);
        build/asm/us/667B0.o(.text);
        build/asm/us/66990.o(.text);
        build/asm/us/66B50.o(.text);
        build/asm/us/66DF0.o(.text);
        build/asm/us/672F0.o(.text);
        build/asm/us/674C0.o(.text);
        build/asm/us/674D0.o(.text);
        build/asm/us/67F00.o(.text);
        build/asm/us/68F90.o(.text);
        build/asm/us/69650.o(.text);
        build/asm/us/69F70.o(.text);
        build/asm/us/6AA10.o(.text);
        build/asm/us/6AA80.o(.text);
        build/asm/us/6DDA0.o(.text);
        build/asm/us/6DEC0.o(.text);
        build/asm/us/6E850.o(.text);
        build/asm/us/71E10.o(.text);
        build/asm/us/72540.o(.text);
        build/asm/us/72720.o(.text);
        build/asm/us/728D0.o(.text);
        build/asm/us/72C30.o(.text);
        build/asm/us/73C80.o(.text);
        build/asm/us/74020.o(.text);
        build/asm/us/746D0.o(.text);
        build/asm/us/74820.o(.text);
        build/asm/us/74A20.o(.text);
        build/asm/us/74B70.o(.text);
        build/asm/us/74FF0.o(.text);
        build/asm/us/75100.o(.text);
        build/asm/us/761E0.o(.text);
        build/asm/us/76230.o(.text);
        build/asm/us/762D0.o(.text);
        build/asm/us/76760.o(.text);
        build/asm/us/76B50.o(.text);
        build/asm/us/76D60.o(.text);
        build/asm/us/77120.o(.text);
        build/asm/us/771B0.o(.text);
        build/asm/us/77670.o(.text);
        build/asm/us/77C20.o(.text);
        build/asm/us/77C60.o(.text);
        build/asm/us/77D80.o(.text);
        build/asm/us/77F10.o(.text);
        build/asm/us/77FA0.o(.text);
        build/asm/us/78180.o(.text);
        build/asm/us/78210.o(.text);
        build/asm/us/78290.o(.text);
        build/asm/us/782B0.o(.text);
        build/asm/us/78330.o(.text);
        build/asm/us/78790.o(.text);
        build/asm/us/78A20.o(.text);
        build/asm/us/78AB0.o(.text);
        build/asm/us/78B60.o(.text);
        build/asm/us/78BB0.o(.text);
        build/asm/us/78EC0.o(.text);
        build/asm/us/78F30.o(.text);
        build/asm/us/78F80.o(.text);
        build/asm/us/78FD0.o(.text);
        build/asm/us/79510.o(.text);
        build/asm/us/79640.o(.text);
        build/asm/us/796B0.o(.text);
        build/asm/us/79750.o(.text);
        build/asm/us/798B0.o(.text);
        text_TEXT_END = .;
        text_TEXT_SIZE = ABSOLUTE(text_TEXT_END - text_TEXT_START);
        text_DATA_START = .;
        entry = .;
        build/asm/us/entry.o(.data);
        pre_main = .;
        build/asm/us/pre_main.o(.data);
        main = .;
        build/asm/us/main.o(.data);
        _21C0 = .;
        build/asm/us/21C0.o(.data);
        _2CA0 = .;
        build/asm/us/2CA0.o(.data);
        _3280 = .;
        build/asm/us/3280.o(.data);
        _3A00 = .;
        build/asm/us/3A00.o(.data);
        _3E40 = .;
        build/asm/us/3E40.o(.data);
        _4420 = .;
        build/asm/us/4420.o(.data);
        _57C0 = .;
        build/asm/us/57C0.o(.data);
        _62E0 = .;
        build/asm/us/62E0.o(.data);
        _6670 = .;
        build/asm/us/6670.o(.data);
        _7140 = .;
        build/asm/us/7140.o(.data);
        _78D0 = .;
        build/asm/us/78D0.o(.data);
        _7A50 = .;
        build/asm/us/7A50.o(.data);
        _8470 = .;
        build/asm/us/8470.o(.data);
        _95C0 = .;
        build/asm/us/95C0.o(.data);
        _9E00 = .;
        build/asm/us/9E00.o(.data);
        AC80 = .;
        build/asm/us/AC80.o(.data);
        BF50 = .;
        build/asm/us/BF50.o(.data);
        C180 = .;
        build/asm/us/C180.o(.data);
        C290 = .;
        build/asm/us/C290.o(.data);
        C2A0 = .;
        build/asm/us/C2A0.o(.data);
        C2C0 = .;
        build/asm/us/C2C0.o(.data);
        C380 = .;
        build/asm/us/C380.o(.data);
        C890 = .;
        build/asm/us/C890.o(.data);
        CE80 = .;
        build/asm/us/CE80.o(.data);
        _10BB0 = .;
        build/asm/us/10BB0.o(.data);
        _14640 = .;
        build/asm/us/14640.o(.data);
        _1A140 = .;
        build/asm/us/1A140.o(.data);
        _1A360 = .;
        build/asm/us/1A360.o(.data);
        _1C2D0 = .;
        build/asm/us/1C2D0.o(.data);
        _1CDC0 = .;
        build/asm/us/1CDC0.o(.data);
        _20860 = .;
        build/asm/us/20860.o(.data);
        _208A0 = .;
        build/asm/us/208A0.o(.data);
        _20C50 = .;
        build/asm/us/20C50.o(.data);
        _43700 = .;
        build/asm/us/43700.o(.data);
        _44300 = .;
        build/asm/us/44300.o(.data);
        _44E70 = .;
        build/asm/us/44E70.o(.data);
        _47580 = .;
        build/asm/us/47580.o(.data);
        _4AAD0 = .;
        build/asm/us/4AAD0.o(.data);
        _4AC10 = .;
        build/asm/us/4AC10.o(.data);
        _4C2E0 = .;
        build/asm/us/4C2E0.o(.data);
        _4CC20 = .;
        build/asm/us/4CC20.o(.data);
        _4EE50 = .;
        build/asm/us/4EE50.o(.data);
        _4F800 = .;
        build/asm/us/4F800.o(.data);
        _517E0 = .;
        build/asm/us/517E0.o(.data);
        _56F90 = .;
        build/asm/us/56F90.o(.data);
        _585D0 = .;
        build/asm/us/585D0.o(.data);
        _615D0 = .;
        build/asm/us/615D0.o(.data);
        _638E0 = .;
        build/asm/us/638E0.o(.data);
        _63CF0 = .;
        build/asm/us/63CF0.o(.data);
        _641E0 = .;
        build/asm/us/641E0.o(.data);
        _654A0 = .;
        build/asm/us/654A0.o(.data);
        _65820 = .;
        build/asm/us/65820.o(.data);
        _65E20 = .;
        build/asm/us/65E20.o(.data);
        _667B0 = .;
        build/asm/us/667B0.o(.data);
        _66990 = .;
        build/asm/us/66990.o(.data);
        _66B50 = .;
        build/asm/us/66B50.o(.data);
        _66DF0 = .;
        build/asm/us/66DF0.o(.data);
        _672F0 = .;
        build/asm/us/672F0.o(.data);
        _674C0 = .;
        build/asm/us/674C0.o(.data);
        _674D0 = .;
        build/asm/us/674D0.o(.data);
        _67F00 = .;
        build/asm/us/67F00.o(.data);
        _68F90 = .;
        build/asm/us/68F90.o(.data);
        _69650 = .;
        build/asm/us/69650.o(.data);
        _69F70 = .;
        build/asm/us/69F70.o(.data);
        _6AA10 = .;
        build/asm/us/6AA10.o(.data);
        _6AA80 = .;
        build/asm/us/6AA80.o(.data);
        _6DDA0 = .;
        build/asm/us/6DDA0.o(.data);
        _6DEC0 = .;
        build/asm/us/6DEC0.o(.data);
        _6E850 = .;
        build/asm/us/6E850.o(.data);
        _71E10 = .;
        build/asm/us/71E10.o(.data);
        _72540 = .;
        build/asm/us/72540.o(.data);
        _72720 = .;
        build/asm/us/72720.o(.data);
        _728D0 = .;
        build/asm/us/728D0.o(.data);
        _72C30 = .;
        build/asm/us/72C30.o(.data);
        _73C80 = .;
        build/asm/us/73C80.o(.data);
        _74020 = .;
        build/asm/us/74020.o(.data);
        _746D0 = .;
        build/asm/us/746D0.o(.data);
        _74820 = .;
        build/asm/us/74820.o(.data);
        _74A20 = .;
        build/asm/us/74A20.o(.data);
        _74B70 = .;
        build/asm/us/74B70.o(.data);
        _74FF0 = .;
        build/asm/us/74FF0.o(.data);
        _75100 = .;
        build/asm/us/75100.o(.data);
        _761E0 = .;
        build/asm/us/761E0.o(.data);
        _76230 = .;
        build/asm/us/76230.o(.data);
        _762D0 = .;
        build/asm/us/762D0.o(.data);
        _76760 = .;
        build/asm/us/76760.o(.data);
        _76B50 = .;
        build/asm/us/76B50.o(.data);
        _76D60 = .;
        build/asm/us/76D60.o(.data);
        _77120 = .;
        build/asm/us/77120.o(.data);
        _771B0 = .;
        build/asm/us/771B0.o(.data);
        _77670 = .;
        build/asm/us/77670.o(.data);
        _77C20 = .;
        build/asm/us/77C20.o(.data);
        _77C60 = .;
        build/asm/us/77C60.o(.data);
        _77D80 = .;
        build/asm/us/77D80.o(.data);
        _77F10 = .;
        build/asm/us/77F10.o(.data);
        _77FA0 = .;
        build/asm/us/77FA0.o(.data);
        _78180 = .;
        build/asm/us/78180.o(.data);
        _78210 = .;
        build/asm/us/78210.o(.data);
        _78290 = .;
        build/asm/us/78290.o(.data);
        _782B0 = .;
        build/asm/us/782B0.o(.data);
        _78330 = .;
        build/asm/us/78330.o(.data);
        _78790 = .;
        build/asm/us/78790.o(.data);
        _78A20 = .;
        build/asm/us/78A20.o(.data);
        _78AB0 = .;
        build/asm/us/78AB0.o(.data);
        _78B60 = .;
        build/asm/us/78B60.o(.data);
        _78BB0 = .;
        build/asm/us/78BB0.o(.data);
        _78EC0 = .;
        build/asm/us/78EC0.o(.data);
        _78F30 = .;
        build/asm/us/78F30.o(.data);
        _78F80 = .;
        build/asm/us/78F80.o(.data);
        _78FD0 = .;
        build/asm/us/78FD0.o(.data);
        _79510 = .;
        build/asm/us/79510.o(.data);
        _79640 = .;
        build/asm/us/79640.o(.data);
        _796B0 = .;
        build/asm/us/796B0.o(.data);
        _79750 = .;
        build/asm/us/79750.o(.data);
        _798B0 = .;
        build/asm/us/798B0.o(.data);
        _85DA0_data = .;
        build/asm/us/data/85DA0.data.o(.data);
        A8600 = .;
        build/assets/us/A8600.o(.data);
        text_DATA_END = .;
        text_DATA_SIZE = ABSOLUTE(text_DATA_END - text_DATA_START);
        text_RODATA_START = .;
        build/asm/us/entry.o(.rodata);
        build/asm/us/pre_main.o(.rodata);
        build/asm/us/main.o(.rodata);
        build/asm/us/21C0.o(.rodata);
        build/asm/us/2CA0.o(.rodata);
        build/asm/us/3280.o(.rodata);
        build/asm/us/3A00.o(.rodata);
        build/asm/us/3E40.o(.rodata);
        build/asm/us/4420.o(.rodata);
        build/asm/us/57C0.o(.rodata);
        build/asm/us/62E0.o(.rodata);
        build/asm/us/6670.o(.rodata);
        build/asm/us/7140.o(.rodata);
        build/asm/us/78D0.o(.rodata);
        build/asm/us/7A50.o(.rodata);
        build/asm/us/8470.o(.rodata);
        build/asm/us/95C0.o(.rodata);
        build/asm/us/9E00.o(.rodata);
        build/asm/us/AC80.o(.rodata);
        build/asm/us/BF50.o(.rodata);
        build/asm/us/C180.o(.rodata);
        build/asm/us/C290.o(.rodata);
        build/asm/us/C2A0.o(.rodata);
        build/asm/us/C2C0.o(.rodata);
        build/asm/us/C380.o(.rodata);
        build/asm/us/C890.o(.rodata);
        build/asm/us/CE80.o(.rodata);
        build/asm/us/10BB0.o(.rodata);
        build/asm/us/14640.o(.rodata);
        build/asm/us/1A140.o(.rodata);
        build/asm/us/1A360.o(.rodata);
        build/asm/us/1C2D0.o(.rodata);
        build/asm/us/1CDC0.o(.rodata);
        build/asm/us/20860.o(.rodata);
        build/asm/us/208A0.o(.rodata);
        build/asm/us/20C50.o(.rodata);
        build/asm/us/43700.o(.rodata);
        build/asm/us/44300.o(.rodata);
        build/asm/us/44E70.o(.rodata);
        build/asm/us/47580.o(.rodata);
        build/asm/us/4AAD0.o(.rodata);
        build/asm/us/4AC10.o(.rodata);
        build/asm/us/4C2E0.o(.rodata);
        build/asm/us/4CC20.o(.rodata);
        build/asm/us/4EE50.o(.rodata);
        build/asm/us/4F800.o(.rodata);
        build/asm/us/517E0.o(.rodata);
        build/asm/us/56F90.o(.rodata);
        build/asm/us/585D0.o(.rodata);
        build/asm/us/615D0.o(.rodata);
        build/asm/us/638E0.o(.rodata);
        build/asm/us/63CF0.o(.rodata);
        build/asm/us/641E0.o(.rodata);
        build/asm/us/654A0.o(.rodata);
        build/asm/us/65820.o(.rodata);
        build/asm/us/65E20.o(.rodata);
        build/asm/us/667B0.o(.rodata);
        build/asm/us/66990.o(.rodata);
        build/asm/us/66B50.o(.rodata);
        build/asm/us/66DF0.o(.rodata);
        build/asm/us/672F0.o(.rodata);
        build/asm/us/674C0.o(.rodata);
        build/asm/us/674D0.o(.rodata);
        build/asm/us/67F00.o(.rodata);
        build/asm/us/68F90.o(.rodata);
        build/asm/us/69650.o(.rodata);
        build/asm/us/69F70.o(.rodata);
        build/asm/us/6AA10.o(.rodata);
        build/asm/us/6AA80.o(.rodata);
        build/asm/us/6DDA0.o(.rodata);
        build/asm/us/6DEC0.o(.rodata);
        build/asm/us/6E850.o(.rodata);
        build/asm/us/71E10.o(.rodata);
        build/asm/us/72540.o(.rodata);
        build/asm/us/72720.o(.rodata);
        build/asm/us/728D0.o(.rodata);
        build/asm/us/72C30.o(.rodata);
        build/asm/us/73C80.o(.rodata);
        build/asm/us/74020.o(.rodata);
        build/asm/us/746D0.o(.rodata);
        build/asm/us/74820.o(.rodata);
        build/asm/us/74A20.o(.rodata);
        build/asm/us/74B70.o(.rodata);
        build/asm/us/74FF0.o(.rodata);
        build/asm/us/75100.o(.rodata);
        build/asm/us/761E0.o(.rodata);
        build/asm/us/76230.o(.rodata);
        build/asm/us/762D0.o(.rodata);
        build/asm/us/76760.o(.rodata);
        build/asm/us/76B50.o(.rodata);
        build/asm/us/76D60.o(.rodata);
        build/asm/us/77120.o(.rodata);
        build/asm/us/771B0.o(.rodata);
        build/asm/us/77670.o(.rodata);
        build/asm/us/77C20.o(.rodata);
        build/asm/us/77C60.o(.rodata);
        build/asm/us/77D80.o(.rodata);
        build/asm/us/77F10.o(.rodata);
        build/asm/us/77FA0.o(.rodata);
        build/asm/us/78180.o(.rodata);
        build/asm/us/78210.o(.rodata);
        build/asm/us/78290.o(.rodata);
        build/asm/us/782B0.o(.rodata);
        build/asm/us/78330.o(.rodata);
        build/asm/us/78790.o(.rodata);
        build/asm/us/78A20.o(.rodata);
        build/asm/us/78AB0.o(.rodata);
        build/asm/us/78B60.o(.rodata);
        build/asm/us/78BB0.o(.rodata);
        build/asm/us/78EC0.o(.rodata);
        build/asm/us/78F30.o(.rodata);
        build/asm/us/78F80.o(.rodata);
        build/asm/us/78FD0.o(.rodata);
        build/asm/us/79510.o(.rodata);
        build/asm/us/79640.o(.rodata);
        build/asm/us/796B0.o(.rodata);
        build/asm/us/79750.o(.rodata);
        build/asm/us/798B0.o(.rodata);
        text_RODATA_END = .;
        text_RODATA_SIZE = ABSOLUTE(text_RODATA_END - text_RODATA_START);
    }
    text_bss_VRAM = ADDR(.text_bss);
    .text_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        text_BSS_START = .;
        build/asm/us/entry.o(.bss);
        build/asm/us/pre_main.o(.bss);
        build/asm/us/main.o(.bss);
        build/asm/us/21C0.o(.bss);
        build/asm/us/2CA0.o(.bss);
        build/asm/us/3280.o(.bss);
        build/asm/us/3A00.o(.bss);
        build/asm/us/3E40.o(.bss);
        build/asm/us/4420.o(.bss);
        build/asm/us/57C0.o(.bss);
        build/asm/us/62E0.o(.bss);
        build/asm/us/6670.o(.bss);
        build/asm/us/7140.o(.bss);
        build/asm/us/78D0.o(.bss);
        build/asm/us/7A50.o(.bss);
        build/asm/us/8470.o(.bss);
        build/asm/us/95C0.o(.bss);
        build/asm/us/9E00.o(.bss);
        build/asm/us/AC80.o(.bss);
        build/asm/us/BF50.o(.bss);
        build/asm/us/C180.o(.bss);
        build/asm/us/C290.o(.bss);
        build/asm/us/C2A0.o(.bss);
        build/asm/us/C2C0.o(.bss);
        build/asm/us/C380.o(.bss);
        build/asm/us/C890.o(.bss);
        build/asm/us/CE80.o(.bss);
        build/asm/us/10BB0.o(.bss);
        build/asm/us/14640.o(.bss);
        build/asm/us/1A140.o(.bss);
        build/asm/us/1A360.o(.bss);
        build/asm/us/1C2D0.o(.bss);
        build/asm/us/1CDC0.o(.bss);
        build/asm/us/20860.o(.bss);
        build/asm/us/208A0.o(.bss);
        build/asm/us/20C50.o(.bss);
        build/asm/us/43700.o(.bss);
        build/asm/us/44300.o(.bss);
        build/asm/us/44E70.o(.bss);
        build/asm/us/47580.o(.bss);
        build/asm/us/4AAD0.o(.bss);
        build/asm/us/4AC10.o(.bss);
        build/asm/us/4C2E0.o(.bss);
        build/asm/us/4CC20.o(.bss);
        build/asm/us/4EE50.o(.bss);
        build/asm/us/4F800.o(.bss);
        build/asm/us/517E0.o(.bss);
        build/asm/us/56F90.o(.bss);
        build/asm/us/585D0.o(.bss);
        build/asm/us/615D0.o(.bss);
        build/asm/us/638E0.o(.bss);
        build/asm/us/63CF0.o(.bss);
        build/asm/us/641E0.o(.bss);
        build/asm/us/654A0.o(.bss);
        build/asm/us/65820.o(.bss);
        build/asm/us/65E20.o(.bss);
        build/asm/us/667B0.o(.bss);
        build/asm/us/66990.o(.bss);
        build/asm/us/66B50.o(.bss);
        build/asm/us/66DF0.o(.bss);
        build/asm/us/672F0.o(.bss);
        build/asm/us/674C0.o(.bss);
        build/asm/us/674D0.o(.bss);
        build/asm/us/67F00.o(.bss);
        build/asm/us/68F90.o(.bss);
        build/asm/us/69650.o(.bss);
        build/asm/us/69F70.o(.bss);
        build/asm/us/6AA10.o(.bss);
        build/asm/us/6AA80.o(.bss);
        build/asm/us/6DDA0.o(.bss);
        build/asm/us/6DEC0.o(.bss);
        build/asm/us/6E850.o(.bss);
        build/asm/us/71E10.o(.bss);
        build/asm/us/72540.o(.bss);
        build/asm/us/72720.o(.bss);
        build/asm/us/728D0.o(.bss);
        build/asm/us/72C30.o(.bss);
        build/asm/us/73C80.o(.bss);
        build/asm/us/74020.o(.bss);
        build/asm/us/746D0.o(.bss);
        build/asm/us/74820.o(.bss);
        build/asm/us/74A20.o(.bss);
        build/asm/us/74B70.o(.bss);
        build/asm/us/74FF0.o(.bss);
        build/asm/us/75100.o(.bss);
        build/asm/us/761E0.o(.bss);
        build/asm/us/76230.o(.bss);
        build/asm/us/762D0.o(.bss);
        build/asm/us/76760.o(.bss);
        build/asm/us/76B50.o(.bss);
        build/asm/us/76D60.o(.bss);
        build/asm/us/77120.o(.bss);
        build/asm/us/771B0.o(.bss);
        build/asm/us/77670.o(.bss);
        build/asm/us/77C20.o(.bss);
        build/asm/us/77C60.o(.bss);
        build/asm/us/77D80.o(.bss);
        build/asm/us/77F10.o(.bss);
        build/asm/us/77FA0.o(.bss);
        build/asm/us/78180.o(.bss);
        build/asm/us/78210.o(.bss);
        build/asm/us/78290.o(.bss);
        build/asm/us/782B0.o(.bss);
        build/asm/us/78330.o(.bss);
        build/asm/us/78790.o(.bss);
        build/asm/us/78A20.o(.bss);
        build/asm/us/78AB0.o(.bss);
        build/asm/us/78B60.o(.bss);
        build/asm/us/78BB0.o(.bss);
        build/asm/us/78EC0.o(.bss);
        build/asm/us/78F30.o(.bss);
        build/asm/us/78F80.o(.bss);
        build/asm/us/78FD0.o(.bss);
        build/asm/us/79510.o(.bss);
        build/asm/us/79640.o(.bss);
        build/asm/us/796B0.o(.bss);
        build/asm/us/79750.o(.bss);
        build/asm/us/798B0.o(.bss);
        text_BSS_END = .;
        text_BSS_SIZE = ABSOLUTE(text_BSS_END - text_BSS_START);
    }
    __romPos += SIZEOF(.text);
    text_ROM_END = __romPos;
    text_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment1_ROM_START = __romPos;
    fragment1_VRAM = ADDR(.fragment1);
    .fragment1 0x83500000 : AT(fragment1_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment1_TEXT_START = .;
        build/asm/us/data/fragments/1/fragment1_header.o(.text);
        build/asm/us/fragments/1/fragment1_code.o(.text);
        fragment1_TEXT_END = .;
        fragment1_TEXT_SIZE = ABSOLUTE(fragment1_TEXT_END - fragment1_TEXT_START);
        fragment1_DATA_START = .;
        fragments_1_fragment1_header = .;
        build/asm/us/data/fragments/1/fragment1_header.o(.data);
        fragments_1_fragment1_code = .;
        build/asm/us/fragments/1/fragment1_code.o(.data);
        fragments_1_fragment1_data_data = .;
        build/asm/us/data/fragments/1/fragment1_data.data.o(.data);
        fragment1_DATA_END = .;
        fragment1_DATA_SIZE = ABSOLUTE(fragment1_DATA_END - fragment1_DATA_START);
        fragment1_RODATA_START = .;
        build/asm/us/data/fragments/1/fragment1_header.o(.rodata);
        build/asm/us/fragments/1/fragment1_code.o(.rodata);
        fragment1_RODATA_END = .;
        fragment1_RODATA_SIZE = ABSOLUTE(fragment1_RODATA_END - fragment1_RODATA_START);
    }
    fragment1_bss_VRAM = ADDR(.fragment1_bss);
    .fragment1_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment1_BSS_START = .;
        build/asm/us/data/fragments/1/fragment1_header.o(.bss);
        build/asm/us/fragments/1/fragment1_code.o(.bss);
        fragment1_BSS_END = .;
        fragment1_BSS_SIZE = ABSOLUTE(fragment1_BSS_END - fragment1_BSS_START);
    }
    __romPos += SIZEOF(.fragment1);
    fragment1_ROM_END = __romPos;
    fragment1_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment2_ROM_START = __romPos;
    fragment2_VRAM = ADDR(.fragment2);
    .fragment2 0x81900000 : AT(fragment2_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment2_TEXT_START = .;
        build/asm/us/data/fragments/2/fragment2_header.o(.text);
        build/asm/us/fragments/2/fragment2_code.o(.text);
        fragment2_TEXT_END = .;
        fragment2_TEXT_SIZE = ABSOLUTE(fragment2_TEXT_END - fragment2_TEXT_START);
        fragment2_DATA_START = .;
        fragments_2_fragment2_header = .;
        build/asm/us/data/fragments/2/fragment2_header.o(.data);
        fragments_2_fragment2_code = .;
        build/asm/us/fragments/2/fragment2_code.o(.data);
        fragments_2_fragment2_data_data = .;
        build/asm/us/data/fragments/2/fragment2_data.data.o(.data);
        fragment2_DATA_END = .;
        fragment2_DATA_SIZE = ABSOLUTE(fragment2_DATA_END - fragment2_DATA_START);
        fragment2_RODATA_START = .;
        build/asm/us/data/fragments/2/fragment2_header.o(.rodata);
        build/asm/us/fragments/2/fragment2_code.o(.rodata);
        fragment2_RODATA_END = .;
        fragment2_RODATA_SIZE = ABSOLUTE(fragment2_RODATA_END - fragment2_RODATA_START);
    }
    fragment2_bss_VRAM = ADDR(.fragment2_bss);
    .fragment2_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment2_BSS_START = .;
        build/asm/us/data/fragments/2/fragment2_header.o(.bss);
        build/asm/us/fragments/2/fragment2_code.o(.bss);
        fragment2_BSS_END = .;
        fragment2_BSS_SIZE = ABSOLUTE(fragment2_BSS_END - fragment2_BSS_START);
    }
    __romPos += SIZEOF(.fragment2);
    fragment2_ROM_END = __romPos;
    fragment2_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment3_ROM_START = __romPos;
    fragment3_VRAM = ADDR(.fragment3);
    .fragment3 0x81A00000 : AT(fragment3_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment3_TEXT_START = .;
        build/asm/us/data/fragments/3/fragment3_header.o(.text);
        build/asm/us/fragments/3/fragment3_code.o(.text);
        fragment3_TEXT_END = .;
        fragment3_TEXT_SIZE = ABSOLUTE(fragment3_TEXT_END - fragment3_TEXT_START);
        fragment3_DATA_START = .;
        fragments_3_fragment3_header = .;
        build/asm/us/data/fragments/3/fragment3_header.o(.data);
        fragments_3_fragment3_code = .;
        build/asm/us/fragments/3/fragment3_code.o(.data);
        fragments_3_fragment3_data_data = .;
        build/asm/us/data/fragments/3/fragment3_data.data.o(.data);
        fragment3_DATA_END = .;
        fragment3_DATA_SIZE = ABSOLUTE(fragment3_DATA_END - fragment3_DATA_START);
        fragment3_RODATA_START = .;
        build/asm/us/data/fragments/3/fragment3_header.o(.rodata);
        build/asm/us/fragments/3/fragment3_code.o(.rodata);
        fragment3_RODATA_END = .;
        fragment3_RODATA_SIZE = ABSOLUTE(fragment3_RODATA_END - fragment3_RODATA_START);
    }
    fragment3_bss_VRAM = ADDR(.fragment3_bss);
    .fragment3_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment3_BSS_START = .;
        build/asm/us/data/fragments/3/fragment3_header.o(.bss);
        build/asm/us/fragments/3/fragment3_code.o(.bss);
        fragment3_BSS_END = .;
        fragment3_BSS_SIZE = ABSOLUTE(fragment3_BSS_END - fragment3_BSS_START);
    }
    __romPos += SIZEOF(.fragment3);
    fragment3_ROM_END = __romPos;
    fragment3_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment4_ROM_START = __romPos;
    fragment4_VRAM = ADDR(.fragment4);
    .fragment4 0x81800000 : AT(fragment4_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment4_TEXT_START = .;
        build/asm/us/data/fragments/4/fragment4_header.o(.text);
        build/asm/us/fragments/4/fragment4_code.o(.text);
        fragment4_TEXT_END = .;
        fragment4_TEXT_SIZE = ABSOLUTE(fragment4_TEXT_END - fragment4_TEXT_START);
        fragment4_DATA_START = .;
        fragments_4_fragment4_header = .;
        build/asm/us/data/fragments/4/fragment4_header.o(.data);
        fragments_4_fragment4_code = .;
        build/asm/us/fragments/4/fragment4_code.o(.data);
        fragments_4_fragment4_data_data = .;
        build/asm/us/data/fragments/4/fragment4_data.data.o(.data);
        fragment4_DATA_END = .;
        fragment4_DATA_SIZE = ABSOLUTE(fragment4_DATA_END - fragment4_DATA_START);
        fragment4_RODATA_START = .;
        build/asm/us/data/fragments/4/fragment4_header.o(.rodata);
        build/asm/us/fragments/4/fragment4_code.o(.rodata);
        fragment4_RODATA_END = .;
        fragment4_RODATA_SIZE = ABSOLUTE(fragment4_RODATA_END - fragment4_RODATA_START);
    }
    fragment4_bss_VRAM = ADDR(.fragment4_bss);
    .fragment4_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment4_BSS_START = .;
        build/asm/us/data/fragments/4/fragment4_header.o(.bss);
        build/asm/us/fragments/4/fragment4_code.o(.bss);
        fragment4_BSS_END = .;
        fragment4_BSS_SIZE = ABSOLUTE(fragment4_BSS_END - fragment4_BSS_START);
    }
    __romPos += SIZEOF(.fragment4);
    fragment4_ROM_END = __romPos;
    fragment4_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment5_ROM_START = __romPos;
    fragment5_VRAM = ADDR(.fragment5);
    .fragment5 0x83200000 : AT(fragment5_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment5_TEXT_START = .;
        build/asm/us/data/fragments/5/fragment5_header.o(.text);
        build/asm/us/fragments/5/fragment5_code.o(.text);
        fragment5_TEXT_END = .;
        fragment5_TEXT_SIZE = ABSOLUTE(fragment5_TEXT_END - fragment5_TEXT_START);
        fragment5_DATA_START = .;
        fragments_5_fragment5_header = .;
        build/asm/us/data/fragments/5/fragment5_header.o(.data);
        fragments_5_fragment5_code = .;
        build/asm/us/fragments/5/fragment5_code.o(.data);
        fragments_5_fragment5_data_data = .;
        build/asm/us/data/fragments/5/fragment5_data.data.o(.data);
        fragment5_DATA_END = .;
        fragment5_DATA_SIZE = ABSOLUTE(fragment5_DATA_END - fragment5_DATA_START);
        fragment5_RODATA_START = .;
        build/asm/us/data/fragments/5/fragment5_header.o(.rodata);
        build/asm/us/fragments/5/fragment5_code.o(.rodata);
        fragment5_RODATA_END = .;
        fragment5_RODATA_SIZE = ABSOLUTE(fragment5_RODATA_END - fragment5_RODATA_START);
    }
    fragment5_bss_VRAM = ADDR(.fragment5_bss);
    .fragment5_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment5_BSS_START = .;
        build/asm/us/data/fragments/5/fragment5_header.o(.bss);
        build/asm/us/fragments/5/fragment5_code.o(.bss);
        fragment5_BSS_END = .;
        fragment5_BSS_SIZE = ABSOLUTE(fragment5_BSS_END - fragment5_BSS_START);
    }
    __romPos += SIZEOF(.fragment5);
    fragment5_ROM_END = __romPos;
    fragment5_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment6_ROM_START = __romPos;
    fragment6_VRAM = ADDR(.fragment6);
    .fragment6 0x83100000 : AT(fragment6_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment6_TEXT_START = .;
        build/asm/us/data/fragments/6/fragment6_header.o(.text);
        build/asm/us/fragments/6/fragment6_code.o(.text);
        fragment6_TEXT_END = .;
        fragment6_TEXT_SIZE = ABSOLUTE(fragment6_TEXT_END - fragment6_TEXT_START);
        fragment6_DATA_START = .;
        fragments_6_fragment6_header = .;
        build/asm/us/data/fragments/6/fragment6_header.o(.data);
        fragments_6_fragment6_code = .;
        build/asm/us/fragments/6/fragment6_code.o(.data);
        fragments_6_fragment6_data_data = .;
        build/asm/us/data/fragments/6/fragment6_data.data.o(.data);
        fragment6_DATA_END = .;
        fragment6_DATA_SIZE = ABSOLUTE(fragment6_DATA_END - fragment6_DATA_START);
        fragment6_RODATA_START = .;
        build/asm/us/data/fragments/6/fragment6_header.o(.rodata);
        build/asm/us/fragments/6/fragment6_code.o(.rodata);
        fragment6_RODATA_END = .;
        fragment6_RODATA_SIZE = ABSOLUTE(fragment6_RODATA_END - fragment6_RODATA_START);
    }
    fragment6_bss_VRAM = ADDR(.fragment6_bss);
    .fragment6_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment6_BSS_START = .;
        build/asm/us/data/fragments/6/fragment6_header.o(.bss);
        build/asm/us/fragments/6/fragment6_code.o(.bss);
        fragment6_BSS_END = .;
        fragment6_BSS_SIZE = ABSOLUTE(fragment6_BSS_END - fragment6_BSS_START);
    }
    __romPos += SIZEOF(.fragment6);
    fragment6_ROM_END = __romPos;
    fragment6_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment7_ROM_START = __romPos;
    fragment7_VRAM = ADDR(.fragment7);
    .fragment7 0x83000000 : AT(fragment7_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment7_TEXT_START = .;
        build/asm/us/data/fragments/7/fragment7_header.o(.text);
        build/asm/us/fragments/7/fragment7_code.o(.text);
        fragment7_TEXT_END = .;
        fragment7_TEXT_SIZE = ABSOLUTE(fragment7_TEXT_END - fragment7_TEXT_START);
        fragment7_DATA_START = .;
        fragments_7_fragment7_header = .;
        build/asm/us/data/fragments/7/fragment7_header.o(.data);
        fragments_7_fragment7_code = .;
        build/asm/us/fragments/7/fragment7_code.o(.data);
        fragments_7_fragment7_data_data = .;
        build/asm/us/data/fragments/7/fragment7_data.data.o(.data);
        fragment7_DATA_END = .;
        fragment7_DATA_SIZE = ABSOLUTE(fragment7_DATA_END - fragment7_DATA_START);
        fragment7_RODATA_START = .;
        build/asm/us/data/fragments/7/fragment7_header.o(.rodata);
        build/asm/us/fragments/7/fragment7_code.o(.rodata);
        fragment7_RODATA_END = .;
        fragment7_RODATA_SIZE = ABSOLUTE(fragment7_RODATA_END - fragment7_RODATA_START);
    }
    fragment7_bss_VRAM = ADDR(.fragment7_bss);
    .fragment7_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment7_BSS_START = .;
        build/asm/us/data/fragments/7/fragment7_header.o(.bss);
        build/asm/us/fragments/7/fragment7_code.o(.bss);
        fragment7_BSS_END = .;
        fragment7_BSS_SIZE = ABSOLUTE(fragment7_BSS_END - fragment7_BSS_START);
    }
    __romPos += SIZEOF(.fragment7);
    fragment7_ROM_END = __romPos;
    fragment7_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment8_ROM_START = __romPos;
    fragment8_VRAM = ADDR(.fragment8);
    .fragment8 0x82F00000 : AT(fragment8_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment8_TEXT_START = .;
        build/asm/us/data/fragments/8/fragment8_header.o(.text);
        build/asm/us/fragments/8/fragment8_code.o(.text);
        fragment8_TEXT_END = .;
        fragment8_TEXT_SIZE = ABSOLUTE(fragment8_TEXT_END - fragment8_TEXT_START);
        fragment8_DATA_START = .;
        fragments_8_fragment8_header = .;
        build/asm/us/data/fragments/8/fragment8_header.o(.data);
        fragments_8_fragment8_code = .;
        build/asm/us/fragments/8/fragment8_code.o(.data);
        fragments_8_fragment8_data_data = .;
        build/asm/us/data/fragments/8/fragment8_data.data.o(.data);
        fragment8_DATA_END = .;
        fragment8_DATA_SIZE = ABSOLUTE(fragment8_DATA_END - fragment8_DATA_START);
        fragment8_RODATA_START = .;
        build/asm/us/data/fragments/8/fragment8_header.o(.rodata);
        build/asm/us/fragments/8/fragment8_code.o(.rodata);
        fragment8_RODATA_END = .;
        fragment8_RODATA_SIZE = ABSOLUTE(fragment8_RODATA_END - fragment8_RODATA_START);
    }
    fragment8_bss_VRAM = ADDR(.fragment8_bss);
    .fragment8_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment8_BSS_START = .;
        build/asm/us/data/fragments/8/fragment8_header.o(.bss);
        build/asm/us/fragments/8/fragment8_code.o(.bss);
        fragment8_BSS_END = .;
        fragment8_BSS_SIZE = ABSOLUTE(fragment8_BSS_END - fragment8_BSS_START);
    }
    __romPos += SIZEOF(.fragment8);
    fragment8_ROM_END = __romPos;
    fragment8_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment9_ROM_START = __romPos;
    fragment9_VRAM = ADDR(.fragment9);
    .fragment9 0x8FB00000 : AT(fragment9_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment9_TEXT_START = .;
        build/asm/us/data/fragments/9/fragment9_header.o(.text);
        build/asm/us/fragments/9/fragment9_code.o(.text);
        fragment9_TEXT_END = .;
        fragment9_TEXT_SIZE = ABSOLUTE(fragment9_TEXT_END - fragment9_TEXT_START);
        fragment9_DATA_START = .;
        fragments_9_fragment9_header = .;
        build/asm/us/data/fragments/9/fragment9_header.o(.data);
        fragments_9_fragment9_code = .;
        build/asm/us/fragments/9/fragment9_code.o(.data);
        fragments_9_fragment9_data_data = .;
        build/asm/us/data/fragments/9/fragment9_data.data.o(.data);
        fragment9_DATA_END = .;
        fragment9_DATA_SIZE = ABSOLUTE(fragment9_DATA_END - fragment9_DATA_START);
        fragment9_RODATA_START = .;
        build/asm/us/data/fragments/9/fragment9_header.o(.rodata);
        build/asm/us/fragments/9/fragment9_code.o(.rodata);
        fragment9_RODATA_END = .;
        fragment9_RODATA_SIZE = ABSOLUTE(fragment9_RODATA_END - fragment9_RODATA_START);
    }
    fragment9_bss_VRAM = ADDR(.fragment9_bss);
    .fragment9_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment9_BSS_START = .;
        build/asm/us/data/fragments/9/fragment9_header.o(.bss);
        build/asm/us/fragments/9/fragment9_code.o(.bss);
        fragment9_BSS_END = .;
        fragment9_BSS_SIZE = ABSOLUTE(fragment9_BSS_END - fragment9_BSS_START);
    }
    __romPos += SIZEOF(.fragment9);
    fragment9_ROM_END = __romPos;
    fragment9_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment10_ROM_START = __romPos;
    fragment10_VRAM = ADDR(.fragment10);
    .fragment10 0x82800000 : AT(fragment10_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment10_TEXT_START = .;
        build/asm/us/data/fragments/10/fragment10_header.o(.text);
        build/asm/us/fragments/10/fragment10_code.o(.text);
        fragment10_TEXT_END = .;
        fragment10_TEXT_SIZE = ABSOLUTE(fragment10_TEXT_END - fragment10_TEXT_START);
        fragment10_DATA_START = .;
        fragments_10_fragment10_header = .;
        build/asm/us/data/fragments/10/fragment10_header.o(.data);
        fragments_10_fragment10_code = .;
        build/asm/us/fragments/10/fragment10_code.o(.data);
        fragments_10_fragment10_data_data = .;
        build/asm/us/data/fragments/10/fragment10_data.data.o(.data);
        fragment10_DATA_END = .;
        fragment10_DATA_SIZE = ABSOLUTE(fragment10_DATA_END - fragment10_DATA_START);
        fragment10_RODATA_START = .;
        build/asm/us/data/fragments/10/fragment10_header.o(.rodata);
        build/asm/us/fragments/10/fragment10_code.o(.rodata);
        fragment10_RODATA_END = .;
        fragment10_RODATA_SIZE = ABSOLUTE(fragment10_RODATA_END - fragment10_RODATA_START);
    }
    fragment10_bss_VRAM = ADDR(.fragment10_bss);
    .fragment10_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment10_BSS_START = .;
        build/asm/us/data/fragments/10/fragment10_header.o(.bss);
        build/asm/us/fragments/10/fragment10_code.o(.bss);
        fragment10_BSS_END = .;
        fragment10_BSS_SIZE = ABSOLUTE(fragment10_BSS_END - fragment10_BSS_START);
    }
    __romPos += SIZEOF(.fragment10);
    fragment10_ROM_END = __romPos;
    fragment10_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment11_ROM_START = __romPos;
    fragment11_VRAM = ADDR(.fragment11);
    .fragment11 0x81600000 : AT(fragment11_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment11_TEXT_START = .;
        build/asm/us/data/fragments/11/fragment11_header.o(.text);
        build/asm/us/fragments/11/fragment11_code.o(.text);
        fragment11_TEXT_END = .;
        fragment11_TEXT_SIZE = ABSOLUTE(fragment11_TEXT_END - fragment11_TEXT_START);
        fragment11_DATA_START = .;
        fragments_11_fragment11_header = .;
        build/asm/us/data/fragments/11/fragment11_header.o(.data);
        fragments_11_fragment11_code = .;
        build/asm/us/fragments/11/fragment11_code.o(.data);
        fragments_11_fragment11_data_data = .;
        build/asm/us/data/fragments/11/fragment11_data.data.o(.data);
        fragment11_DATA_END = .;
        fragment11_DATA_SIZE = ABSOLUTE(fragment11_DATA_END - fragment11_DATA_START);
        fragment11_RODATA_START = .;
        build/asm/us/data/fragments/11/fragment11_header.o(.rodata);
        build/asm/us/fragments/11/fragment11_code.o(.rodata);
        fragment11_RODATA_END = .;
        fragment11_RODATA_SIZE = ABSOLUTE(fragment11_RODATA_END - fragment11_RODATA_START);
    }
    fragment11_bss_VRAM = ADDR(.fragment11_bss);
    .fragment11_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment11_BSS_START = .;
        build/asm/us/data/fragments/11/fragment11_header.o(.bss);
        build/asm/us/fragments/11/fragment11_code.o(.bss);
        fragment11_BSS_END = .;
        fragment11_BSS_SIZE = ABSOLUTE(fragment11_BSS_END - fragment11_BSS_START);
    }
    __romPos += SIZEOF(.fragment11);
    fragment11_ROM_END = __romPos;
    fragment11_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment12_ROM_START = __romPos;
    fragment12_VRAM = ADDR(.fragment12);
    .fragment12 0x81400000 : AT(fragment12_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment12_TEXT_START = .;
        build/asm/us/data/fragments/12/fragment12_header.o(.text);
        build/asm/us/fragments/12/fragment12_code.o(.text);
        fragment12_TEXT_END = .;
        fragment12_TEXT_SIZE = ABSOLUTE(fragment12_TEXT_END - fragment12_TEXT_START);
        fragment12_DATA_START = .;
        fragments_12_fragment12_header = .;
        build/asm/us/data/fragments/12/fragment12_header.o(.data);
        fragments_12_fragment12_code = .;
        build/asm/us/fragments/12/fragment12_code.o(.data);
        fragments_12_fragment12_data_data = .;
        build/asm/us/data/fragments/12/fragment12_data.data.o(.data);
        fragment12_DATA_END = .;
        fragment12_DATA_SIZE = ABSOLUTE(fragment12_DATA_END - fragment12_DATA_START);
        fragment12_RODATA_START = .;
        build/asm/us/data/fragments/12/fragment12_header.o(.rodata);
        build/asm/us/fragments/12/fragment12_code.o(.rodata);
        fragment12_RODATA_END = .;
        fragment12_RODATA_SIZE = ABSOLUTE(fragment12_RODATA_END - fragment12_RODATA_START);
    }
    fragment12_bss_VRAM = ADDR(.fragment12_bss);
    .fragment12_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment12_BSS_START = .;
        build/asm/us/data/fragments/12/fragment12_header.o(.bss);
        build/asm/us/fragments/12/fragment12_code.o(.bss);
        fragment12_BSS_END = .;
        fragment12_BSS_SIZE = ABSOLUTE(fragment12_BSS_END - fragment12_BSS_START);
    }
    __romPos += SIZEOF(.fragment12);
    fragment12_ROM_END = __romPos;
    fragment12_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment13_ROM_START = __romPos;
    fragment13_VRAM = ADDR(.fragment13);
    .fragment13 0x82400000 : AT(fragment13_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment13_TEXT_START = .;
        build/asm/us/data/fragments/13/fragment13_header.o(.text);
        build/asm/us/fragments/13/fragment13_code.o(.text);
        fragment13_TEXT_END = .;
        fragment13_TEXT_SIZE = ABSOLUTE(fragment13_TEXT_END - fragment13_TEXT_START);
        fragment13_DATA_START = .;
        fragments_13_fragment13_header = .;
        build/asm/us/data/fragments/13/fragment13_header.o(.data);
        fragments_13_fragment13_code = .;
        build/asm/us/fragments/13/fragment13_code.o(.data);
        fragments_13_fragment13_data_data = .;
        build/asm/us/data/fragments/13/fragment13_data.data.o(.data);
        fragment13_DATA_END = .;
        fragment13_DATA_SIZE = ABSOLUTE(fragment13_DATA_END - fragment13_DATA_START);
        fragment13_RODATA_START = .;
        build/asm/us/data/fragments/13/fragment13_header.o(.rodata);
        build/asm/us/fragments/13/fragment13_code.o(.rodata);
        fragment13_RODATA_END = .;
        fragment13_RODATA_SIZE = ABSOLUTE(fragment13_RODATA_END - fragment13_RODATA_START);
    }
    fragment13_bss_VRAM = ADDR(.fragment13_bss);
    .fragment13_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment13_BSS_START = .;
        build/asm/us/data/fragments/13/fragment13_header.o(.bss);
        build/asm/us/fragments/13/fragment13_code.o(.bss);
        fragment13_BSS_END = .;
        fragment13_BSS_SIZE = ABSOLUTE(fragment13_BSS_END - fragment13_BSS_START);
    }
    __romPos += SIZEOF(.fragment13);
    fragment13_ROM_END = __romPos;
    fragment13_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment14_ROM_START = __romPos;
    fragment14_VRAM = ADDR(.fragment14);
    .fragment14 0x81300000 : AT(fragment14_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment14_TEXT_START = .;
        build/asm/us/data/fragments/14/fragment14_header.o(.text);
        build/asm/us/fragments/14/fragment14_code.o(.text);
        fragment14_TEXT_END = .;
        fragment14_TEXT_SIZE = ABSOLUTE(fragment14_TEXT_END - fragment14_TEXT_START);
        fragment14_DATA_START = .;
        fragments_14_fragment14_header = .;
        build/asm/us/data/fragments/14/fragment14_header.o(.data);
        fragments_14_fragment14_code = .;
        build/asm/us/fragments/14/fragment14_code.o(.data);
        fragments_14_fragment14_data_data = .;
        build/asm/us/data/fragments/14/fragment14_data.data.o(.data);
        fragment14_DATA_END = .;
        fragment14_DATA_SIZE = ABSOLUTE(fragment14_DATA_END - fragment14_DATA_START);
        fragment14_RODATA_START = .;
        build/asm/us/data/fragments/14/fragment14_header.o(.rodata);
        build/asm/us/fragments/14/fragment14_code.o(.rodata);
        fragment14_RODATA_END = .;
        fragment14_RODATA_SIZE = ABSOLUTE(fragment14_RODATA_END - fragment14_RODATA_START);
    }
    fragment14_bss_VRAM = ADDR(.fragment14_bss);
    .fragment14_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment14_BSS_START = .;
        build/asm/us/data/fragments/14/fragment14_header.o(.bss);
        build/asm/us/fragments/14/fragment14_code.o(.bss);
        fragment14_BSS_END = .;
        fragment14_BSS_SIZE = ABSOLUTE(fragment14_BSS_END - fragment14_BSS_START);
    }
    __romPos += SIZEOF(.fragment14);
    fragment14_ROM_END = __romPos;
    fragment14_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment15_ROM_START = __romPos;
    fragment15_VRAM = ADDR(.fragment15);
    .fragment15 0x83F00000 : AT(fragment15_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment15_TEXT_START = .;
        build/asm/us/data/fragments/15/fragment15_header.o(.text);
        build/asm/us/fragments/15/fragment15_code.o(.text);
        fragment15_TEXT_END = .;
        fragment15_TEXT_SIZE = ABSOLUTE(fragment15_TEXT_END - fragment15_TEXT_START);
        fragment15_DATA_START = .;
        fragments_15_fragment15_header = .;
        build/asm/us/data/fragments/15/fragment15_header.o(.data);
        fragments_15_fragment15_code = .;
        build/asm/us/fragments/15/fragment15_code.o(.data);
        fragments_15_fragment15_data_data = .;
        build/asm/us/data/fragments/15/fragment15_data.data.o(.data);
        fragment15_DATA_END = .;
        fragment15_DATA_SIZE = ABSOLUTE(fragment15_DATA_END - fragment15_DATA_START);
        fragment15_RODATA_START = .;
        build/asm/us/data/fragments/15/fragment15_header.o(.rodata);
        build/asm/us/fragments/15/fragment15_code.o(.rodata);
        fragment15_RODATA_END = .;
        fragment15_RODATA_SIZE = ABSOLUTE(fragment15_RODATA_END - fragment15_RODATA_START);
    }
    fragment15_bss_VRAM = ADDR(.fragment15_bss);
    .fragment15_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment15_BSS_START = .;
        build/asm/us/data/fragments/15/fragment15_header.o(.bss);
        build/asm/us/fragments/15/fragment15_code.o(.bss);
        fragment15_BSS_END = .;
        fragment15_BSS_SIZE = ABSOLUTE(fragment15_BSS_END - fragment15_BSS_START);
    }
    __romPos += SIZEOF(.fragment15);
    fragment15_ROM_END = __romPos;
    fragment15_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment16_ROM_START = __romPos;
    fragment16_VRAM = ADDR(.fragment16);
    .fragment16 0x82000000 : AT(fragment16_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment16_TEXT_START = .;
        build/asm/us/data/fragments/16/fragment16_header.o(.text);
        build/asm/us/fragments/16/fragment16_code.o(.text);
        fragment16_TEXT_END = .;
        fragment16_TEXT_SIZE = ABSOLUTE(fragment16_TEXT_END - fragment16_TEXT_START);
        fragment16_DATA_START = .;
        fragments_16_fragment16_header = .;
        build/asm/us/data/fragments/16/fragment16_header.o(.data);
        fragments_16_fragment16_code = .;
        build/asm/us/fragments/16/fragment16_code.o(.data);
        fragments_16_fragment16_data_data = .;
        build/asm/us/data/fragments/16/fragment16_data.data.o(.data);
        fragment16_DATA_END = .;
        fragment16_DATA_SIZE = ABSOLUTE(fragment16_DATA_END - fragment16_DATA_START);
        fragment16_RODATA_START = .;
        build/asm/us/data/fragments/16/fragment16_header.o(.rodata);
        build/asm/us/fragments/16/fragment16_code.o(.rodata);
        fragment16_RODATA_END = .;
        fragment16_RODATA_SIZE = ABSOLUTE(fragment16_RODATA_END - fragment16_RODATA_START);
    }
    fragment16_bss_VRAM = ADDR(.fragment16_bss);
    .fragment16_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment16_BSS_START = .;
        build/asm/us/data/fragments/16/fragment16_header.o(.bss);
        build/asm/us/fragments/16/fragment16_code.o(.bss);
        fragment16_BSS_END = .;
        fragment16_BSS_SIZE = ABSOLUTE(fragment16_BSS_END - fragment16_BSS_START);
    }
    __romPos += SIZEOF(.fragment16);
    fragment16_ROM_END = __romPos;
    fragment16_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment17_ROM_START = __romPos;
    fragment17_VRAM = ADDR(.fragment17);
    .fragment17 0x82200000 : AT(fragment17_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment17_TEXT_START = .;
        build/asm/us/data/fragments/17/fragment17_header.o(.text);
        build/asm/us/fragments/17/fragment17_code.o(.text);
        fragment17_TEXT_END = .;
        fragment17_TEXT_SIZE = ABSOLUTE(fragment17_TEXT_END - fragment17_TEXT_START);
        fragment17_DATA_START = .;
        fragments_17_fragment17_header = .;
        build/asm/us/data/fragments/17/fragment17_header.o(.data);
        fragments_17_fragment17_code = .;
        build/asm/us/fragments/17/fragment17_code.o(.data);
        fragments_17_fragment17_data_data = .;
        build/asm/us/data/fragments/17/fragment17_data.data.o(.data);
        fragment17_DATA_END = .;
        fragment17_DATA_SIZE = ABSOLUTE(fragment17_DATA_END - fragment17_DATA_START);
        fragment17_RODATA_START = .;
        build/asm/us/data/fragments/17/fragment17_header.o(.rodata);
        build/asm/us/fragments/17/fragment17_code.o(.rodata);
        fragment17_RODATA_END = .;
        fragment17_RODATA_SIZE = ABSOLUTE(fragment17_RODATA_END - fragment17_RODATA_START);
    }
    fragment17_bss_VRAM = ADDR(.fragment17_bss);
    .fragment17_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment17_BSS_START = .;
        build/asm/us/data/fragments/17/fragment17_header.o(.bss);
        build/asm/us/fragments/17/fragment17_code.o(.bss);
        fragment17_BSS_END = .;
        fragment17_BSS_SIZE = ABSOLUTE(fragment17_BSS_END - fragment17_BSS_START);
    }
    __romPos += SIZEOF(.fragment17);
    fragment17_ROM_END = __romPos;
    fragment17_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment18_ROM_START = __romPos;
    fragment18_VRAM = ADDR(.fragment18);
    .fragment18 0x81700000 : AT(fragment18_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment18_TEXT_START = .;
        build/asm/us/data/fragments/18/fragment18_header.o(.text);
        build/asm/us/fragments/18/fragment18_code.o(.text);
        fragment18_TEXT_END = .;
        fragment18_TEXT_SIZE = ABSOLUTE(fragment18_TEXT_END - fragment18_TEXT_START);
        fragment18_DATA_START = .;
        fragments_18_fragment18_header = .;
        build/asm/us/data/fragments/18/fragment18_header.o(.data);
        fragments_18_fragment18_code = .;
        build/asm/us/fragments/18/fragment18_code.o(.data);
        fragments_18_fragment18_data_data = .;
        build/asm/us/data/fragments/18/fragment18_data.data.o(.data);
        fragment18_DATA_END = .;
        fragment18_DATA_SIZE = ABSOLUTE(fragment18_DATA_END - fragment18_DATA_START);
        fragment18_RODATA_START = .;
        build/asm/us/data/fragments/18/fragment18_header.o(.rodata);
        build/asm/us/fragments/18/fragment18_code.o(.rodata);
        fragment18_RODATA_END = .;
        fragment18_RODATA_SIZE = ABSOLUTE(fragment18_RODATA_END - fragment18_RODATA_START);
    }
    fragment18_bss_VRAM = ADDR(.fragment18_bss);
    .fragment18_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment18_BSS_START = .;
        build/asm/us/data/fragments/18/fragment18_header.o(.bss);
        build/asm/us/fragments/18/fragment18_code.o(.bss);
        fragment18_BSS_END = .;
        fragment18_BSS_SIZE = ABSOLUTE(fragment18_BSS_END - fragment18_BSS_START);
    }
    __romPos += SIZEOF(.fragment18);
    fragment18_ROM_END = __romPos;
    fragment18_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment19_ROM_START = __romPos;
    fragment19_VRAM = ADDR(.fragment19);
    .fragment19 0x82300000 : AT(fragment19_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment19_TEXT_START = .;
        build/asm/us/data/fragments/19/fragment19_header.o(.text);
        build/asm/us/fragments/19/fragment19_code.o(.text);
        fragment19_TEXT_END = .;
        fragment19_TEXT_SIZE = ABSOLUTE(fragment19_TEXT_END - fragment19_TEXT_START);
        fragment19_DATA_START = .;
        fragments_19_fragment19_header = .;
        build/asm/us/data/fragments/19/fragment19_header.o(.data);
        fragments_19_fragment19_code = .;
        build/asm/us/fragments/19/fragment19_code.o(.data);
        fragments_19_fragment19_data_data = .;
        build/asm/us/data/fragments/19/fragment19_data.data.o(.data);
        fragment19_DATA_END = .;
        fragment19_DATA_SIZE = ABSOLUTE(fragment19_DATA_END - fragment19_DATA_START);
        fragment19_RODATA_START = .;
        build/asm/us/data/fragments/19/fragment19_header.o(.rodata);
        build/asm/us/fragments/19/fragment19_code.o(.rodata);
        fragment19_RODATA_END = .;
        fragment19_RODATA_SIZE = ABSOLUTE(fragment19_RODATA_END - fragment19_RODATA_START);
    }
    fragment19_bss_VRAM = ADDR(.fragment19_bss);
    .fragment19_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment19_BSS_START = .;
        build/asm/us/data/fragments/19/fragment19_header.o(.bss);
        build/asm/us/fragments/19/fragment19_code.o(.bss);
        fragment19_BSS_END = .;
        fragment19_BSS_SIZE = ABSOLUTE(fragment19_BSS_END - fragment19_BSS_START);
    }
    __romPos += SIZEOF(.fragment19);
    fragment19_ROM_END = __romPos;
    fragment19_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment20_ROM_START = __romPos;
    fragment20_VRAM = ADDR(.fragment20);
    .fragment20 0x82600000 : AT(fragment20_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment20_TEXT_START = .;
        build/asm/us/data/fragments/20/fragment20_header.o(.text);
        build/asm/us/fragments/20/fragment20_code.o(.text);
        fragment20_TEXT_END = .;
        fragment20_TEXT_SIZE = ABSOLUTE(fragment20_TEXT_END - fragment20_TEXT_START);
        fragment20_DATA_START = .;
        fragments_20_fragment20_header = .;
        build/asm/us/data/fragments/20/fragment20_header.o(.data);
        fragments_20_fragment20_code = .;
        build/asm/us/fragments/20/fragment20_code.o(.data);
        fragments_20_fragment20_data_data = .;
        build/asm/us/data/fragments/20/fragment20_data.data.o(.data);
        fragment20_DATA_END = .;
        fragment20_DATA_SIZE = ABSOLUTE(fragment20_DATA_END - fragment20_DATA_START);
        fragment20_RODATA_START = .;
        build/asm/us/data/fragments/20/fragment20_header.o(.rodata);
        build/asm/us/fragments/20/fragment20_code.o(.rodata);
        fragment20_RODATA_END = .;
        fragment20_RODATA_SIZE = ABSOLUTE(fragment20_RODATA_END - fragment20_RODATA_START);
    }
    fragment20_bss_VRAM = ADDR(.fragment20_bss);
    .fragment20_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment20_BSS_START = .;
        build/asm/us/data/fragments/20/fragment20_header.o(.bss);
        build/asm/us/fragments/20/fragment20_code.o(.bss);
        fragment20_BSS_END = .;
        fragment20_BSS_SIZE = ABSOLUTE(fragment20_BSS_END - fragment20_BSS_START);
    }
    __romPos += SIZEOF(.fragment20);
    fragment20_ROM_END = __romPos;
    fragment20_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment21_ROM_START = __romPos;
    fragment21_VRAM = ADDR(.fragment21);
    .fragment21 0x82500000 : AT(fragment21_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment21_TEXT_START = .;
        build/asm/us/data/fragments/21/fragment21_header.o(.text);
        build/asm/us/fragments/21/fragment21_code.o(.text);
        fragment21_TEXT_END = .;
        fragment21_TEXT_SIZE = ABSOLUTE(fragment21_TEXT_END - fragment21_TEXT_START);
        fragment21_DATA_START = .;
        fragments_21_fragment21_header = .;
        build/asm/us/data/fragments/21/fragment21_header.o(.data);
        fragments_21_fragment21_code = .;
        build/asm/us/fragments/21/fragment21_code.o(.data);
        fragments_21_fragment21_data_data = .;
        build/asm/us/data/fragments/21/fragment21_data.data.o(.data);
        fragment21_DATA_END = .;
        fragment21_DATA_SIZE = ABSOLUTE(fragment21_DATA_END - fragment21_DATA_START);
        fragment21_RODATA_START = .;
        build/asm/us/data/fragments/21/fragment21_header.o(.rodata);
        build/asm/us/fragments/21/fragment21_code.o(.rodata);
        fragment21_RODATA_END = .;
        fragment21_RODATA_SIZE = ABSOLUTE(fragment21_RODATA_END - fragment21_RODATA_START);
    }
    fragment21_bss_VRAM = ADDR(.fragment21_bss);
    .fragment21_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment21_BSS_START = .;
        build/asm/us/data/fragments/21/fragment21_header.o(.bss);
        build/asm/us/fragments/21/fragment21_code.o(.bss);
        fragment21_BSS_END = .;
        fragment21_BSS_SIZE = ABSOLUTE(fragment21_BSS_END - fragment21_BSS_START);
    }
    __romPos += SIZEOF(.fragment21);
    fragment21_ROM_END = __romPos;
    fragment21_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment22_ROM_START = __romPos;
    fragment22_VRAM = ADDR(.fragment22);
    .fragment22 0x82700000 : AT(fragment22_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment22_TEXT_START = .;
        build/asm/us/data/fragments/22/fragment22_header.o(.text);
        build/asm/us/fragments/22/fragment22_code.o(.text);
        fragment22_TEXT_END = .;
        fragment22_TEXT_SIZE = ABSOLUTE(fragment22_TEXT_END - fragment22_TEXT_START);
        fragment22_DATA_START = .;
        fragments_22_fragment22_header = .;
        build/asm/us/data/fragments/22/fragment22_header.o(.data);
        fragments_22_fragment22_code = .;
        build/asm/us/fragments/22/fragment22_code.o(.data);
        fragments_22_fragment22_data_data = .;
        build/asm/us/data/fragments/22/fragment22_data.data.o(.data);
        fragment22_DATA_END = .;
        fragment22_DATA_SIZE = ABSOLUTE(fragment22_DATA_END - fragment22_DATA_START);
        fragment22_RODATA_START = .;
        build/asm/us/data/fragments/22/fragment22_header.o(.rodata);
        build/asm/us/fragments/22/fragment22_code.o(.rodata);
        fragment22_RODATA_END = .;
        fragment22_RODATA_SIZE = ABSOLUTE(fragment22_RODATA_END - fragment22_RODATA_START);
    }
    fragment22_bss_VRAM = ADDR(.fragment22_bss);
    .fragment22_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment22_BSS_START = .;
        build/asm/us/data/fragments/22/fragment22_header.o(.bss);
        build/asm/us/fragments/22/fragment22_code.o(.bss);
        fragment22_BSS_END = .;
        fragment22_BSS_SIZE = ABSOLUTE(fragment22_BSS_END - fragment22_BSS_START);
    }
    __romPos += SIZEOF(.fragment22);
    fragment22_ROM_END = __romPos;
    fragment22_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment23_ROM_START = __romPos;
    fragment23_VRAM = ADDR(.fragment23);
    .fragment23 0x82A00000 : AT(fragment23_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment23_TEXT_START = .;
        build/asm/us/data/fragments/23/fragment23_header.o(.text);
        build/asm/us/fragments/23/fragment23_code.o(.text);
        fragment23_TEXT_END = .;
        fragment23_TEXT_SIZE = ABSOLUTE(fragment23_TEXT_END - fragment23_TEXT_START);
        fragment23_DATA_START = .;
        fragments_23_fragment23_header = .;
        build/asm/us/data/fragments/23/fragment23_header.o(.data);
        fragments_23_fragment23_code = .;
        build/asm/us/fragments/23/fragment23_code.o(.data);
        fragments_23_fragment23_data_data = .;
        build/asm/us/data/fragments/23/fragment23_data.data.o(.data);
        fragment23_DATA_END = .;
        fragment23_DATA_SIZE = ABSOLUTE(fragment23_DATA_END - fragment23_DATA_START);
        fragment23_RODATA_START = .;
        build/asm/us/data/fragments/23/fragment23_header.o(.rodata);
        build/asm/us/fragments/23/fragment23_code.o(.rodata);
        fragment23_RODATA_END = .;
        fragment23_RODATA_SIZE = ABSOLUTE(fragment23_RODATA_END - fragment23_RODATA_START);
    }
    fragment23_bss_VRAM = ADDR(.fragment23_bss);
    .fragment23_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment23_BSS_START = .;
        build/asm/us/data/fragments/23/fragment23_header.o(.bss);
        build/asm/us/fragments/23/fragment23_code.o(.bss);
        fragment23_BSS_END = .;
        fragment23_BSS_SIZE = ABSOLUTE(fragment23_BSS_END - fragment23_BSS_START);
    }
    __romPos += SIZEOF(.fragment23);
    fragment23_ROM_END = __romPos;
    fragment23_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment24_ROM_START = __romPos;
    fragment24_VRAM = ADDR(.fragment24);
    .fragment24 0x82B00000 : AT(fragment24_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment24_TEXT_START = .;
        build/asm/us/data/fragments/24/fragment24_header.o(.text);
        build/asm/us/fragments/24/fragment24_code.o(.text);
        fragment24_TEXT_END = .;
        fragment24_TEXT_SIZE = ABSOLUTE(fragment24_TEXT_END - fragment24_TEXT_START);
        fragment24_DATA_START = .;
        fragments_24_fragment24_header = .;
        build/asm/us/data/fragments/24/fragment24_header.o(.data);
        fragments_24_fragment24_code = .;
        build/asm/us/fragments/24/fragment24_code.o(.data);
        fragments_24_fragment24_data_data = .;
        build/asm/us/data/fragments/24/fragment24_data.data.o(.data);
        fragment24_DATA_END = .;
        fragment24_DATA_SIZE = ABSOLUTE(fragment24_DATA_END - fragment24_DATA_START);
        fragment24_RODATA_START = .;
        build/asm/us/data/fragments/24/fragment24_header.o(.rodata);
        build/asm/us/fragments/24/fragment24_code.o(.rodata);
        fragment24_RODATA_END = .;
        fragment24_RODATA_SIZE = ABSOLUTE(fragment24_RODATA_END - fragment24_RODATA_START);
    }
    fragment24_bss_VRAM = ADDR(.fragment24_bss);
    .fragment24_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment24_BSS_START = .;
        build/asm/us/data/fragments/24/fragment24_header.o(.bss);
        build/asm/us/fragments/24/fragment24_code.o(.bss);
        fragment24_BSS_END = .;
        fragment24_BSS_SIZE = ABSOLUTE(fragment24_BSS_END - fragment24_BSS_START);
    }
    __romPos += SIZEOF(.fragment24);
    fragment24_ROM_END = __romPos;
    fragment24_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment25_ROM_START = __romPos;
    fragment25_VRAM = ADDR(.fragment25);
    .fragment25 0x82100000 : AT(fragment25_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment25_TEXT_START = .;
        build/asm/us/data/fragments/25/fragment25_header.o(.text);
        build/asm/us/fragments/25/fragment25_code.o(.text);
        fragment25_TEXT_END = .;
        fragment25_TEXT_SIZE = ABSOLUTE(fragment25_TEXT_END - fragment25_TEXT_START);
        fragment25_DATA_START = .;
        fragments_25_fragment25_header = .;
        build/asm/us/data/fragments/25/fragment25_header.o(.data);
        fragments_25_fragment25_code = .;
        build/asm/us/fragments/25/fragment25_code.o(.data);
        fragments_25_fragment25_data_data = .;
        build/asm/us/data/fragments/25/fragment25_data.data.o(.data);
        fragment25_DATA_END = .;
        fragment25_DATA_SIZE = ABSOLUTE(fragment25_DATA_END - fragment25_DATA_START);
        fragment25_RODATA_START = .;
        build/asm/us/data/fragments/25/fragment25_header.o(.rodata);
        build/asm/us/fragments/25/fragment25_code.o(.rodata);
        fragment25_RODATA_END = .;
        fragment25_RODATA_SIZE = ABSOLUTE(fragment25_RODATA_END - fragment25_RODATA_START);
    }
    fragment25_bss_VRAM = ADDR(.fragment25_bss);
    .fragment25_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment25_BSS_START = .;
        build/asm/us/data/fragments/25/fragment25_header.o(.bss);
        build/asm/us/fragments/25/fragment25_code.o(.bss);
        fragment25_BSS_END = .;
        fragment25_BSS_SIZE = ABSOLUTE(fragment25_BSS_END - fragment25_BSS_START);
    }
    __romPos += SIZEOF(.fragment25);
    fragment25_ROM_END = __romPos;
    fragment25_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment26_ROM_START = __romPos;
    fragment26_VRAM = ADDR(.fragment26);
    .fragment26 0x81000000 : AT(fragment26_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment26_TEXT_START = .;
        build/asm/us/data/fragments/26/fragment26_header.o(.text);
        build/asm/us/data/fragments/26/fragment26_unk_table.o(.text);
        build/asm/us/fragments/26/fragment26_code.o(.text);
        fragment26_TEXT_END = .;
        fragment26_TEXT_SIZE = ABSOLUTE(fragment26_TEXT_END - fragment26_TEXT_START);
        fragment26_DATA_START = .;
        fragments_26_fragment26_header = .;
        build/asm/us/data/fragments/26/fragment26_header.o(.data);
        fragments_26_fragment26_unk_table = .;
        build/asm/us/data/fragments/26/fragment26_unk_table.o(.data);
        fragments_26_fragment26_code = .;
        build/asm/us/fragments/26/fragment26_code.o(.data);
        fragments_26_fragment26_data_data = .;
        build/asm/us/data/fragments/26/fragment26_data.data.o(.data);
        fragment26_DATA_END = .;
        fragment26_DATA_SIZE = ABSOLUTE(fragment26_DATA_END - fragment26_DATA_START);
        fragment26_RODATA_START = .;
        build/asm/us/data/fragments/26/fragment26_header.o(.rodata);
        build/asm/us/data/fragments/26/fragment26_unk_table.o(.rodata);
        build/asm/us/fragments/26/fragment26_code.o(.rodata);
        fragment26_RODATA_END = .;
        fragment26_RODATA_SIZE = ABSOLUTE(fragment26_RODATA_END - fragment26_RODATA_START);
    }
    fragment26_bss_VRAM = ADDR(.fragment26_bss);
    .fragment26_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment26_BSS_START = .;
        build/asm/us/data/fragments/26/fragment26_header.o(.bss);
        build/asm/us/data/fragments/26/fragment26_unk_table.o(.bss);
        build/asm/us/fragments/26/fragment26_code.o(.bss);
        fragment26_BSS_END = .;
        fragment26_BSS_SIZE = ABSOLUTE(fragment26_BSS_END - fragment26_BSS_START);
    }
    __romPos += SIZEOF(.fragment26);
    fragment26_ROM_END = __romPos;
    fragment26_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment27_ROM_START = __romPos;
    fragment27_VRAM = ADDR(.fragment27);
    .fragment27 0x81100000 : AT(fragment27_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment27_TEXT_START = .;
        build/asm/us/data/fragments/27/fragment27_header.o(.text);
        build/asm/us/fragments/27/fragment27_code.o(.text);
        fragment27_TEXT_END = .;
        fragment27_TEXT_SIZE = ABSOLUTE(fragment27_TEXT_END - fragment27_TEXT_START);
        fragment27_DATA_START = .;
        fragments_27_fragment27_header = .;
        build/asm/us/data/fragments/27/fragment27_header.o(.data);
        fragments_27_fragment27_code = .;
        build/asm/us/fragments/27/fragment27_code.o(.data);
        fragment27_DATA_END = .;
        fragment27_DATA_SIZE = ABSOLUTE(fragment27_DATA_END - fragment27_DATA_START);
        fragment27_RODATA_START = .;
        build/asm/us/data/fragments/27/fragment27_header.o(.rodata);
        build/asm/us/fragments/27/fragment27_code.o(.rodata);
        fragment27_RODATA_END = .;
        fragment27_RODATA_SIZE = ABSOLUTE(fragment27_RODATA_END - fragment27_RODATA_START);
    }
    fragment27_bss_VRAM = ADDR(.fragment27_bss);
    .fragment27_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment27_BSS_START = .;
        build/asm/us/data/fragments/27/fragment27_header.o(.bss);
        build/asm/us/fragments/27/fragment27_code.o(.bss);
        fragment27_BSS_END = .;
        fragment27_BSS_SIZE = ABSOLUTE(fragment27_BSS_END - fragment27_BSS_START);
    }
    __romPos += SIZEOF(.fragment27);
    fragment27_ROM_END = __romPos;
    fragment27_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment28_ROM_START = __romPos;
    fragment28_VRAM = ADDR(.fragment28);
    .fragment28 0x80000000 : AT(fragment28_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment28_TEXT_START = .;
        build/asm/us/data/fragments/28/fragment28_header.o(.text);
        build/asm/us/fragments/28/fragment28_code.o(.text);
        fragment28_TEXT_END = .;
        fragment28_TEXT_SIZE = ABSOLUTE(fragment28_TEXT_END - fragment28_TEXT_START);
        fragment28_DATA_START = .;
        fragments_28_fragment28_header = .;
        build/asm/us/data/fragments/28/fragment28_header.o(.data);
        fragments_28_fragment28_code = .;
        build/asm/us/fragments/28/fragment28_code.o(.data);
        fragments_28_fragment28_data_data = .;
        build/asm/us/data/fragments/28/fragment28_data.data.o(.data);
        fragment28_DATA_END = .;
        fragment28_DATA_SIZE = ABSOLUTE(fragment28_DATA_END - fragment28_DATA_START);
        fragment28_RODATA_START = .;
        build/asm/us/data/fragments/28/fragment28_header.o(.rodata);
        build/asm/us/fragments/28/fragment28_code.o(.rodata);
        fragment28_RODATA_END = .;
        fragment28_RODATA_SIZE = ABSOLUTE(fragment28_RODATA_END - fragment28_RODATA_START);
    }
    fragment28_bss_VRAM = ADDR(.fragment28_bss);
    .fragment28_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment28_BSS_START = .;
        build/asm/us/data/fragments/28/fragment28_header.o(.bss);
        build/asm/us/fragments/28/fragment28_code.o(.bss);
        fragment28_BSS_END = .;
        fragment28_BSS_SIZE = ABSOLUTE(fragment28_BSS_END - fragment28_BSS_START);
    }
    __romPos += SIZEOF(.fragment28);
    fragment28_ROM_END = __romPos;
    fragment28_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment29_ROM_START = __romPos;
    fragment29_VRAM = ADDR(.fragment29);
    .fragment29 0x88000000 : AT(fragment29_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment29_TEXT_START = .;
        build/asm/us/data/fragments/29/fragment29_header.o(.text);
        build/asm/us/fragments/29/fragment29_code.o(.text);
        fragment29_TEXT_END = .;
        fragment29_TEXT_SIZE = ABSOLUTE(fragment29_TEXT_END - fragment29_TEXT_START);
        fragment29_DATA_START = .;
        fragments_29_fragment29_header = .;
        build/asm/us/data/fragments/29/fragment29_header.o(.data);
        fragments_29_fragment29_code = .;
        build/asm/us/fragments/29/fragment29_code.o(.data);
        fragments_29_fragment29_data_data = .;
        build/asm/us/data/fragments/29/fragment29_data.data.o(.data);
        fragment29_DATA_END = .;
        fragment29_DATA_SIZE = ABSOLUTE(fragment29_DATA_END - fragment29_DATA_START);
        fragment29_RODATA_START = .;
        build/asm/us/data/fragments/29/fragment29_header.o(.rodata);
        build/asm/us/fragments/29/fragment29_code.o(.rodata);
        fragment29_RODATA_END = .;
        fragment29_RODATA_SIZE = ABSOLUTE(fragment29_RODATA_END - fragment29_RODATA_START);
    }
    fragment29_bss_VRAM = ADDR(.fragment29_bss);
    .fragment29_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment29_BSS_START = .;
        build/asm/us/data/fragments/29/fragment29_header.o(.bss);
        build/asm/us/fragments/29/fragment29_code.o(.bss);
        fragment29_BSS_END = .;
        fragment29_BSS_SIZE = ABSOLUTE(fragment29_BSS_END - fragment29_BSS_START);
    }
    __romPos += SIZEOF(.fragment29);
    fragment29_ROM_END = __romPos;
    fragment29_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment30_ROM_START = __romPos;
    fragment30_VRAM = ADDR(.fragment30);
    .fragment30 0x88A00000 : AT(fragment30_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment30_TEXT_START = .;
        build/asm/us/data/fragments/30/fragment30_header.o(.text);
        build/asm/us/fragments/30/fragment30_code.o(.text);
        fragment30_TEXT_END = .;
        fragment30_TEXT_SIZE = ABSOLUTE(fragment30_TEXT_END - fragment30_TEXT_START);
        fragment30_DATA_START = .;
        fragments_30_fragment30_header = .;
        build/asm/us/data/fragments/30/fragment30_header.o(.data);
        fragments_30_fragment30_code = .;
        build/asm/us/fragments/30/fragment30_code.o(.data);
        fragments_30_fragment30_data_data = .;
        build/asm/us/data/fragments/30/fragment30_data.data.o(.data);
        fragment30_DATA_END = .;
        fragment30_DATA_SIZE = ABSOLUTE(fragment30_DATA_END - fragment30_DATA_START);
        fragment30_RODATA_START = .;
        build/asm/us/data/fragments/30/fragment30_header.o(.rodata);
        build/asm/us/fragments/30/fragment30_code.o(.rodata);
        fragment30_RODATA_END = .;
        fragment30_RODATA_SIZE = ABSOLUTE(fragment30_RODATA_END - fragment30_RODATA_START);
    }
    fragment30_bss_VRAM = ADDR(.fragment30_bss);
    .fragment30_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment30_BSS_START = .;
        build/asm/us/data/fragments/30/fragment30_header.o(.bss);
        build/asm/us/fragments/30/fragment30_code.o(.bss);
        fragment30_BSS_END = .;
        fragment30_BSS_SIZE = ABSOLUTE(fragment30_BSS_END - fragment30_BSS_START);
    }
    __romPos += SIZEOF(.fragment30);
    fragment30_ROM_END = __romPos;
    fragment30_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    _173280_ROM_START = __romPos;
    _173280_VRAM = ADDR(._173280);
    ._173280 : AT(_173280_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        _173280_DATA_START = .;
        _173280 = .;
        build/assets/us/173280.o(.data);
        _173280_DATA_END = .;
        _173280_DATA_SIZE = ABSOLUTE(_173280_DATA_END - _173280_DATA_START);
    }
    __romPos += SIZEOF(._173280);
    _173280_ROM_END = __romPos;
    _173280_VRAM_END = .;

    _437600_ROM_START = __romPos;
    _437600_VRAM = ADDR(._437600);
    ._437600 : AT(_437600_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        _437600_DATA_START = .;
        _437600 = .;
        build/assets/us/437600.o(.data);
        _437600_DATA_END = .;
        _437600_DATA_SIZE = ABSOLUTE(_437600_DATA_END - _437600_DATA_START);
    }
    __romPos += SIZEOF(._437600);
    _437600_ROM_END = __romPos;
    _437600_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
