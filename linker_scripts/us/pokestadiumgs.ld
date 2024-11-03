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
        build/asm/us/libultra/os/sendmesg.o(.text);
        build/asm/us/libultra/os/stopthread.o(.text);
        build/asm/us/libultra/os/recvmesg.o(.text);
        build/asm/us/libultra/os/setintmask.o(.text);
        build/asm/us/libultra/mgu/scale.o(.text);
        build/asm/us/libultra/gu/sinf.o(.text);
        build/asm/us/libultra/io/sptask.o(.text);
        build/asm/us/libultra/os/destroythread.o(.text);
        build/asm/us/libultra/libc/ll.o(.text);
        build/asm/us/libultra/os/exceptasm.o(.text);
        build/asm/us/libultra/os/thread.o(.text);
        build/asm/us/libultra/mgu/scalef.o(.text);
        build/asm/us/libultra/libc/bzero.o(.text);
        build/asm/us/libultra/io/gbpakcheckconnector.o(.text);
        build/asm/us/libultra/io/gbpakpower.o(.text);
        build/asm/us/libultra/io/controller.o(.text);
        build/asm/us/76B50.o(.text);
        build/asm/us/libultra/flash/flashsectorerase.o(.text);
        build/asm/us/libultra/os/initialize.o(.text);
        build/asm/us/libultra/os/initialize_emu.o(.text);
        build/asm/us/libultra/os/initialize_msp.o(.text);
        build/asm/us/libultra/os/initialize_isv.o(.text);
        build/asm/us/libultra/io/piread.o(.text);
        build/asm/us/libultra/io/piacs.o(.text);
        build/asm/us/libultra/os/createthread.o(.text);
        build/asm/us/77F10.o(.text);
        build/asm/us/libultra/io/contreaddata.o(.text);
        build/asm/us/libultra/io/conteeplongread.o(.text);
        build/asm/us/libultra/os/virtualtophysical.o(.text);
        build/asm/us/libultra/os/setsr.o(.text);
        build/asm/us/libultra/os/getsr.o(.text);
        build/asm/us/libultra/os/writebackdcache.o(.text);
        build/asm/us/libultra/io/gbpakinit.o(.text);
        build/asm/us/libultra/io/pfsgetstatus.o(.text);
        build/asm/us/libultra/gu/perspective.o(.text);
        build/asm/us/libultra/io/sprawdma.o(.text);
        build/asm/us/libultra/io/sirawdma.o(.text);
        build/asm/us/libultra/io/epilinkhandle.o(.text);
        build/asm/us/78BB0.o(.text);
        build/asm/us/78EC0.o(.text);
        build/asm/us/libultra/io/sprawread.o(.text);
        build/asm/us/libultra/io/pirawread.o(.text);
        build/asm/us/libultra/io/sptaskyield.o(.text);
        build/asm/us/libultra/gu/lookatref.o(.text);
        build/asm/us/libultra/mgu/mtxidentf.o(.text);
        build/asm/us/79510.o(.text);
        build/asm/us/libultra/io/visetmode.o(.text);
        build/asm/us/79640.o(.text);
        build/asm/us/796B0.o(.text);
        build/asm/us/79750.o(.text);
        build/asm/us/798B0.o(.text);
        build/asm/us/libultra/flash/flashreadid.o(.text);
        build/asm/us/libultra/io/pfsisplug.o(.text);
        build/asm/us/libultra/os/probetlb.o(.text);
        build/asm/us/libultra/io/pimgr.o(.text);
        build/asm/us/libultra/io/devmgr.o(.text);
        build/asm/us/libultra/io/pirawdma.o(.text);
        build/asm/us/libultra/os/getcount.o(.text);
        build/asm/us/libultra/io/conteepprobe.o(.text);
        build/asm/us/libultra/io/conteepwrite.o(.text);
        build/asm/us/libultra/io/conteepread.o(.text);
        build/asm/us/libultra/flash/flashreadstatus.o(.text);
        build/asm/us/libultra/os/getmemsize.o(.text);
        build/asm/us/libultra/io/contpfs.o(.text);
        build/asm/us/libultra/os/seteventmesg.o(.text);
        build/asm/us/libultra/gu/sqrtf.o(.text);
        build/asm/us/7BAD0.o(.text);
        build/asm/us/libultra/mgu/mtxxfmf.o(.text);
        build/asm/us/libultra/gu/random.o(.text);
        build/asm/us/libultra/libc/xprintf.o(.text);
        build/asm/us/libultra/io/gbpakgetstatus.o(.text);
        build/asm/us/libultra/libc/sprintf.o(.text);
        build/asm/us/libultra/os/unmaptlball.o(.text);
        build/asm/us/libultra/io/epidma.o(.text);
        build/asm/us/7CBA0.o(.text);
        build/asm/us/libultra/libc/string.o(.text);
        build/asm/us/libultra/os/createmesgqueue.o(.text);
        build/asm/us/libultra/os/invaldcache.o(.text);
        build/asm/us/libultra/os/invalicache.o(.text);
        build/asm/us/7CE60.o(.text);
        build/asm/us/libultra/os/initialize_kmc.o(.text);
        build/asm/us/libultra/io/conteeplongwrite.o(.text);
        build/asm/us/libultra/io/sp.o(.text);
        build/asm/us/libultra/io/si.o(.text);
        build/asm/us/libultra/mgu/translatef.o(.text);
        build/asm/us/libultra/os/jammesg.o(.text);
        build/asm/us/libultra/os/setthreadpri.o(.text);
        build/asm/us/libultra/os/getthreadpri.o(.text);
        build/asm/us/libultra/io/epirawread.o(.text);
        build/asm/us/libultra/io/viswapbuf.o(.text);
        build/asm/us/libultra/mgu/mtxcatf.o(.text);
        build/asm/us/libultra/mgu/mtxcatl.o(.text);
        build/asm/us/libultra/mgu/mtxl2f.o(.text);
        build/asm/us/libultra/io/epirawdma.o(.text);
        build/asm/us/libultra/io/sptaskyielded.o(.text);
        build/asm/us/libultra/gu/rotaterpy.o(.text);
        build/asm/us/libultra/libc/bcmp.o(.text);
        build/asm/us/libultra/os/gettime.o(.text);
        build/asm/us/7E250.o(.text);
        build/asm/us/libultra/gu/rotate.o(.text);
        build/asm/us/libultra/os/setglobalintmask.o(.text);
        build/asm/us/libultra/io/aisetfreq.o(.text);
        build/asm/us/libultra/io/dpctr.o(.text);
        build/asm/us/7EB00.o(.text);
        build/asm/us/libultra/mgu/normalize.o(.text);
        build/asm/us/libultra/os/setcompare.o(.text);
        build/asm/us/libultra/io/aigetstat.o(.text);
        build/asm/us/libultra/io/dpsetstat.o(.text);
        build/asm/us/libultra/libc/bcopy.o(.text);
        build/asm/us/libultra/os/resetglobalintmask.o(.text);
        build/asm/us/libultra/gu/ortho.o(.text);
        build/asm/us/libultra/os/interrupt.o(.text);
        build/asm/us/7F170.o(.text);
        build/asm/us/libultra/io/viswapcontext.o(.text);
        build/asm/us/libultra/io/pigetcmdq.o(.text);
        build/asm/us/libultra/gu/cosf.o(.text);
        build/asm/us/libultra/io/epiwrite.o(.text);
        build/asm/us/libultra/io/visetspecial.o(.text);
        build/asm/us/libultra/flash/flashwritearray.o(.text);
        build/asm/us/libultra/os/settime.o(.text);
        build/asm/us/libultra/flash/flashclearstatus.o(.text);
        build/asm/us/7FAC0.o(.text);
        build/asm/us/7FB20.o(.text);
        build/asm/us/7FDE0.o(.text);
        build/asm/us/7FE70.o(.text);
        build/asm/us/7FFD0.o(.text);
        build/asm/us/80280.o(.text);
        build/asm/us/80320.o(.text);
        build/asm/us/80C40.o(.text);
        build/asm/us/81040.o(.text);
        build/asm/us/81AC0.o(.text);
        build/asm/us/81C50.o(.text);
        build/asm/us/827D0.o(.text);
        build/asm/us/82820.o(.text);
        build/asm/us/83420.o(.text);
        build/asm/us/834A0.o(.text);
        build/asm/us/834C0.o(.text);
        build/asm/us/83510.o(.text);
        build/asm/us/83550.o(.text);
        build/asm/us/835B0.o(.text);
        build/asm/us/83600.o(.text);
        build/asm/us/836D0.o(.text);
        build/asm/us/83920.o(.text);
        build/asm/us/83B50.o(.text);
        build/asm/us/83CC0.o(.text);
        build/asm/us/83CD0.o(.text);
        build/asm/us/83E30.o(.text);
        build/asm/us/83FC0.o(.text);
        build/asm/us/84C60.o(.text);
        build/asm/us/84F00.o(.text);
        build/asm/us/84F50.o(.text);
        build/asm/us/84FA0.o(.text);
        build/asm/us/84FF0.o(.text);
        build/asm/us/85000.o(.text);
        build/asm/us/85020.o(.text);
        build/asm/us/85330.o(.text);
        build/asm/us/85340.o(.text);
        build/asm/us/85380.o(.text);
        build/asm/us/853F0.o(.text);
        build/asm/us/85650.o(.text);
        build/asm/us/856A0.o(.text);
        build/asm/us/858B0.o(.text);
        build/asm/us/85A80.o(.text);
        build/asm/us/85B90.o(.text);
        build/asm/us/85BC0.o(.text);
        build/asm/us/85D60.o(.text);
        build/asm/us/85D90.o(.text);
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
        libultra_os_sendmesg = .;
        build/asm/us/libultra/os/sendmesg.o(.data);
        libultra_os_stopthread = .;
        build/asm/us/libultra/os/stopthread.o(.data);
        libultra_os_recvmesg = .;
        build/asm/us/libultra/os/recvmesg.o(.data);
        libultra_os_setintmask = .;
        build/asm/us/libultra/os/setintmask.o(.data);
        libultra_mgu_scale = .;
        build/asm/us/libultra/mgu/scale.o(.data);
        libultra_gu_sinf = .;
        build/asm/us/libultra/gu/sinf.o(.data);
        libultra_io_sptask = .;
        build/asm/us/libultra/io/sptask.o(.data);
        libultra_os_destroythread = .;
        build/asm/us/libultra/os/destroythread.o(.data);
        libultra_libc_ll = .;
        build/asm/us/libultra/libc/ll.o(.data);
        libultra_os_exceptasm = .;
        build/asm/us/libultra/os/exceptasm.o(.data);
        libultra_os_thread = .;
        build/asm/us/libultra/os/thread.o(.data);
        libultra_mgu_scalef = .;
        build/asm/us/libultra/mgu/scalef.o(.data);
        libultra_libc_bzero = .;
        build/asm/us/libultra/libc/bzero.o(.data);
        libultra_io_gbpakcheckconnector = .;
        build/asm/us/libultra/io/gbpakcheckconnector.o(.data);
        libultra_io_gbpakpower = .;
        build/asm/us/libultra/io/gbpakpower.o(.data);
        libultra_io_controller = .;
        build/asm/us/libultra/io/controller.o(.data);
        _76B50 = .;
        build/asm/us/76B50.o(.data);
        libultra_flash_flashsectorerase = .;
        build/asm/us/libultra/flash/flashsectorerase.o(.data);
        libultra_os_initialize = .;
        build/asm/us/libultra/os/initialize.o(.data);
        libultra_os_initialize_emu = .;
        build/asm/us/libultra/os/initialize_emu.o(.data);
        libultra_os_initialize_msp = .;
        build/asm/us/libultra/os/initialize_msp.o(.data);
        libultra_os_initialize_isv = .;
        build/asm/us/libultra/os/initialize_isv.o(.data);
        libultra_io_piread = .;
        build/asm/us/libultra/io/piread.o(.data);
        libultra_io_piacs = .;
        build/asm/us/libultra/io/piacs.o(.data);
        libultra_os_createthread = .;
        build/asm/us/libultra/os/createthread.o(.data);
        _77F10 = .;
        build/asm/us/77F10.o(.data);
        libultra_io_contreaddata = .;
        build/asm/us/libultra/io/contreaddata.o(.data);
        libultra_io_conteeplongread = .;
        build/asm/us/libultra/io/conteeplongread.o(.data);
        libultra_os_virtualtophysical = .;
        build/asm/us/libultra/os/virtualtophysical.o(.data);
        libultra_os_setsr = .;
        build/asm/us/libultra/os/setsr.o(.data);
        libultra_os_getsr = .;
        build/asm/us/libultra/os/getsr.o(.data);
        libultra_os_writebackdcache = .;
        build/asm/us/libultra/os/writebackdcache.o(.data);
        libultra_io_gbpakinit = .;
        build/asm/us/libultra/io/gbpakinit.o(.data);
        libultra_io_pfsgetstatus = .;
        build/asm/us/libultra/io/pfsgetstatus.o(.data);
        libultra_gu_perspective = .;
        build/asm/us/libultra/gu/perspective.o(.data);
        libultra_io_sprawdma = .;
        build/asm/us/libultra/io/sprawdma.o(.data);
        libultra_io_sirawdma = .;
        build/asm/us/libultra/io/sirawdma.o(.data);
        libultra_io_epilinkhandle = .;
        build/asm/us/libultra/io/epilinkhandle.o(.data);
        _78BB0 = .;
        build/asm/us/78BB0.o(.data);
        _78EC0 = .;
        build/asm/us/78EC0.o(.data);
        libultra_io_sprawread = .;
        build/asm/us/libultra/io/sprawread.o(.data);
        libultra_io_pirawread = .;
        build/asm/us/libultra/io/pirawread.o(.data);
        libultra_io_sptaskyield = .;
        build/asm/us/libultra/io/sptaskyield.o(.data);
        libultra_gu_lookatref = .;
        build/asm/us/libultra/gu/lookatref.o(.data);
        libultra_mgu_mtxidentf = .;
        build/asm/us/libultra/mgu/mtxidentf.o(.data);
        _79510 = .;
        build/asm/us/79510.o(.data);
        libultra_io_visetmode = .;
        build/asm/us/libultra/io/visetmode.o(.data);
        _79640 = .;
        build/asm/us/79640.o(.data);
        _796B0 = .;
        build/asm/us/796B0.o(.data);
        _79750 = .;
        build/asm/us/79750.o(.data);
        _798B0 = .;
        build/asm/us/798B0.o(.data);
        libultra_flash_flashreadid = .;
        build/asm/us/libultra/flash/flashreadid.o(.data);
        libultra_io_pfsisplug = .;
        build/asm/us/libultra/io/pfsisplug.o(.data);
        libultra_os_probetlb = .;
        build/asm/us/libultra/os/probetlb.o(.data);
        libultra_io_pimgr = .;
        build/asm/us/libultra/io/pimgr.o(.data);
        libultra_io_devmgr = .;
        build/asm/us/libultra/io/devmgr.o(.data);
        libultra_io_pirawdma = .;
        build/asm/us/libultra/io/pirawdma.o(.data);
        libultra_os_getcount = .;
        build/asm/us/libultra/os/getcount.o(.data);
        libultra_io_conteepprobe = .;
        build/asm/us/libultra/io/conteepprobe.o(.data);
        libultra_io_conteepwrite = .;
        build/asm/us/libultra/io/conteepwrite.o(.data);
        libultra_io_conteepread = .;
        build/asm/us/libultra/io/conteepread.o(.data);
        libultra_flash_flashreadstatus = .;
        build/asm/us/libultra/flash/flashreadstatus.o(.data);
        libultra_os_getmemsize = .;
        build/asm/us/libultra/os/getmemsize.o(.data);
        libultra_io_contpfs = .;
        build/asm/us/libultra/io/contpfs.o(.data);
        libultra_os_seteventmesg = .;
        build/asm/us/libultra/os/seteventmesg.o(.data);
        libultra_gu_sqrtf = .;
        build/asm/us/libultra/gu/sqrtf.o(.data);
        _7BAD0 = .;
        build/asm/us/7BAD0.o(.data);
        libultra_mgu_mtxxfmf = .;
        build/asm/us/libultra/mgu/mtxxfmf.o(.data);
        libultra_gu_random = .;
        build/asm/us/libultra/gu/random.o(.data);
        libultra_libc_xprintf = .;
        build/asm/us/libultra/libc/xprintf.o(.data);
        libultra_io_gbpakgetstatus = .;
        build/asm/us/libultra/io/gbpakgetstatus.o(.data);
        libultra_libc_sprintf = .;
        build/asm/us/libultra/libc/sprintf.o(.data);
        libultra_os_unmaptlball = .;
        build/asm/us/libultra/os/unmaptlball.o(.data);
        libultra_io_epidma = .;
        build/asm/us/libultra/io/epidma.o(.data);
        _7CBA0 = .;
        build/asm/us/7CBA0.o(.data);
        libultra_libc_string = .;
        build/asm/us/libultra/libc/string.o(.data);
        libultra_os_createmesgqueue = .;
        build/asm/us/libultra/os/createmesgqueue.o(.data);
        libultra_os_invaldcache = .;
        build/asm/us/libultra/os/invaldcache.o(.data);
        libultra_os_invalicache = .;
        build/asm/us/libultra/os/invalicache.o(.data);
        _7CE60 = .;
        build/asm/us/7CE60.o(.data);
        libultra_os_initialize_kmc = .;
        build/asm/us/libultra/os/initialize_kmc.o(.data);
        libultra_io_conteeplongwrite = .;
        build/asm/us/libultra/io/conteeplongwrite.o(.data);
        libultra_io_sp = .;
        build/asm/us/libultra/io/sp.o(.data);
        libultra_io_si = .;
        build/asm/us/libultra/io/si.o(.data);
        libultra_mgu_translatef = .;
        build/asm/us/libultra/mgu/translatef.o(.data);
        libultra_os_jammesg = .;
        build/asm/us/libultra/os/jammesg.o(.data);
        libultra_os_setthreadpri = .;
        build/asm/us/libultra/os/setthreadpri.o(.data);
        libultra_os_getthreadpri = .;
        build/asm/us/libultra/os/getthreadpri.o(.data);
        libultra_io_epirawread = .;
        build/asm/us/libultra/io/epirawread.o(.data);
        libultra_io_viswapbuf = .;
        build/asm/us/libultra/io/viswapbuf.o(.data);
        libultra_mgu_mtxcatf = .;
        build/asm/us/libultra/mgu/mtxcatf.o(.data);
        libultra_mgu_mtxcatl = .;
        build/asm/us/libultra/mgu/mtxcatl.o(.data);
        libultra_mgu_mtxl2f = .;
        build/asm/us/libultra/mgu/mtxl2f.o(.data);
        libultra_io_epirawdma = .;
        build/asm/us/libultra/io/epirawdma.o(.data);
        libultra_io_sptaskyielded = .;
        build/asm/us/libultra/io/sptaskyielded.o(.data);
        libultra_gu_rotaterpy = .;
        build/asm/us/libultra/gu/rotaterpy.o(.data);
        libultra_libc_bcmp = .;
        build/asm/us/libultra/libc/bcmp.o(.data);
        libultra_os_gettime = .;
        build/asm/us/libultra/os/gettime.o(.data);
        _7E250 = .;
        build/asm/us/7E250.o(.data);
        libultra_gu_rotate = .;
        build/asm/us/libultra/gu/rotate.o(.data);
        libultra_os_setglobalintmask = .;
        build/asm/us/libultra/os/setglobalintmask.o(.data);
        libultra_io_aisetfreq = .;
        build/asm/us/libultra/io/aisetfreq.o(.data);
        libultra_io_dpctr = .;
        build/asm/us/libultra/io/dpctr.o(.data);
        _7EB00 = .;
        build/asm/us/7EB00.o(.data);
        libultra_mgu_normalize = .;
        build/asm/us/libultra/mgu/normalize.o(.data);
        libultra_os_setcompare = .;
        build/asm/us/libultra/os/setcompare.o(.data);
        libultra_io_aigetstat = .;
        build/asm/us/libultra/io/aigetstat.o(.data);
        libultra_io_dpsetstat = .;
        build/asm/us/libultra/io/dpsetstat.o(.data);
        libultra_libc_bcopy = .;
        build/asm/us/libultra/libc/bcopy.o(.data);
        libultra_os_resetglobalintmask = .;
        build/asm/us/libultra/os/resetglobalintmask.o(.data);
        libultra_gu_ortho = .;
        build/asm/us/libultra/gu/ortho.o(.data);
        libultra_os_interrupt = .;
        build/asm/us/libultra/os/interrupt.o(.data);
        _7F170 = .;
        build/asm/us/7F170.o(.data);
        libultra_io_viswapcontext = .;
        build/asm/us/libultra/io/viswapcontext.o(.data);
        libultra_io_pigetcmdq = .;
        build/asm/us/libultra/io/pigetcmdq.o(.data);
        libultra_gu_cosf = .;
        build/asm/us/libultra/gu/cosf.o(.data);
        libultra_io_epiwrite = .;
        build/asm/us/libultra/io/epiwrite.o(.data);
        libultra_io_visetspecial = .;
        build/asm/us/libultra/io/visetspecial.o(.data);
        libultra_flash_flashwritearray = .;
        build/asm/us/libultra/flash/flashwritearray.o(.data);
        libultra_os_settime = .;
        build/asm/us/libultra/os/settime.o(.data);
        libultra_flash_flashclearstatus = .;
        build/asm/us/libultra/flash/flashclearstatus.o(.data);
        _7FAC0 = .;
        build/asm/us/7FAC0.o(.data);
        _7FB20 = .;
        build/asm/us/7FB20.o(.data);
        _7FDE0 = .;
        build/asm/us/7FDE0.o(.data);
        _7FE70 = .;
        build/asm/us/7FE70.o(.data);
        _7FFD0 = .;
        build/asm/us/7FFD0.o(.data);
        _80280 = .;
        build/asm/us/80280.o(.data);
        _80320 = .;
        build/asm/us/80320.o(.data);
        _80C40 = .;
        build/asm/us/80C40.o(.data);
        _81040 = .;
        build/asm/us/81040.o(.data);
        _81AC0 = .;
        build/asm/us/81AC0.o(.data);
        _81C50 = .;
        build/asm/us/81C50.o(.data);
        _827D0 = .;
        build/asm/us/827D0.o(.data);
        _82820 = .;
        build/asm/us/82820.o(.data);
        _83420 = .;
        build/asm/us/83420.o(.data);
        _834A0 = .;
        build/asm/us/834A0.o(.data);
        _834C0 = .;
        build/asm/us/834C0.o(.data);
        _83510 = .;
        build/asm/us/83510.o(.data);
        _83550 = .;
        build/asm/us/83550.o(.data);
        _835B0 = .;
        build/asm/us/835B0.o(.data);
        _83600 = .;
        build/asm/us/83600.o(.data);
        _836D0 = .;
        build/asm/us/836D0.o(.data);
        _83920 = .;
        build/asm/us/83920.o(.data);
        _83B50 = .;
        build/asm/us/83B50.o(.data);
        _83CC0 = .;
        build/asm/us/83CC0.o(.data);
        _83CD0 = .;
        build/asm/us/83CD0.o(.data);
        _83E30 = .;
        build/asm/us/83E30.o(.data);
        _83FC0 = .;
        build/asm/us/83FC0.o(.data);
        _84C60 = .;
        build/asm/us/84C60.o(.data);
        _84F00 = .;
        build/asm/us/84F00.o(.data);
        _84F50 = .;
        build/asm/us/84F50.o(.data);
        _84FA0 = .;
        build/asm/us/84FA0.o(.data);
        _84FF0 = .;
        build/asm/us/84FF0.o(.data);
        _85000 = .;
        build/asm/us/85000.o(.data);
        _85020 = .;
        build/asm/us/85020.o(.data);
        _85330 = .;
        build/asm/us/85330.o(.data);
        _85340 = .;
        build/asm/us/85340.o(.data);
        _85380 = .;
        build/asm/us/85380.o(.data);
        _853F0 = .;
        build/asm/us/853F0.o(.data);
        _85650 = .;
        build/asm/us/85650.o(.data);
        _856A0 = .;
        build/asm/us/856A0.o(.data);
        _858B0 = .;
        build/asm/us/858B0.o(.data);
        _85A80 = .;
        build/asm/us/85A80.o(.data);
        _85B90 = .;
        build/asm/us/85B90.o(.data);
        _85BC0 = .;
        build/asm/us/85BC0.o(.data);
        _85D60 = .;
        build/asm/us/85D60.o(.data);
        _85D90 = .;
        build/asm/us/85D90.o(.data);
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
        build/asm/us/libultra/os/sendmesg.o(.rodata);
        build/asm/us/libultra/os/stopthread.o(.rodata);
        build/asm/us/libultra/os/recvmesg.o(.rodata);
        build/asm/us/libultra/os/setintmask.o(.rodata);
        build/asm/us/libultra/mgu/scale.o(.rodata);
        build/asm/us/libultra/gu/sinf.o(.rodata);
        build/asm/us/libultra/io/sptask.o(.rodata);
        build/asm/us/libultra/os/destroythread.o(.rodata);
        build/asm/us/libultra/libc/ll.o(.rodata);
        build/asm/us/libultra/os/exceptasm.o(.rodata);
        build/asm/us/libultra/os/thread.o(.rodata);
        build/asm/us/libultra/mgu/scalef.o(.rodata);
        build/asm/us/libultra/libc/bzero.o(.rodata);
        build/asm/us/libultra/io/gbpakcheckconnector.o(.rodata);
        build/asm/us/libultra/io/gbpakpower.o(.rodata);
        build/asm/us/libultra/io/controller.o(.rodata);
        build/asm/us/76B50.o(.rodata);
        build/asm/us/libultra/flash/flashsectorerase.o(.rodata);
        build/asm/us/libultra/os/initialize.o(.rodata);
        build/asm/us/libultra/os/initialize_emu.o(.rodata);
        build/asm/us/libultra/os/initialize_msp.o(.rodata);
        build/asm/us/libultra/os/initialize_isv.o(.rodata);
        build/asm/us/libultra/io/piread.o(.rodata);
        build/asm/us/libultra/io/piacs.o(.rodata);
        build/asm/us/libultra/os/createthread.o(.rodata);
        build/asm/us/77F10.o(.rodata);
        build/asm/us/libultra/io/contreaddata.o(.rodata);
        build/asm/us/libultra/io/conteeplongread.o(.rodata);
        build/asm/us/libultra/os/virtualtophysical.o(.rodata);
        build/asm/us/libultra/os/setsr.o(.rodata);
        build/asm/us/libultra/os/getsr.o(.rodata);
        build/asm/us/libultra/os/writebackdcache.o(.rodata);
        build/asm/us/libultra/io/gbpakinit.o(.rodata);
        build/asm/us/libultra/io/pfsgetstatus.o(.rodata);
        build/asm/us/libultra/gu/perspective.o(.rodata);
        build/asm/us/libultra/io/sprawdma.o(.rodata);
        build/asm/us/libultra/io/sirawdma.o(.rodata);
        build/asm/us/libultra/io/epilinkhandle.o(.rodata);
        build/asm/us/78BB0.o(.rodata);
        build/asm/us/78EC0.o(.rodata);
        build/asm/us/libultra/io/sprawread.o(.rodata);
        build/asm/us/libultra/io/pirawread.o(.rodata);
        build/asm/us/libultra/io/sptaskyield.o(.rodata);
        build/asm/us/libultra/gu/lookatref.o(.rodata);
        build/asm/us/libultra/mgu/mtxidentf.o(.rodata);
        build/asm/us/79510.o(.rodata);
        build/asm/us/libultra/io/visetmode.o(.rodata);
        build/asm/us/79640.o(.rodata);
        build/asm/us/796B0.o(.rodata);
        build/asm/us/79750.o(.rodata);
        build/asm/us/798B0.o(.rodata);
        build/asm/us/libultra/flash/flashreadid.o(.rodata);
        build/asm/us/libultra/io/pfsisplug.o(.rodata);
        build/asm/us/libultra/os/probetlb.o(.rodata);
        build/asm/us/libultra/io/pimgr.o(.rodata);
        build/asm/us/libultra/io/devmgr.o(.rodata);
        build/asm/us/libultra/io/pirawdma.o(.rodata);
        build/asm/us/libultra/os/getcount.o(.rodata);
        build/asm/us/libultra/io/conteepprobe.o(.rodata);
        build/asm/us/libultra/io/conteepwrite.o(.rodata);
        build/asm/us/libultra/io/conteepread.o(.rodata);
        build/asm/us/libultra/flash/flashreadstatus.o(.rodata);
        build/asm/us/libultra/os/getmemsize.o(.rodata);
        build/asm/us/libultra/io/contpfs.o(.rodata);
        build/asm/us/libultra/os/seteventmesg.o(.rodata);
        build/asm/us/libultra/gu/sqrtf.o(.rodata);
        build/asm/us/7BAD0.o(.rodata);
        build/asm/us/libultra/mgu/mtxxfmf.o(.rodata);
        build/asm/us/libultra/gu/random.o(.rodata);
        build/asm/us/libultra/libc/xprintf.o(.rodata);
        build/asm/us/libultra/io/gbpakgetstatus.o(.rodata);
        build/asm/us/libultra/libc/sprintf.o(.rodata);
        build/asm/us/libultra/os/unmaptlball.o(.rodata);
        build/asm/us/libultra/io/epidma.o(.rodata);
        build/asm/us/7CBA0.o(.rodata);
        build/asm/us/libultra/libc/string.o(.rodata);
        build/asm/us/libultra/os/createmesgqueue.o(.rodata);
        build/asm/us/libultra/os/invaldcache.o(.rodata);
        build/asm/us/libultra/os/invalicache.o(.rodata);
        build/asm/us/7CE60.o(.rodata);
        build/asm/us/libultra/os/initialize_kmc.o(.rodata);
        build/asm/us/libultra/io/conteeplongwrite.o(.rodata);
        build/asm/us/libultra/io/sp.o(.rodata);
        build/asm/us/libultra/io/si.o(.rodata);
        build/asm/us/libultra/mgu/translatef.o(.rodata);
        build/asm/us/libultra/os/jammesg.o(.rodata);
        build/asm/us/libultra/os/setthreadpri.o(.rodata);
        build/asm/us/libultra/os/getthreadpri.o(.rodata);
        build/asm/us/libultra/io/epirawread.o(.rodata);
        build/asm/us/libultra/io/viswapbuf.o(.rodata);
        build/asm/us/libultra/mgu/mtxcatf.o(.rodata);
        build/asm/us/libultra/mgu/mtxcatl.o(.rodata);
        build/asm/us/libultra/mgu/mtxl2f.o(.rodata);
        build/asm/us/libultra/io/epirawdma.o(.rodata);
        build/asm/us/libultra/io/sptaskyielded.o(.rodata);
        build/asm/us/libultra/gu/rotaterpy.o(.rodata);
        build/asm/us/libultra/libc/bcmp.o(.rodata);
        build/asm/us/libultra/os/gettime.o(.rodata);
        build/asm/us/7E250.o(.rodata);
        build/asm/us/libultra/gu/rotate.o(.rodata);
        build/asm/us/libultra/os/setglobalintmask.o(.rodata);
        build/asm/us/libultra/io/aisetfreq.o(.rodata);
        build/asm/us/libultra/io/dpctr.o(.rodata);
        build/asm/us/7EB00.o(.rodata);
        build/asm/us/libultra/mgu/normalize.o(.rodata);
        build/asm/us/libultra/os/setcompare.o(.rodata);
        build/asm/us/libultra/io/aigetstat.o(.rodata);
        build/asm/us/libultra/io/dpsetstat.o(.rodata);
        build/asm/us/libultra/libc/bcopy.o(.rodata);
        build/asm/us/libultra/os/resetglobalintmask.o(.rodata);
        build/asm/us/libultra/gu/ortho.o(.rodata);
        build/asm/us/libultra/os/interrupt.o(.rodata);
        build/asm/us/7F170.o(.rodata);
        build/asm/us/libultra/io/viswapcontext.o(.rodata);
        build/asm/us/libultra/io/pigetcmdq.o(.rodata);
        build/asm/us/libultra/gu/cosf.o(.rodata);
        build/asm/us/libultra/io/epiwrite.o(.rodata);
        build/asm/us/libultra/io/visetspecial.o(.rodata);
        build/asm/us/libultra/flash/flashwritearray.o(.rodata);
        build/asm/us/libultra/os/settime.o(.rodata);
        build/asm/us/libultra/flash/flashclearstatus.o(.rodata);
        build/asm/us/7FAC0.o(.rodata);
        build/asm/us/7FB20.o(.rodata);
        build/asm/us/7FDE0.o(.rodata);
        build/asm/us/7FE70.o(.rodata);
        build/asm/us/7FFD0.o(.rodata);
        build/asm/us/80280.o(.rodata);
        build/asm/us/80320.o(.rodata);
        build/asm/us/80C40.o(.rodata);
        build/asm/us/81040.o(.rodata);
        build/asm/us/81AC0.o(.rodata);
        build/asm/us/81C50.o(.rodata);
        build/asm/us/827D0.o(.rodata);
        build/asm/us/82820.o(.rodata);
        build/asm/us/83420.o(.rodata);
        build/asm/us/834A0.o(.rodata);
        build/asm/us/834C0.o(.rodata);
        build/asm/us/83510.o(.rodata);
        build/asm/us/83550.o(.rodata);
        build/asm/us/835B0.o(.rodata);
        build/asm/us/83600.o(.rodata);
        build/asm/us/836D0.o(.rodata);
        build/asm/us/83920.o(.rodata);
        build/asm/us/83B50.o(.rodata);
        build/asm/us/83CC0.o(.rodata);
        build/asm/us/83CD0.o(.rodata);
        build/asm/us/83E30.o(.rodata);
        build/asm/us/83FC0.o(.rodata);
        build/asm/us/84C60.o(.rodata);
        build/asm/us/84F00.o(.rodata);
        build/asm/us/84F50.o(.rodata);
        build/asm/us/84FA0.o(.rodata);
        build/asm/us/84FF0.o(.rodata);
        build/asm/us/85000.o(.rodata);
        build/asm/us/85020.o(.rodata);
        build/asm/us/85330.o(.rodata);
        build/asm/us/85340.o(.rodata);
        build/asm/us/85380.o(.rodata);
        build/asm/us/853F0.o(.rodata);
        build/asm/us/85650.o(.rodata);
        build/asm/us/856A0.o(.rodata);
        build/asm/us/858B0.o(.rodata);
        build/asm/us/85A80.o(.rodata);
        build/asm/us/85B90.o(.rodata);
        build/asm/us/85BC0.o(.rodata);
        build/asm/us/85D60.o(.rodata);
        build/asm/us/85D90.o(.rodata);
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
        build/asm/us/libultra/os/sendmesg.o(.bss);
        build/asm/us/libultra/os/stopthread.o(.bss);
        build/asm/us/libultra/os/recvmesg.o(.bss);
        build/asm/us/libultra/os/setintmask.o(.bss);
        build/asm/us/libultra/mgu/scale.o(.bss);
        build/asm/us/libultra/gu/sinf.o(.bss);
        build/asm/us/libultra/io/sptask.o(.bss);
        build/asm/us/libultra/os/destroythread.o(.bss);
        build/asm/us/libultra/libc/ll.o(.bss);
        build/asm/us/libultra/os/exceptasm.o(.bss);
        build/asm/us/libultra/os/thread.o(.bss);
        build/asm/us/libultra/mgu/scalef.o(.bss);
        build/asm/us/libultra/libc/bzero.o(.bss);
        build/asm/us/libultra/io/gbpakcheckconnector.o(.bss);
        build/asm/us/libultra/io/gbpakpower.o(.bss);
        build/asm/us/libultra/io/controller.o(.bss);
        build/asm/us/76B50.o(.bss);
        build/asm/us/libultra/flash/flashsectorerase.o(.bss);
        build/asm/us/libultra/os/initialize.o(.bss);
        build/asm/us/libultra/os/initialize_emu.o(.bss);
        build/asm/us/libultra/os/initialize_msp.o(.bss);
        build/asm/us/libultra/os/initialize_isv.o(.bss);
        build/asm/us/libultra/io/piread.o(.bss);
        build/asm/us/libultra/io/piacs.o(.bss);
        build/asm/us/libultra/os/createthread.o(.bss);
        build/asm/us/77F10.o(.bss);
        build/asm/us/libultra/io/contreaddata.o(.bss);
        build/asm/us/libultra/io/conteeplongread.o(.bss);
        build/asm/us/libultra/os/virtualtophysical.o(.bss);
        build/asm/us/libultra/os/setsr.o(.bss);
        build/asm/us/libultra/os/getsr.o(.bss);
        build/asm/us/libultra/os/writebackdcache.o(.bss);
        build/asm/us/libultra/io/gbpakinit.o(.bss);
        build/asm/us/libultra/io/pfsgetstatus.o(.bss);
        build/asm/us/libultra/gu/perspective.o(.bss);
        build/asm/us/libultra/io/sprawdma.o(.bss);
        build/asm/us/libultra/io/sirawdma.o(.bss);
        build/asm/us/libultra/io/epilinkhandle.o(.bss);
        build/asm/us/78BB0.o(.bss);
        build/asm/us/78EC0.o(.bss);
        build/asm/us/libultra/io/sprawread.o(.bss);
        build/asm/us/libultra/io/pirawread.o(.bss);
        build/asm/us/libultra/io/sptaskyield.o(.bss);
        build/asm/us/libultra/gu/lookatref.o(.bss);
        build/asm/us/libultra/mgu/mtxidentf.o(.bss);
        build/asm/us/79510.o(.bss);
        build/asm/us/libultra/io/visetmode.o(.bss);
        build/asm/us/79640.o(.bss);
        build/asm/us/796B0.o(.bss);
        build/asm/us/79750.o(.bss);
        build/asm/us/798B0.o(.bss);
        build/asm/us/libultra/flash/flashreadid.o(.bss);
        build/asm/us/libultra/io/pfsisplug.o(.bss);
        build/asm/us/libultra/os/probetlb.o(.bss);
        build/asm/us/libultra/io/pimgr.o(.bss);
        build/asm/us/libultra/io/devmgr.o(.bss);
        build/asm/us/libultra/io/pirawdma.o(.bss);
        build/asm/us/libultra/os/getcount.o(.bss);
        build/asm/us/libultra/io/conteepprobe.o(.bss);
        build/asm/us/libultra/io/conteepwrite.o(.bss);
        build/asm/us/libultra/io/conteepread.o(.bss);
        build/asm/us/libultra/flash/flashreadstatus.o(.bss);
        build/asm/us/libultra/os/getmemsize.o(.bss);
        build/asm/us/libultra/io/contpfs.o(.bss);
        build/asm/us/libultra/os/seteventmesg.o(.bss);
        build/asm/us/libultra/gu/sqrtf.o(.bss);
        build/asm/us/7BAD0.o(.bss);
        build/asm/us/libultra/mgu/mtxxfmf.o(.bss);
        build/asm/us/libultra/gu/random.o(.bss);
        build/asm/us/libultra/libc/xprintf.o(.bss);
        build/asm/us/libultra/io/gbpakgetstatus.o(.bss);
        build/asm/us/libultra/libc/sprintf.o(.bss);
        build/asm/us/libultra/os/unmaptlball.o(.bss);
        build/asm/us/libultra/io/epidma.o(.bss);
        build/asm/us/7CBA0.o(.bss);
        build/asm/us/libultra/libc/string.o(.bss);
        build/asm/us/libultra/os/createmesgqueue.o(.bss);
        build/asm/us/libultra/os/invaldcache.o(.bss);
        build/asm/us/libultra/os/invalicache.o(.bss);
        build/asm/us/7CE60.o(.bss);
        build/asm/us/libultra/os/initialize_kmc.o(.bss);
        build/asm/us/libultra/io/conteeplongwrite.o(.bss);
        build/asm/us/libultra/io/sp.o(.bss);
        build/asm/us/libultra/io/si.o(.bss);
        build/asm/us/libultra/mgu/translatef.o(.bss);
        build/asm/us/libultra/os/jammesg.o(.bss);
        build/asm/us/libultra/os/setthreadpri.o(.bss);
        build/asm/us/libultra/os/getthreadpri.o(.bss);
        build/asm/us/libultra/io/epirawread.o(.bss);
        build/asm/us/libultra/io/viswapbuf.o(.bss);
        build/asm/us/libultra/mgu/mtxcatf.o(.bss);
        build/asm/us/libultra/mgu/mtxcatl.o(.bss);
        build/asm/us/libultra/mgu/mtxl2f.o(.bss);
        build/asm/us/libultra/io/epirawdma.o(.bss);
        build/asm/us/libultra/io/sptaskyielded.o(.bss);
        build/asm/us/libultra/gu/rotaterpy.o(.bss);
        build/asm/us/libultra/libc/bcmp.o(.bss);
        build/asm/us/libultra/os/gettime.o(.bss);
        build/asm/us/7E250.o(.bss);
        build/asm/us/libultra/gu/rotate.o(.bss);
        build/asm/us/libultra/os/setglobalintmask.o(.bss);
        build/asm/us/libultra/io/aisetfreq.o(.bss);
        build/asm/us/libultra/io/dpctr.o(.bss);
        build/asm/us/7EB00.o(.bss);
        build/asm/us/libultra/mgu/normalize.o(.bss);
        build/asm/us/libultra/os/setcompare.o(.bss);
        build/asm/us/libultra/io/aigetstat.o(.bss);
        build/asm/us/libultra/io/dpsetstat.o(.bss);
        build/asm/us/libultra/libc/bcopy.o(.bss);
        build/asm/us/libultra/os/resetglobalintmask.o(.bss);
        build/asm/us/libultra/gu/ortho.o(.bss);
        build/asm/us/libultra/os/interrupt.o(.bss);
        build/asm/us/7F170.o(.bss);
        build/asm/us/libultra/io/viswapcontext.o(.bss);
        build/asm/us/libultra/io/pigetcmdq.o(.bss);
        build/asm/us/libultra/gu/cosf.o(.bss);
        build/asm/us/libultra/io/epiwrite.o(.bss);
        build/asm/us/libultra/io/visetspecial.o(.bss);
        build/asm/us/libultra/flash/flashwritearray.o(.bss);
        build/asm/us/libultra/os/settime.o(.bss);
        build/asm/us/libultra/flash/flashclearstatus.o(.bss);
        build/asm/us/7FAC0.o(.bss);
        build/asm/us/7FB20.o(.bss);
        build/asm/us/7FDE0.o(.bss);
        build/asm/us/7FE70.o(.bss);
        build/asm/us/7FFD0.o(.bss);
        build/asm/us/80280.o(.bss);
        build/asm/us/80320.o(.bss);
        build/asm/us/80C40.o(.bss);
        build/asm/us/81040.o(.bss);
        build/asm/us/81AC0.o(.bss);
        build/asm/us/81C50.o(.bss);
        build/asm/us/827D0.o(.bss);
        build/asm/us/82820.o(.bss);
        build/asm/us/83420.o(.bss);
        build/asm/us/834A0.o(.bss);
        build/asm/us/834C0.o(.bss);
        build/asm/us/83510.o(.bss);
        build/asm/us/83550.o(.bss);
        build/asm/us/835B0.o(.bss);
        build/asm/us/83600.o(.bss);
        build/asm/us/836D0.o(.bss);
        build/asm/us/83920.o(.bss);
        build/asm/us/83B50.o(.bss);
        build/asm/us/83CC0.o(.bss);
        build/asm/us/83CD0.o(.bss);
        build/asm/us/83E30.o(.bss);
        build/asm/us/83FC0.o(.bss);
        build/asm/us/84C60.o(.bss);
        build/asm/us/84F00.o(.bss);
        build/asm/us/84F50.o(.bss);
        build/asm/us/84FA0.o(.bss);
        build/asm/us/84FF0.o(.bss);
        build/asm/us/85000.o(.bss);
        build/asm/us/85020.o(.bss);
        build/asm/us/85330.o(.bss);
        build/asm/us/85340.o(.bss);
        build/asm/us/85380.o(.bss);
        build/asm/us/853F0.o(.bss);
        build/asm/us/85650.o(.bss);
        build/asm/us/856A0.o(.bss);
        build/asm/us/858B0.o(.bss);
        build/asm/us/85A80.o(.bss);
        build/asm/us/85B90.o(.bss);
        build/asm/us/85BC0.o(.bss);
        build/asm/us/85D60.o(.bss);
        build/asm/us/85D90.o(.bss);
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
        build/asm/us/fragments/4/fragment4_AE600.o(.text);
        build/asm/us/fragments/4/fragment4_AFAA0.o(.text);
        build/asm/us/fragments/4/fragment4_B2D00.o(.text);
        fragment4_TEXT_END = .;
        fragment4_TEXT_SIZE = ABSOLUTE(fragment4_TEXT_END - fragment4_TEXT_START);
        fragment4_DATA_START = .;
        fragments_4_fragment4_header = .;
        build/asm/us/data/fragments/4/fragment4_header.o(.data);
        fragments_4_fragment4_AE600 = .;
        build/asm/us/fragments/4/fragment4_AE600.o(.data);
        fragments_4_fragment4_AFAA0 = .;
        build/asm/us/fragments/4/fragment4_AFAA0.o(.data);
        fragments_4_fragment4_B2D00 = .;
        build/asm/us/fragments/4/fragment4_B2D00.o(.data);
        fragments_4_fragment4_data_data = .;
        build/asm/us/data/fragments/4/fragment4_data.data.o(.data);
        fragment4_DATA_END = .;
        fragment4_DATA_SIZE = ABSOLUTE(fragment4_DATA_END - fragment4_DATA_START);
        fragment4_RODATA_START = .;
        build/asm/us/data/fragments/4/fragment4_header.o(.rodata);
        build/asm/us/fragments/4/fragment4_AE600.o(.rodata);
        build/asm/us/fragments/4/fragment4_AFAA0.o(.rodata);
        build/asm/us/fragments/4/fragment4_B2D00.o(.rodata);
        fragment4_RODATA_END = .;
        fragment4_RODATA_SIZE = ABSOLUTE(fragment4_RODATA_END - fragment4_RODATA_START);
    }
    fragment4_bss_VRAM = ADDR(.fragment4_bss);
    .fragment4_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment4_BSS_START = .;
        build/asm/us/data/fragments/4/fragment4_header.o(.bss);
        build/asm/us/fragments/4/fragment4_AE600.o(.bss);
        build/asm/us/fragments/4/fragment4_AFAA0.o(.bss);
        build/asm/us/fragments/4/fragment4_B2D00.o(.bss);
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
        build/asm/us/fragments/7/fragment7_BA250.o(.text);
        build/asm/us/fragments/7/fragment7_C4C10.o(.text);
        fragment7_TEXT_END = .;
        fragment7_TEXT_SIZE = ABSOLUTE(fragment7_TEXT_END - fragment7_TEXT_START);
        fragment7_DATA_START = .;
        fragments_7_fragment7_header = .;
        build/asm/us/data/fragments/7/fragment7_header.o(.data);
        fragments_7_fragment7_BA250 = .;
        build/asm/us/fragments/7/fragment7_BA250.o(.data);
        fragments_7_fragment7_C4C10 = .;
        build/asm/us/fragments/7/fragment7_C4C10.o(.data);
        fragments_7_fragment7_data_data = .;
        build/asm/us/data/fragments/7/fragment7_data.data.o(.data);
        fragment7_DATA_END = .;
        fragment7_DATA_SIZE = ABSOLUTE(fragment7_DATA_END - fragment7_DATA_START);
        fragment7_RODATA_START = .;
        build/asm/us/data/fragments/7/fragment7_header.o(.rodata);
        build/asm/us/fragments/7/fragment7_BA250.o(.rodata);
        build/asm/us/fragments/7/fragment7_C4C10.o(.rodata);
        fragment7_RODATA_END = .;
        fragment7_RODATA_SIZE = ABSOLUTE(fragment7_RODATA_END - fragment7_RODATA_START);
    }
    fragment7_bss_VRAM = ADDR(.fragment7_bss);
    .fragment7_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment7_BSS_START = .;
        build/asm/us/data/fragments/7/fragment7_header.o(.bss);
        build/asm/us/fragments/7/fragment7_BA250.o(.bss);
        build/asm/us/fragments/7/fragment7_C4C10.o(.bss);
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
        build/asm/us/fragments/10/fragment10_D4C50.o(.text);
        build/asm/us/fragments/10/fragment10_D5250.o(.text);
        fragment10_TEXT_END = .;
        fragment10_TEXT_SIZE = ABSOLUTE(fragment10_TEXT_END - fragment10_TEXT_START);
        fragment10_DATA_START = .;
        fragments_10_fragment10_header = .;
        build/asm/us/data/fragments/10/fragment10_header.o(.data);
        fragments_10_fragment10_D4C50 = .;
        build/asm/us/fragments/10/fragment10_D4C50.o(.data);
        fragments_10_fragment10_D5250 = .;
        build/asm/us/fragments/10/fragment10_D5250.o(.data);
        fragments_10_fragment10_data_data = .;
        build/asm/us/data/fragments/10/fragment10_data.data.o(.data);
        fragment10_DATA_END = .;
        fragment10_DATA_SIZE = ABSOLUTE(fragment10_DATA_END - fragment10_DATA_START);
        fragment10_RODATA_START = .;
        build/asm/us/data/fragments/10/fragment10_header.o(.rodata);
        build/asm/us/fragments/10/fragment10_D4C50.o(.rodata);
        build/asm/us/fragments/10/fragment10_D5250.o(.rodata);
        fragment10_RODATA_END = .;
        fragment10_RODATA_SIZE = ABSOLUTE(fragment10_RODATA_END - fragment10_RODATA_START);
    }
    fragment10_bss_VRAM = ADDR(.fragment10_bss);
    .fragment10_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment10_BSS_START = .;
        build/asm/us/data/fragments/10/fragment10_header.o(.bss);
        build/asm/us/fragments/10/fragment10_D4C50.o(.bss);
        build/asm/us/fragments/10/fragment10_D5250.o(.bss);
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
        build/asm/us/fragments/11/fragment11_D7BC0.o(.text);
        build/asm/us/fragments/11/fragment11_D9520.o(.text);
        build/asm/us/fragments/11/fragment11_E1E10.o(.text);
        build/asm/us/fragments/11/fragment11_E35C0.o(.text);
        build/asm/us/fragments/11/fragment11_E3850.o(.text);
        fragment11_TEXT_END = .;
        fragment11_TEXT_SIZE = ABSOLUTE(fragment11_TEXT_END - fragment11_TEXT_START);
        fragment11_DATA_START = .;
        fragments_11_fragment11_header = .;
        build/asm/us/data/fragments/11/fragment11_header.o(.data);
        fragments_11_fragment11_D7BC0 = .;
        build/asm/us/fragments/11/fragment11_D7BC0.o(.data);
        fragments_11_fragment11_D9520 = .;
        build/asm/us/fragments/11/fragment11_D9520.o(.data);
        fragments_11_fragment11_E1E10 = .;
        build/asm/us/fragments/11/fragment11_E1E10.o(.data);
        fragments_11_fragment11_E35C0 = .;
        build/asm/us/fragments/11/fragment11_E35C0.o(.data);
        fragments_11_fragment11_E3850 = .;
        build/asm/us/fragments/11/fragment11_E3850.o(.data);
        fragments_11_fragment11_data_data = .;
        build/asm/us/data/fragments/11/fragment11_data.data.o(.data);
        fragment11_DATA_END = .;
        fragment11_DATA_SIZE = ABSOLUTE(fragment11_DATA_END - fragment11_DATA_START);
        fragment11_RODATA_START = .;
        build/asm/us/data/fragments/11/fragment11_header.o(.rodata);
        build/asm/us/fragments/11/fragment11_D7BC0.o(.rodata);
        build/asm/us/fragments/11/fragment11_D9520.o(.rodata);
        build/asm/us/fragments/11/fragment11_E1E10.o(.rodata);
        build/asm/us/fragments/11/fragment11_E35C0.o(.rodata);
        build/asm/us/fragments/11/fragment11_E3850.o(.rodata);
        fragment11_RODATA_END = .;
        fragment11_RODATA_SIZE = ABSOLUTE(fragment11_RODATA_END - fragment11_RODATA_START);
    }
    fragment11_bss_VRAM = ADDR(.fragment11_bss);
    .fragment11_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment11_BSS_START = .;
        build/asm/us/data/fragments/11/fragment11_header.o(.bss);
        build/asm/us/fragments/11/fragment11_D7BC0.o(.bss);
        build/asm/us/fragments/11/fragment11_D9520.o(.bss);
        build/asm/us/fragments/11/fragment11_E1E10.o(.bss);
        build/asm/us/fragments/11/fragment11_E35C0.o(.bss);
        build/asm/us/fragments/11/fragment11_E3850.o(.bss);
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
        build/asm/us/fragments/12/fragment12_E5330.o(.text);
        build/asm/us/fragments/12/fragment12_E7C00.o(.text);
        fragment12_TEXT_END = .;
        fragment12_TEXT_SIZE = ABSOLUTE(fragment12_TEXT_END - fragment12_TEXT_START);
        fragment12_DATA_START = .;
        fragments_12_fragment12_header = .;
        build/asm/us/data/fragments/12/fragment12_header.o(.data);
        fragments_12_fragment12_E5330 = .;
        build/asm/us/fragments/12/fragment12_E5330.o(.data);
        fragments_12_fragment12_E7C00 = .;
        build/asm/us/fragments/12/fragment12_E7C00.o(.data);
        fragments_12_fragment12_data_data = .;
        build/asm/us/data/fragments/12/fragment12_data.data.o(.data);
        fragment12_DATA_END = .;
        fragment12_DATA_SIZE = ABSOLUTE(fragment12_DATA_END - fragment12_DATA_START);
        fragment12_RODATA_START = .;
        build/asm/us/data/fragments/12/fragment12_header.o(.rodata);
        build/asm/us/fragments/12/fragment12_E5330.o(.rodata);
        build/asm/us/fragments/12/fragment12_E7C00.o(.rodata);
        fragment12_RODATA_END = .;
        fragment12_RODATA_SIZE = ABSOLUTE(fragment12_RODATA_END - fragment12_RODATA_START);
    }
    fragment12_bss_VRAM = ADDR(.fragment12_bss);
    .fragment12_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment12_BSS_START = .;
        build/asm/us/data/fragments/12/fragment12_header.o(.bss);
        build/asm/us/fragments/12/fragment12_E5330.o(.bss);
        build/asm/us/fragments/12/fragment12_E7C00.o(.bss);
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
        build/asm/us/fragments/13/fragment13_EE0A0.o(.text);
        build/asm/us/fragments/13/fragment13_EE5B0.o(.text);
        build/asm/us/fragments/13/fragment13_EEC50.o(.text);
        fragment13_TEXT_END = .;
        fragment13_TEXT_SIZE = ABSOLUTE(fragment13_TEXT_END - fragment13_TEXT_START);
        fragment13_DATA_START = .;
        fragments_13_fragment13_header = .;
        build/asm/us/data/fragments/13/fragment13_header.o(.data);
        fragments_13_fragment13_EE0A0 = .;
        build/asm/us/fragments/13/fragment13_EE0A0.o(.data);
        fragments_13_fragment13_EE5B0 = .;
        build/asm/us/fragments/13/fragment13_EE5B0.o(.data);
        fragments_13_fragment13_EEC50 = .;
        build/asm/us/fragments/13/fragment13_EEC50.o(.data);
        fragments_13_fragment13_data_data = .;
        build/asm/us/data/fragments/13/fragment13_data.data.o(.data);
        fragment13_DATA_END = .;
        fragment13_DATA_SIZE = ABSOLUTE(fragment13_DATA_END - fragment13_DATA_START);
        fragment13_RODATA_START = .;
        build/asm/us/data/fragments/13/fragment13_header.o(.rodata);
        build/asm/us/fragments/13/fragment13_EE0A0.o(.rodata);
        build/asm/us/fragments/13/fragment13_EE5B0.o(.rodata);
        build/asm/us/fragments/13/fragment13_EEC50.o(.rodata);
        fragment13_RODATA_END = .;
        fragment13_RODATA_SIZE = ABSOLUTE(fragment13_RODATA_END - fragment13_RODATA_START);
    }
    fragment13_bss_VRAM = ADDR(.fragment13_bss);
    .fragment13_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment13_BSS_START = .;
        build/asm/us/data/fragments/13/fragment13_header.o(.bss);
        build/asm/us/fragments/13/fragment13_EE0A0.o(.bss);
        build/asm/us/fragments/13/fragment13_EE5B0.o(.bss);
        build/asm/us/fragments/13/fragment13_EEC50.o(.bss);
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
        build/asm/us/fragments/14/fragment14_F81B0.o(.text);
        build/asm/us/fragments/14/fragment14_FA520.o(.text);
        build/asm/us/fragments/14/fragment14_FAD40.o(.text);
        build/asm/us/fragments/14/fragment14_FCD40.o(.text);
        build/asm/us/fragments/14/fragment14_FD770.o(.text);
        build/asm/us/fragments/14/fragment14_FF070.o(.text);
        build/asm/us/fragments/14/fragment14_104FC0.o(.text);
        build/asm/us/fragments/14/fragment14_1077C0.o(.text);
        build/asm/us/fragments/14/fragment14_109280.o(.text);
        fragment14_TEXT_END = .;
        fragment14_TEXT_SIZE = ABSOLUTE(fragment14_TEXT_END - fragment14_TEXT_START);
        fragment14_DATA_START = .;
        fragments_14_fragment14_header = .;
        build/asm/us/data/fragments/14/fragment14_header.o(.data);
        fragments_14_fragment14_F81B0 = .;
        build/asm/us/fragments/14/fragment14_F81B0.o(.data);
        fragments_14_fragment14_FA520 = .;
        build/asm/us/fragments/14/fragment14_FA520.o(.data);
        fragments_14_fragment14_FAD40 = .;
        build/asm/us/fragments/14/fragment14_FAD40.o(.data);
        fragments_14_fragment14_FCD40 = .;
        build/asm/us/fragments/14/fragment14_FCD40.o(.data);
        fragments_14_fragment14_FD770 = .;
        build/asm/us/fragments/14/fragment14_FD770.o(.data);
        fragments_14_fragment14_FF070 = .;
        build/asm/us/fragments/14/fragment14_FF070.o(.data);
        fragments_14_fragment14_104FC0 = .;
        build/asm/us/fragments/14/fragment14_104FC0.o(.data);
        fragments_14_fragment14_1077C0 = .;
        build/asm/us/fragments/14/fragment14_1077C0.o(.data);
        fragments_14_fragment14_109280 = .;
        build/asm/us/fragments/14/fragment14_109280.o(.data);
        fragments_14_fragment14_data_data = .;
        build/asm/us/data/fragments/14/fragment14_data.data.o(.data);
        fragment14_DATA_END = .;
        fragment14_DATA_SIZE = ABSOLUTE(fragment14_DATA_END - fragment14_DATA_START);
        fragment14_RODATA_START = .;
        build/asm/us/data/fragments/14/fragment14_header.o(.rodata);
        build/asm/us/fragments/14/fragment14_F81B0.o(.rodata);
        build/asm/us/fragments/14/fragment14_FA520.o(.rodata);
        build/asm/us/fragments/14/fragment14_FAD40.o(.rodata);
        build/asm/us/fragments/14/fragment14_FCD40.o(.rodata);
        build/asm/us/fragments/14/fragment14_FD770.o(.rodata);
        build/asm/us/fragments/14/fragment14_FF070.o(.rodata);
        build/asm/us/fragments/14/fragment14_104FC0.o(.rodata);
        build/asm/us/fragments/14/fragment14_1077C0.o(.rodata);
        build/asm/us/fragments/14/fragment14_109280.o(.rodata);
        fragment14_RODATA_END = .;
        fragment14_RODATA_SIZE = ABSOLUTE(fragment14_RODATA_END - fragment14_RODATA_START);
    }
    fragment14_bss_VRAM = ADDR(.fragment14_bss);
    .fragment14_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment14_BSS_START = .;
        build/asm/us/data/fragments/14/fragment14_header.o(.bss);
        build/asm/us/fragments/14/fragment14_F81B0.o(.bss);
        build/asm/us/fragments/14/fragment14_FA520.o(.bss);
        build/asm/us/fragments/14/fragment14_FAD40.o(.bss);
        build/asm/us/fragments/14/fragment14_FCD40.o(.bss);
        build/asm/us/fragments/14/fragment14_FD770.o(.bss);
        build/asm/us/fragments/14/fragment14_FF070.o(.bss);
        build/asm/us/fragments/14/fragment14_104FC0.o(.bss);
        build/asm/us/fragments/14/fragment14_1077C0.o(.bss);
        build/asm/us/fragments/14/fragment14_109280.o(.bss);
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
        build/asm/us/fragments/17/fragment17_10F9E0.o(.text);
        build/asm/us/fragments/17/fragment17_10FFC0.o(.text);
        build/asm/us/fragments/17/fragment17_113A60.o(.text);
        build/asm/us/fragments/17/fragment17_11A7F0.o(.text);
        build/asm/us/fragments/17/fragment17_11B210.o(.text);
        fragment17_TEXT_END = .;
        fragment17_TEXT_SIZE = ABSOLUTE(fragment17_TEXT_END - fragment17_TEXT_START);
        fragment17_DATA_START = .;
        fragments_17_fragment17_header = .;
        build/asm/us/data/fragments/17/fragment17_header.o(.data);
        fragments_17_fragment17_10F9E0 = .;
        build/asm/us/fragments/17/fragment17_10F9E0.o(.data);
        fragments_17_fragment17_10FFC0 = .;
        build/asm/us/fragments/17/fragment17_10FFC0.o(.data);
        fragments_17_fragment17_113A60 = .;
        build/asm/us/fragments/17/fragment17_113A60.o(.data);
        fragments_17_fragment17_11A7F0 = .;
        build/asm/us/fragments/17/fragment17_11A7F0.o(.data);
        fragments_17_fragment17_11B210 = .;
        build/asm/us/fragments/17/fragment17_11B210.o(.data);
        fragments_17_fragment17_data_data = .;
        build/asm/us/data/fragments/17/fragment17_data.data.o(.data);
        fragment17_DATA_END = .;
        fragment17_DATA_SIZE = ABSOLUTE(fragment17_DATA_END - fragment17_DATA_START);
        fragment17_RODATA_START = .;
        build/asm/us/data/fragments/17/fragment17_header.o(.rodata);
        build/asm/us/fragments/17/fragment17_10F9E0.o(.rodata);
        build/asm/us/fragments/17/fragment17_10FFC0.o(.rodata);
        build/asm/us/fragments/17/fragment17_113A60.o(.rodata);
        build/asm/us/fragments/17/fragment17_11A7F0.o(.rodata);
        build/asm/us/fragments/17/fragment17_11B210.o(.rodata);
        fragment17_RODATA_END = .;
        fragment17_RODATA_SIZE = ABSOLUTE(fragment17_RODATA_END - fragment17_RODATA_START);
    }
    fragment17_bss_VRAM = ADDR(.fragment17_bss);
    .fragment17_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment17_BSS_START = .;
        build/asm/us/data/fragments/17/fragment17_header.o(.bss);
        build/asm/us/fragments/17/fragment17_10F9E0.o(.bss);
        build/asm/us/fragments/17/fragment17_10FFC0.o(.bss);
        build/asm/us/fragments/17/fragment17_113A60.o(.bss);
        build/asm/us/fragments/17/fragment17_11A7F0.o(.bss);
        build/asm/us/fragments/17/fragment17_11B210.o(.bss);
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
        build/asm/us/fragments/19/fragment19_121100.o(.text);
        build/asm/us/fragments/19/fragment19_124E40.o(.text);
        fragment19_TEXT_END = .;
        fragment19_TEXT_SIZE = ABSOLUTE(fragment19_TEXT_END - fragment19_TEXT_START);
        fragment19_DATA_START = .;
        fragments_19_fragment19_header = .;
        build/asm/us/data/fragments/19/fragment19_header.o(.data);
        fragments_19_fragment19_121100 = .;
        build/asm/us/fragments/19/fragment19_121100.o(.data);
        fragments_19_fragment19_124E40 = .;
        build/asm/us/fragments/19/fragment19_124E40.o(.data);
        fragments_19_fragment19_data_data = .;
        build/asm/us/data/fragments/19/fragment19_data.data.o(.data);
        fragment19_DATA_END = .;
        fragment19_DATA_SIZE = ABSOLUTE(fragment19_DATA_END - fragment19_DATA_START);
        fragment19_RODATA_START = .;
        build/asm/us/data/fragments/19/fragment19_header.o(.rodata);
        build/asm/us/fragments/19/fragment19_121100.o(.rodata);
        build/asm/us/fragments/19/fragment19_124E40.o(.rodata);
        fragment19_RODATA_END = .;
        fragment19_RODATA_SIZE = ABSOLUTE(fragment19_RODATA_END - fragment19_RODATA_START);
    }
    fragment19_bss_VRAM = ADDR(.fragment19_bss);
    .fragment19_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment19_BSS_START = .;
        build/asm/us/data/fragments/19/fragment19_header.o(.bss);
        build/asm/us/fragments/19/fragment19_121100.o(.bss);
        build/asm/us/fragments/19/fragment19_124E40.o(.bss);
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
        build/asm/us/fragments/20/fragment20_1280F0.o(.text);
        build/asm/us/fragments/20/fragment20_1286C0.o(.text);
        build/asm/us/fragments/20/fragment20_128B10.o(.text);
        build/asm/us/fragments/20/fragment20_12BB60.o(.text);
        build/asm/us/fragments/20/fragment20_12C460.o(.text);
        fragment20_TEXT_END = .;
        fragment20_TEXT_SIZE = ABSOLUTE(fragment20_TEXT_END - fragment20_TEXT_START);
        fragment20_DATA_START = .;
        fragments_20_fragment20_header = .;
        build/asm/us/data/fragments/20/fragment20_header.o(.data);
        fragments_20_fragment20_1280F0 = .;
        build/asm/us/fragments/20/fragment20_1280F0.o(.data);
        fragments_20_fragment20_1286C0 = .;
        build/asm/us/fragments/20/fragment20_1286C0.o(.data);
        fragments_20_fragment20_128B10 = .;
        build/asm/us/fragments/20/fragment20_128B10.o(.data);
        fragments_20_fragment20_12BB60 = .;
        build/asm/us/fragments/20/fragment20_12BB60.o(.data);
        fragments_20_fragment20_12C460 = .;
        build/asm/us/fragments/20/fragment20_12C460.o(.data);
        fragments_20_fragment20_data_data = .;
        build/asm/us/data/fragments/20/fragment20_data.data.o(.data);
        fragment20_DATA_END = .;
        fragment20_DATA_SIZE = ABSOLUTE(fragment20_DATA_END - fragment20_DATA_START);
        fragment20_RODATA_START = .;
        build/asm/us/data/fragments/20/fragment20_header.o(.rodata);
        build/asm/us/fragments/20/fragment20_1280F0.o(.rodata);
        build/asm/us/fragments/20/fragment20_1286C0.o(.rodata);
        build/asm/us/fragments/20/fragment20_128B10.o(.rodata);
        build/asm/us/fragments/20/fragment20_12BB60.o(.rodata);
        build/asm/us/fragments/20/fragment20_12C460.o(.rodata);
        fragment20_RODATA_END = .;
        fragment20_RODATA_SIZE = ABSOLUTE(fragment20_RODATA_END - fragment20_RODATA_START);
    }
    fragment20_bss_VRAM = ADDR(.fragment20_bss);
    .fragment20_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment20_BSS_START = .;
        build/asm/us/data/fragments/20/fragment20_header.o(.bss);
        build/asm/us/fragments/20/fragment20_1280F0.o(.bss);
        build/asm/us/fragments/20/fragment20_1286C0.o(.bss);
        build/asm/us/fragments/20/fragment20_128B10.o(.bss);
        build/asm/us/fragments/20/fragment20_12BB60.o(.bss);
        build/asm/us/fragments/20/fragment20_12C460.o(.bss);
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
        build/asm/us/fragments/21/fragment21_13FFA0.o(.text);
        build/asm/us/fragments/21/fragment21_144790.o(.text);
        build/asm/us/fragments/21/fragment21_147D10.o(.text);
        fragment21_TEXT_END = .;
        fragment21_TEXT_SIZE = ABSOLUTE(fragment21_TEXT_END - fragment21_TEXT_START);
        fragment21_DATA_START = .;
        fragments_21_fragment21_header = .;
        build/asm/us/data/fragments/21/fragment21_header.o(.data);
        fragments_21_fragment21_13FFA0 = .;
        build/asm/us/fragments/21/fragment21_13FFA0.o(.data);
        fragments_21_fragment21_144790 = .;
        build/asm/us/fragments/21/fragment21_144790.o(.data);
        fragments_21_fragment21_147D10 = .;
        build/asm/us/fragments/21/fragment21_147D10.o(.data);
        fragments_21_fragment21_data_data = .;
        build/asm/us/data/fragments/21/fragment21_data.data.o(.data);
        fragment21_DATA_END = .;
        fragment21_DATA_SIZE = ABSOLUTE(fragment21_DATA_END - fragment21_DATA_START);
        fragment21_RODATA_START = .;
        build/asm/us/data/fragments/21/fragment21_header.o(.rodata);
        build/asm/us/fragments/21/fragment21_13FFA0.o(.rodata);
        build/asm/us/fragments/21/fragment21_144790.o(.rodata);
        build/asm/us/fragments/21/fragment21_147D10.o(.rodata);
        fragment21_RODATA_END = .;
        fragment21_RODATA_SIZE = ABSOLUTE(fragment21_RODATA_END - fragment21_RODATA_START);
    }
    fragment21_bss_VRAM = ADDR(.fragment21_bss);
    .fragment21_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment21_BSS_START = .;
        build/asm/us/data/fragments/21/fragment21_header.o(.bss);
        build/asm/us/fragments/21/fragment21_13FFA0.o(.bss);
        build/asm/us/fragments/21/fragment21_144790.o(.bss);
        build/asm/us/fragments/21/fragment21_147D10.o(.bss);
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
        build/asm/us/fragments/22/fragment22_14A2E0.o(.text);
        build/asm/us/fragments/22/fragment22_14B090.o(.text);
        fragment22_TEXT_END = .;
        fragment22_TEXT_SIZE = ABSOLUTE(fragment22_TEXT_END - fragment22_TEXT_START);
        fragment22_DATA_START = .;
        fragments_22_fragment22_header = .;
        build/asm/us/data/fragments/22/fragment22_header.o(.data);
        fragments_22_fragment22_14A2E0 = .;
        build/asm/us/fragments/22/fragment22_14A2E0.o(.data);
        fragments_22_fragment22_14B090 = .;
        build/asm/us/fragments/22/fragment22_14B090.o(.data);
        fragments_22_fragment22_data_data = .;
        build/asm/us/data/fragments/22/fragment22_data.data.o(.data);
        fragment22_DATA_END = .;
        fragment22_DATA_SIZE = ABSOLUTE(fragment22_DATA_END - fragment22_DATA_START);
        fragment22_RODATA_START = .;
        build/asm/us/data/fragments/22/fragment22_header.o(.rodata);
        build/asm/us/fragments/22/fragment22_14A2E0.o(.rodata);
        build/asm/us/fragments/22/fragment22_14B090.o(.rodata);
        fragment22_RODATA_END = .;
        fragment22_RODATA_SIZE = ABSOLUTE(fragment22_RODATA_END - fragment22_RODATA_START);
    }
    fragment22_bss_VRAM = ADDR(.fragment22_bss);
    .fragment22_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment22_BSS_START = .;
        build/asm/us/data/fragments/22/fragment22_header.o(.bss);
        build/asm/us/fragments/22/fragment22_14A2E0.o(.bss);
        build/asm/us/fragments/22/fragment22_14B090.o(.bss);
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
        build/asm/us/fragments/24/fragment24_14FE20.o(.text);
        build/asm/us/fragments/24/fragment24_150C10.o(.text);
        fragment24_TEXT_END = .;
        fragment24_TEXT_SIZE = ABSOLUTE(fragment24_TEXT_END - fragment24_TEXT_START);
        fragment24_DATA_START = .;
        fragments_24_fragment24_header = .;
        build/asm/us/data/fragments/24/fragment24_header.o(.data);
        fragments_24_fragment24_14FE20 = .;
        build/asm/us/fragments/24/fragment24_14FE20.o(.data);
        fragments_24_fragment24_150C10 = .;
        build/asm/us/fragments/24/fragment24_150C10.o(.data);
        fragments_24_fragment24_data_data = .;
        build/asm/us/data/fragments/24/fragment24_data.data.o(.data);
        fragment24_DATA_END = .;
        fragment24_DATA_SIZE = ABSOLUTE(fragment24_DATA_END - fragment24_DATA_START);
        fragment24_RODATA_START = .;
        build/asm/us/data/fragments/24/fragment24_header.o(.rodata);
        build/asm/us/fragments/24/fragment24_14FE20.o(.rodata);
        build/asm/us/fragments/24/fragment24_150C10.o(.rodata);
        fragment24_RODATA_END = .;
        fragment24_RODATA_SIZE = ABSOLUTE(fragment24_RODATA_END - fragment24_RODATA_START);
    }
    fragment24_bss_VRAM = ADDR(.fragment24_bss);
    .fragment24_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment24_BSS_START = .;
        build/asm/us/data/fragments/24/fragment24_header.o(.bss);
        build/asm/us/fragments/24/fragment24_14FE20.o(.bss);
        build/asm/us/fragments/24/fragment24_150C10.o(.bss);
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
        build/asm/us/fragments/25/fragment25_15A060.o(.text);
        build/asm/us/fragments/25/fragment25_15BBC0.o(.text);
        build/asm/us/fragments/25/fragment25_15C920.o(.text);
        build/asm/us/fragments/25/fragment25_15CBC0.o(.text);
        fragment25_TEXT_END = .;
        fragment25_TEXT_SIZE = ABSOLUTE(fragment25_TEXT_END - fragment25_TEXT_START);
        fragment25_DATA_START = .;
        fragments_25_fragment25_header = .;
        build/asm/us/data/fragments/25/fragment25_header.o(.data);
        fragments_25_fragment25_15A060 = .;
        build/asm/us/fragments/25/fragment25_15A060.o(.data);
        fragments_25_fragment25_15BBC0 = .;
        build/asm/us/fragments/25/fragment25_15BBC0.o(.data);
        fragments_25_fragment25_15C920 = .;
        build/asm/us/fragments/25/fragment25_15C920.o(.data);
        fragments_25_fragment25_15CBC0 = .;
        build/asm/us/fragments/25/fragment25_15CBC0.o(.data);
        fragments_25_fragment25_data_data = .;
        build/asm/us/data/fragments/25/fragment25_data.data.o(.data);
        fragment25_DATA_END = .;
        fragment25_DATA_SIZE = ABSOLUTE(fragment25_DATA_END - fragment25_DATA_START);
        fragment25_RODATA_START = .;
        build/asm/us/data/fragments/25/fragment25_header.o(.rodata);
        build/asm/us/fragments/25/fragment25_15A060.o(.rodata);
        build/asm/us/fragments/25/fragment25_15BBC0.o(.rodata);
        build/asm/us/fragments/25/fragment25_15C920.o(.rodata);
        build/asm/us/fragments/25/fragment25_15CBC0.o(.rodata);
        fragment25_RODATA_END = .;
        fragment25_RODATA_SIZE = ABSOLUTE(fragment25_RODATA_END - fragment25_RODATA_START);
    }
    fragment25_bss_VRAM = ADDR(.fragment25_bss);
    .fragment25_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment25_BSS_START = .;
        build/asm/us/data/fragments/25/fragment25_header.o(.bss);
        build/asm/us/fragments/25/fragment25_15A060.o(.bss);
        build/asm/us/fragments/25/fragment25_15BBC0.o(.bss);
        build/asm/us/fragments/25/fragment25_15C920.o(.bss);
        build/asm/us/fragments/25/fragment25_15CBC0.o(.bss);
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
        build/asm/us/fragments/26/fragment26_15EA30.o(.text);
        build/asm/us/fragments/26/fragment26_162090.o(.text);
        build/asm/us/fragments/26/fragment26_1622D0.o(.text);
        build/asm/us/fragments/26/fragment26_162370.o(.text);
        build/asm/us/fragments/26/fragment26_1624E0.o(.text);
        build/asm/us/fragments/26/fragment26_162710.o(.text);
        build/asm/us/fragments/26/fragment26_164280.o(.text);
        build/asm/us/fragments/26/fragment26_164400.o(.text);
        build/asm/us/fragments/26/fragment26_1646B0.o(.text);
        build/asm/us/fragments/26/fragment26_164860.o(.text);
        fragment26_TEXT_END = .;
        fragment26_TEXT_SIZE = ABSOLUTE(fragment26_TEXT_END - fragment26_TEXT_START);
        fragment26_DATA_START = .;
        fragments_26_fragment26_header = .;
        build/asm/us/data/fragments/26/fragment26_header.o(.data);
        fragments_26_fragment26_unk_table = .;
        build/asm/us/data/fragments/26/fragment26_unk_table.o(.data);
        fragments_26_fragment26_15EA30 = .;
        build/asm/us/fragments/26/fragment26_15EA30.o(.data);
        fragments_26_fragment26_162090 = .;
        build/asm/us/fragments/26/fragment26_162090.o(.data);
        fragments_26_fragment26_1622D0 = .;
        build/asm/us/fragments/26/fragment26_1622D0.o(.data);
        fragments_26_fragment26_162370 = .;
        build/asm/us/fragments/26/fragment26_162370.o(.data);
        fragments_26_fragment26_1624E0 = .;
        build/asm/us/fragments/26/fragment26_1624E0.o(.data);
        fragments_26_fragment26_162710 = .;
        build/asm/us/fragments/26/fragment26_162710.o(.data);
        fragments_26_fragment26_164280 = .;
        build/asm/us/fragments/26/fragment26_164280.o(.data);
        fragments_26_fragment26_164400 = .;
        build/asm/us/fragments/26/fragment26_164400.o(.data);
        fragments_26_fragment26_1646B0 = .;
        build/asm/us/fragments/26/fragment26_1646B0.o(.data);
        fragments_26_fragment26_164860 = .;
        build/asm/us/fragments/26/fragment26_164860.o(.data);
        fragments_26_fragment26_data_data = .;
        build/asm/us/data/fragments/26/fragment26_data.data.o(.data);
        fragment26_DATA_END = .;
        fragment26_DATA_SIZE = ABSOLUTE(fragment26_DATA_END - fragment26_DATA_START);
        fragment26_RODATA_START = .;
        build/asm/us/data/fragments/26/fragment26_header.o(.rodata);
        build/asm/us/data/fragments/26/fragment26_unk_table.o(.rodata);
        build/asm/us/fragments/26/fragment26_15EA30.o(.rodata);
        build/asm/us/fragments/26/fragment26_162090.o(.rodata);
        build/asm/us/fragments/26/fragment26_1622D0.o(.rodata);
        build/asm/us/fragments/26/fragment26_162370.o(.rodata);
        build/asm/us/fragments/26/fragment26_1624E0.o(.rodata);
        build/asm/us/fragments/26/fragment26_162710.o(.rodata);
        build/asm/us/fragments/26/fragment26_164280.o(.rodata);
        build/asm/us/fragments/26/fragment26_164400.o(.rodata);
        build/asm/us/fragments/26/fragment26_1646B0.o(.rodata);
        build/asm/us/fragments/26/fragment26_164860.o(.rodata);
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
        build/asm/us/fragments/26/fragment26_15EA30.o(.bss);
        build/asm/us/fragments/26/fragment26_162090.o(.bss);
        build/asm/us/fragments/26/fragment26_1622D0.o(.bss);
        build/asm/us/fragments/26/fragment26_162370.o(.bss);
        build/asm/us/fragments/26/fragment26_1624E0.o(.bss);
        build/asm/us/fragments/26/fragment26_162710.o(.bss);
        build/asm/us/fragments/26/fragment26_164280.o(.bss);
        build/asm/us/fragments/26/fragment26_164400.o(.bss);
        build/asm/us/fragments/26/fragment26_1646B0.o(.bss);
        build/asm/us/fragments/26/fragment26_164860.o(.bss);
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
        fragments_27_fragment27_data_data = .;
        build/asm/us/data/fragments/27/fragment27_data.data.o(.data);
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
        build/asm/us/fragments/29/fragment29_166060.o(.text);
        build/asm/us/fragments/29/fragment29_167940.o(.text);
        build/asm/us/fragments/29/fragment29_168330.o(.text);
        build/asm/us/fragments/29/fragment29_16AA30.o(.text);
        build/asm/us/fragments/29/fragment29_16AEF0.o(.text);
        build/asm/us/fragments/29/fragment29_16B030.o(.text);
        build/asm/us/fragments/29/fragment29_16BBA0.o(.text);
        fragment29_TEXT_END = .;
        fragment29_TEXT_SIZE = ABSOLUTE(fragment29_TEXT_END - fragment29_TEXT_START);
        fragment29_DATA_START = .;
        fragments_29_fragment29_header = .;
        build/asm/us/data/fragments/29/fragment29_header.o(.data);
        fragments_29_fragment29_166060 = .;
        build/asm/us/fragments/29/fragment29_166060.o(.data);
        fragments_29_fragment29_167940 = .;
        build/asm/us/fragments/29/fragment29_167940.o(.data);
        fragments_29_fragment29_168330 = .;
        build/asm/us/fragments/29/fragment29_168330.o(.data);
        fragments_29_fragment29_16AA30 = .;
        build/asm/us/fragments/29/fragment29_16AA30.o(.data);
        fragments_29_fragment29_16AEF0 = .;
        build/asm/us/fragments/29/fragment29_16AEF0.o(.data);
        fragments_29_fragment29_16B030 = .;
        build/asm/us/fragments/29/fragment29_16B030.o(.data);
        fragments_29_fragment29_16BBA0 = .;
        build/asm/us/fragments/29/fragment29_16BBA0.o(.data);
        fragments_29_fragment29_data_data = .;
        build/asm/us/data/fragments/29/fragment29_data.data.o(.data);
        fragment29_DATA_END = .;
        fragment29_DATA_SIZE = ABSOLUTE(fragment29_DATA_END - fragment29_DATA_START);
        fragment29_RODATA_START = .;
        build/asm/us/data/fragments/29/fragment29_header.o(.rodata);
        build/asm/us/fragments/29/fragment29_166060.o(.rodata);
        build/asm/us/fragments/29/fragment29_167940.o(.rodata);
        build/asm/us/fragments/29/fragment29_168330.o(.rodata);
        build/asm/us/fragments/29/fragment29_16AA30.o(.rodata);
        build/asm/us/fragments/29/fragment29_16AEF0.o(.rodata);
        build/asm/us/fragments/29/fragment29_16B030.o(.rodata);
        build/asm/us/fragments/29/fragment29_16BBA0.o(.rodata);
        fragment29_RODATA_END = .;
        fragment29_RODATA_SIZE = ABSOLUTE(fragment29_RODATA_END - fragment29_RODATA_START);
    }
    fragment29_bss_VRAM = ADDR(.fragment29_bss);
    .fragment29_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment29_BSS_START = .;
        build/asm/us/data/fragments/29/fragment29_header.o(.bss);
        build/asm/us/fragments/29/fragment29_166060.o(.bss);
        build/asm/us/fragments/29/fragment29_167940.o(.bss);
        build/asm/us/fragments/29/fragment29_168330.o(.bss);
        build/asm/us/fragments/29/fragment29_16AA30.o(.bss);
        build/asm/us/fragments/29/fragment29_16AEF0.o(.bss);
        build/asm/us/fragments/29/fragment29_16B030.o(.bss);
        build/asm/us/fragments/29/fragment29_16BBA0.o(.bss);
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
    .fragment30 0x88100000 : AT(fragment30_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment30_TEXT_START = .;
        build/asm/us/data/fragments/30/fragment30_header.o(.text);
        build/asm/us/fragments/30/fragment30_16D4F0.o(.text);
        build/asm/us/fragments/30/fragment30_170430.o(.text);
        build/asm/us/fragments/30/fragment30_170D70.o(.text);
        fragment30_TEXT_END = .;
        fragment30_TEXT_SIZE = ABSOLUTE(fragment30_TEXT_END - fragment30_TEXT_START);
        fragment30_DATA_START = .;
        fragments_30_fragment30_header = .;
        build/asm/us/data/fragments/30/fragment30_header.o(.data);
        fragments_30_fragment30_16D4F0 = .;
        build/asm/us/fragments/30/fragment30_16D4F0.o(.data);
        fragments_30_fragment30_170430 = .;
        build/asm/us/fragments/30/fragment30_170430.o(.data);
        fragments_30_fragment30_170D70 = .;
        build/asm/us/fragments/30/fragment30_170D70.o(.data);
        fragments_30_fragment30_data_data = .;
        build/asm/us/data/fragments/30/fragment30_data.data.o(.data);
        fragment30_DATA_END = .;
        fragment30_DATA_SIZE = ABSOLUTE(fragment30_DATA_END - fragment30_DATA_START);
        fragment30_RODATA_START = .;
        build/asm/us/data/fragments/30/fragment30_header.o(.rodata);
        build/asm/us/fragments/30/fragment30_16D4F0.o(.rodata);
        build/asm/us/fragments/30/fragment30_170430.o(.rodata);
        build/asm/us/fragments/30/fragment30_170D70.o(.rodata);
        fragment30_RODATA_END = .;
        fragment30_RODATA_SIZE = ABSOLUTE(fragment30_RODATA_END - fragment30_RODATA_START);
    }
    fragment30_bss_VRAM = ADDR(.fragment30_bss);
    .fragment30_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment30_BSS_START = .;
        build/asm/us/data/fragments/30/fragment30_header.o(.bss);
        build/asm/us/fragments/30/fragment30_16D4F0.o(.bss);
        build/asm/us/fragments/30/fragment30_170430.o(.bss);
        build/asm/us/fragments/30/fragment30_170D70.o(.bss);
        fragment30_BSS_END = .;
        fragment30_BSS_SIZE = ABSOLUTE(fragment30_BSS_END - fragment30_BSS_START);
    }
    __romPos += SIZEOF(.fragment30);
    fragment30_ROM_END = __romPos;
    fragment30_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment31_ROM_START = __romPos;
    fragment31_VRAM = ADDR(.fragment31);
    .fragment31 0x88200000 : AT(fragment31_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment31_TEXT_START = .;
        build/asm/us/data/fragments/31/fragment31_header.o(.text);
        build/asm/us/fragments/31/fragment31_1732A0.o(.text);
        build/asm/us/fragments/31/fragment31_1736F0.o(.text);
        build/asm/us/fragments/31/fragment31_174460.o(.text);
        build/asm/us/fragments/31/fragment31_175260.o(.text);
        build/asm/us/fragments/31/fragment31_1768F0.o(.text);
        build/asm/us/fragments/31/fragment31_177430.o(.text);
        build/asm/us/fragments/31/fragment31_179030.o(.text);
        build/asm/us/fragments/31/fragment31_17B150.o(.text);
        build/asm/us/fragments/31/fragment31_17F280.o(.text);
        build/asm/us/fragments/31/fragment31_183700.o(.text);
        build/asm/us/fragments/31/fragment31_186690.o(.text);
        build/asm/us/fragments/31/fragment31_18F6D0.o(.text);
        build/asm/us/fragments/31/fragment31_1900C0.o(.text);
        build/asm/us/fragments/31/fragment31_190BB0.o(.text);
        build/asm/us/fragments/31/fragment31_193D50.o(.text);
        build/asm/us/fragments/31/fragment31_194450.o(.text);
        build/asm/us/fragments/31/fragment31_194C30.o(.text);
        build/asm/us/fragments/31/fragment31_195910.o(.text);
        build/asm/us/fragments/31/fragment31_1965A0.o(.text);
        build/asm/us/fragments/31/fragment31_197640.o(.text);
        build/asm/us/fragments/31/fragment31_19BCA0.o(.text);
        build/asm/us/fragments/31/fragment31_19C000.o(.text);
        build/asm/us/fragments/31/fragment31_19C390.o(.text);
        build/asm/us/fragments/31/fragment31_19CD60.o(.text);
        build/asm/us/fragments/31/fragment31_19D160.o(.text);
        build/asm/us/fragments/31/fragment31_19DCA0.o(.text);
        build/asm/us/fragments/31/fragment31_19DFC0.o(.text);
        build/asm/us/fragments/31/fragment31_19E800.o(.text);
        build/asm/us/fragments/31/fragment31_19F570.o(.text);
        build/asm/us/fragments/31/fragment31_1A03C0.o(.text);
        build/asm/us/fragments/31/fragment31_1A1AF0.o(.text);
        build/asm/us/fragments/31/fragment31_1A1BD0.o(.text);
        build/asm/us/fragments/31/fragment31_1A3540.o(.text);
        build/asm/us/fragments/31/fragment31_1A3730.o(.text);
        build/asm/us/fragments/31/fragment31_1A3960.o(.text);
        build/asm/us/fragments/31/fragment31_1A4160.o(.text);
        build/asm/us/fragments/31/fragment31_1A43F0.o(.text);
        build/asm/us/fragments/31/fragment31_1A46B0.o(.text);
        build/asm/us/fragments/31/fragment31_1A4B70.o(.text);
        build/asm/us/fragments/31/fragment31_1A4FF0.o(.text);
        build/asm/us/fragments/31/fragment31_1A51E0.o(.text);
        build/asm/us/fragments/31/fragment31_1A53B0.o(.text);
        build/asm/us/fragments/31/fragment31_1A5AE0.o(.text);
        build/asm/us/fragments/31/fragment31_1A5E10.o(.text);
        build/asm/us/fragments/31/fragment31_1A60F0.o(.text);
        build/asm/us/fragments/31/fragment31_1A6360.o(.text);
        fragment31_TEXT_END = .;
        fragment31_TEXT_SIZE = ABSOLUTE(fragment31_TEXT_END - fragment31_TEXT_START);
        fragment31_DATA_START = .;
        fragments_31_fragment31_header = .;
        build/asm/us/data/fragments/31/fragment31_header.o(.data);
        fragments_31_fragment31_1732A0 = .;
        build/asm/us/fragments/31/fragment31_1732A0.o(.data);
        fragments_31_fragment31_1736F0 = .;
        build/asm/us/fragments/31/fragment31_1736F0.o(.data);
        fragments_31_fragment31_174460 = .;
        build/asm/us/fragments/31/fragment31_174460.o(.data);
        fragments_31_fragment31_175260 = .;
        build/asm/us/fragments/31/fragment31_175260.o(.data);
        fragments_31_fragment31_1768F0 = .;
        build/asm/us/fragments/31/fragment31_1768F0.o(.data);
        fragments_31_fragment31_177430 = .;
        build/asm/us/fragments/31/fragment31_177430.o(.data);
        fragments_31_fragment31_179030 = .;
        build/asm/us/fragments/31/fragment31_179030.o(.data);
        fragments_31_fragment31_17B150 = .;
        build/asm/us/fragments/31/fragment31_17B150.o(.data);
        fragments_31_fragment31_17F280 = .;
        build/asm/us/fragments/31/fragment31_17F280.o(.data);
        fragments_31_fragment31_183700 = .;
        build/asm/us/fragments/31/fragment31_183700.o(.data);
        fragments_31_fragment31_186690 = .;
        build/asm/us/fragments/31/fragment31_186690.o(.data);
        fragments_31_fragment31_18F6D0 = .;
        build/asm/us/fragments/31/fragment31_18F6D0.o(.data);
        fragments_31_fragment31_1900C0 = .;
        build/asm/us/fragments/31/fragment31_1900C0.o(.data);
        fragments_31_fragment31_190BB0 = .;
        build/asm/us/fragments/31/fragment31_190BB0.o(.data);
        fragments_31_fragment31_193D50 = .;
        build/asm/us/fragments/31/fragment31_193D50.o(.data);
        fragments_31_fragment31_194450 = .;
        build/asm/us/fragments/31/fragment31_194450.o(.data);
        fragments_31_fragment31_194C30 = .;
        build/asm/us/fragments/31/fragment31_194C30.o(.data);
        fragments_31_fragment31_195910 = .;
        build/asm/us/fragments/31/fragment31_195910.o(.data);
        fragments_31_fragment31_1965A0 = .;
        build/asm/us/fragments/31/fragment31_1965A0.o(.data);
        fragments_31_fragment31_197640 = .;
        build/asm/us/fragments/31/fragment31_197640.o(.data);
        fragments_31_fragment31_19BCA0 = .;
        build/asm/us/fragments/31/fragment31_19BCA0.o(.data);
        fragments_31_fragment31_19C000 = .;
        build/asm/us/fragments/31/fragment31_19C000.o(.data);
        fragments_31_fragment31_19C390 = .;
        build/asm/us/fragments/31/fragment31_19C390.o(.data);
        fragments_31_fragment31_19CD60 = .;
        build/asm/us/fragments/31/fragment31_19CD60.o(.data);
        fragments_31_fragment31_19D160 = .;
        build/asm/us/fragments/31/fragment31_19D160.o(.data);
        fragments_31_fragment31_19DCA0 = .;
        build/asm/us/fragments/31/fragment31_19DCA0.o(.data);
        fragments_31_fragment31_19DFC0 = .;
        build/asm/us/fragments/31/fragment31_19DFC0.o(.data);
        fragments_31_fragment31_19E800 = .;
        build/asm/us/fragments/31/fragment31_19E800.o(.data);
        fragments_31_fragment31_19F570 = .;
        build/asm/us/fragments/31/fragment31_19F570.o(.data);
        fragments_31_fragment31_1A03C0 = .;
        build/asm/us/fragments/31/fragment31_1A03C0.o(.data);
        fragments_31_fragment31_1A1AF0 = .;
        build/asm/us/fragments/31/fragment31_1A1AF0.o(.data);
        fragments_31_fragment31_1A1BD0 = .;
        build/asm/us/fragments/31/fragment31_1A1BD0.o(.data);
        fragments_31_fragment31_1A3540 = .;
        build/asm/us/fragments/31/fragment31_1A3540.o(.data);
        fragments_31_fragment31_1A3730 = .;
        build/asm/us/fragments/31/fragment31_1A3730.o(.data);
        fragments_31_fragment31_1A3960 = .;
        build/asm/us/fragments/31/fragment31_1A3960.o(.data);
        fragments_31_fragment31_1A4160 = .;
        build/asm/us/fragments/31/fragment31_1A4160.o(.data);
        fragments_31_fragment31_1A43F0 = .;
        build/asm/us/fragments/31/fragment31_1A43F0.o(.data);
        fragments_31_fragment31_1A46B0 = .;
        build/asm/us/fragments/31/fragment31_1A46B0.o(.data);
        fragments_31_fragment31_1A4B70 = .;
        build/asm/us/fragments/31/fragment31_1A4B70.o(.data);
        fragments_31_fragment31_1A4FF0 = .;
        build/asm/us/fragments/31/fragment31_1A4FF0.o(.data);
        fragments_31_fragment31_1A51E0 = .;
        build/asm/us/fragments/31/fragment31_1A51E0.o(.data);
        fragments_31_fragment31_1A53B0 = .;
        build/asm/us/fragments/31/fragment31_1A53B0.o(.data);
        fragments_31_fragment31_1A5AE0 = .;
        build/asm/us/fragments/31/fragment31_1A5AE0.o(.data);
        fragments_31_fragment31_1A5E10 = .;
        build/asm/us/fragments/31/fragment31_1A5E10.o(.data);
        fragments_31_fragment31_1A60F0 = .;
        build/asm/us/fragments/31/fragment31_1A60F0.o(.data);
        fragments_31_fragment31_1A6360 = .;
        build/asm/us/fragments/31/fragment31_1A6360.o(.data);
        fragments_31_fragment31_data_data = .;
        build/asm/us/data/fragments/31/fragment31_data.data.o(.data);
        fragment31_DATA_END = .;
        fragment31_DATA_SIZE = ABSOLUTE(fragment31_DATA_END - fragment31_DATA_START);
        fragment31_RODATA_START = .;
        build/asm/us/data/fragments/31/fragment31_header.o(.rodata);
        build/asm/us/fragments/31/fragment31_1732A0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1736F0.o(.rodata);
        build/asm/us/fragments/31/fragment31_174460.o(.rodata);
        build/asm/us/fragments/31/fragment31_175260.o(.rodata);
        build/asm/us/fragments/31/fragment31_1768F0.o(.rodata);
        build/asm/us/fragments/31/fragment31_177430.o(.rodata);
        build/asm/us/fragments/31/fragment31_179030.o(.rodata);
        build/asm/us/fragments/31/fragment31_17B150.o(.rodata);
        build/asm/us/fragments/31/fragment31_17F280.o(.rodata);
        build/asm/us/fragments/31/fragment31_183700.o(.rodata);
        build/asm/us/fragments/31/fragment31_186690.o(.rodata);
        build/asm/us/fragments/31/fragment31_18F6D0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1900C0.o(.rodata);
        build/asm/us/fragments/31/fragment31_190BB0.o(.rodata);
        build/asm/us/fragments/31/fragment31_193D50.o(.rodata);
        build/asm/us/fragments/31/fragment31_194450.o(.rodata);
        build/asm/us/fragments/31/fragment31_194C30.o(.rodata);
        build/asm/us/fragments/31/fragment31_195910.o(.rodata);
        build/asm/us/fragments/31/fragment31_1965A0.o(.rodata);
        build/asm/us/fragments/31/fragment31_197640.o(.rodata);
        build/asm/us/fragments/31/fragment31_19BCA0.o(.rodata);
        build/asm/us/fragments/31/fragment31_19C000.o(.rodata);
        build/asm/us/fragments/31/fragment31_19C390.o(.rodata);
        build/asm/us/fragments/31/fragment31_19CD60.o(.rodata);
        build/asm/us/fragments/31/fragment31_19D160.o(.rodata);
        build/asm/us/fragments/31/fragment31_19DCA0.o(.rodata);
        build/asm/us/fragments/31/fragment31_19DFC0.o(.rodata);
        build/asm/us/fragments/31/fragment31_19E800.o(.rodata);
        build/asm/us/fragments/31/fragment31_19F570.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A03C0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A1AF0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A1BD0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A3540.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A3730.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A3960.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A4160.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A43F0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A46B0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A4B70.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A4FF0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A51E0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A53B0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A5AE0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A5E10.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A60F0.o(.rodata);
        build/asm/us/fragments/31/fragment31_1A6360.o(.rodata);
        fragment31_RODATA_END = .;
        fragment31_RODATA_SIZE = ABSOLUTE(fragment31_RODATA_END - fragment31_RODATA_START);
    }
    fragment31_bss_VRAM = ADDR(.fragment31_bss);
    .fragment31_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment31_BSS_START = .;
        build/asm/us/data/fragments/31/fragment31_header.o(.bss);
        build/asm/us/fragments/31/fragment31_1732A0.o(.bss);
        build/asm/us/fragments/31/fragment31_1736F0.o(.bss);
        build/asm/us/fragments/31/fragment31_174460.o(.bss);
        build/asm/us/fragments/31/fragment31_175260.o(.bss);
        build/asm/us/fragments/31/fragment31_1768F0.o(.bss);
        build/asm/us/fragments/31/fragment31_177430.o(.bss);
        build/asm/us/fragments/31/fragment31_179030.o(.bss);
        build/asm/us/fragments/31/fragment31_17B150.o(.bss);
        build/asm/us/fragments/31/fragment31_17F280.o(.bss);
        build/asm/us/fragments/31/fragment31_183700.o(.bss);
        build/asm/us/fragments/31/fragment31_186690.o(.bss);
        build/asm/us/fragments/31/fragment31_18F6D0.o(.bss);
        build/asm/us/fragments/31/fragment31_1900C0.o(.bss);
        build/asm/us/fragments/31/fragment31_190BB0.o(.bss);
        build/asm/us/fragments/31/fragment31_193D50.o(.bss);
        build/asm/us/fragments/31/fragment31_194450.o(.bss);
        build/asm/us/fragments/31/fragment31_194C30.o(.bss);
        build/asm/us/fragments/31/fragment31_195910.o(.bss);
        build/asm/us/fragments/31/fragment31_1965A0.o(.bss);
        build/asm/us/fragments/31/fragment31_197640.o(.bss);
        build/asm/us/fragments/31/fragment31_19BCA0.o(.bss);
        build/asm/us/fragments/31/fragment31_19C000.o(.bss);
        build/asm/us/fragments/31/fragment31_19C390.o(.bss);
        build/asm/us/fragments/31/fragment31_19CD60.o(.bss);
        build/asm/us/fragments/31/fragment31_19D160.o(.bss);
        build/asm/us/fragments/31/fragment31_19DCA0.o(.bss);
        build/asm/us/fragments/31/fragment31_19DFC0.o(.bss);
        build/asm/us/fragments/31/fragment31_19E800.o(.bss);
        build/asm/us/fragments/31/fragment31_19F570.o(.bss);
        build/asm/us/fragments/31/fragment31_1A03C0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A1AF0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A1BD0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A3540.o(.bss);
        build/asm/us/fragments/31/fragment31_1A3730.o(.bss);
        build/asm/us/fragments/31/fragment31_1A3960.o(.bss);
        build/asm/us/fragments/31/fragment31_1A4160.o(.bss);
        build/asm/us/fragments/31/fragment31_1A43F0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A46B0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A4B70.o(.bss);
        build/asm/us/fragments/31/fragment31_1A4FF0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A51E0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A53B0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A5AE0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A5E10.o(.bss);
        build/asm/us/fragments/31/fragment31_1A60F0.o(.bss);
        build/asm/us/fragments/31/fragment31_1A6360.o(.bss);
        fragment31_BSS_END = .;
        fragment31_BSS_SIZE = ABSOLUTE(fragment31_BSS_END - fragment31_BSS_START);
    }
    __romPos += SIZEOF(.fragment31);
    fragment31_ROM_END = __romPos;
    fragment31_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment32_ROM_START = __romPos;
    fragment32_VRAM = ADDR(.fragment32);
    .fragment32 0x88300000 : AT(fragment32_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment32_TEXT_START = .;
        build/asm/us/data/fragments/32/fragment32_header.o(.text);
        build/asm/us/fragments/32/fragment32_1B1330.o(.text);
        build/asm/us/fragments/32/fragment32_1B6E40.o(.text);
        build/asm/us/fragments/32/fragment32_1B8010.o(.text);
        build/asm/us/fragments/32/fragment32_1B8DE0.o(.text);
        build/asm/us/fragments/32/fragment32_1B92C0.o(.text);
        build/asm/us/fragments/32/fragment32_1B9390.o(.text);
        build/asm/us/fragments/32/fragment32_1B9840.o(.text);
        fragment32_TEXT_END = .;
        fragment32_TEXT_SIZE = ABSOLUTE(fragment32_TEXT_END - fragment32_TEXT_START);
        fragment32_DATA_START = .;
        fragments_32_fragment32_header = .;
        build/asm/us/data/fragments/32/fragment32_header.o(.data);
        fragments_32_fragment32_1B1330 = .;
        build/asm/us/fragments/32/fragment32_1B1330.o(.data);
        fragments_32_fragment32_1B6E40 = .;
        build/asm/us/fragments/32/fragment32_1B6E40.o(.data);
        fragments_32_fragment32_1B8010 = .;
        build/asm/us/fragments/32/fragment32_1B8010.o(.data);
        fragments_32_fragment32_1B8DE0 = .;
        build/asm/us/fragments/32/fragment32_1B8DE0.o(.data);
        fragments_32_fragment32_1B92C0 = .;
        build/asm/us/fragments/32/fragment32_1B92C0.o(.data);
        fragments_32_fragment32_1B9390 = .;
        build/asm/us/fragments/32/fragment32_1B9390.o(.data);
        fragments_32_fragment32_1B9840 = .;
        build/asm/us/fragments/32/fragment32_1B9840.o(.data);
        fragments_32_fragment32_data_data = .;
        build/asm/us/data/fragments/32/fragment32_data.data.o(.data);
        fragment32_DATA_END = .;
        fragment32_DATA_SIZE = ABSOLUTE(fragment32_DATA_END - fragment32_DATA_START);
        fragment32_RODATA_START = .;
        build/asm/us/data/fragments/32/fragment32_header.o(.rodata);
        build/asm/us/fragments/32/fragment32_1B1330.o(.rodata);
        build/asm/us/fragments/32/fragment32_1B6E40.o(.rodata);
        build/asm/us/fragments/32/fragment32_1B8010.o(.rodata);
        build/asm/us/fragments/32/fragment32_1B8DE0.o(.rodata);
        build/asm/us/fragments/32/fragment32_1B92C0.o(.rodata);
        build/asm/us/fragments/32/fragment32_1B9390.o(.rodata);
        build/asm/us/fragments/32/fragment32_1B9840.o(.rodata);
        fragment32_RODATA_END = .;
        fragment32_RODATA_SIZE = ABSOLUTE(fragment32_RODATA_END - fragment32_RODATA_START);
    }
    fragment32_bss_VRAM = ADDR(.fragment32_bss);
    .fragment32_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment32_BSS_START = .;
        build/asm/us/data/fragments/32/fragment32_header.o(.bss);
        build/asm/us/fragments/32/fragment32_1B1330.o(.bss);
        build/asm/us/fragments/32/fragment32_1B6E40.o(.bss);
        build/asm/us/fragments/32/fragment32_1B8010.o(.bss);
        build/asm/us/fragments/32/fragment32_1B8DE0.o(.bss);
        build/asm/us/fragments/32/fragment32_1B92C0.o(.bss);
        build/asm/us/fragments/32/fragment32_1B9390.o(.bss);
        build/asm/us/fragments/32/fragment32_1B9840.o(.bss);
        fragment32_BSS_END = .;
        fragment32_BSS_SIZE = ABSOLUTE(fragment32_BSS_END - fragment32_BSS_START);
    }
    __romPos += SIZEOF(.fragment32);
    fragment32_ROM_END = __romPos;
    fragment32_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment33_ROM_START = __romPos;
    fragment33_VRAM = ADDR(.fragment33);
    .fragment33 0x88400000 : AT(fragment33_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment33_TEXT_START = .;
        build/asm/us/data/fragments/33/fragment33_header.o(.text);
        build/asm/us/fragments/33/fragment33_code.o(.text);
        fragment33_TEXT_END = .;
        fragment33_TEXT_SIZE = ABSOLUTE(fragment33_TEXT_END - fragment33_TEXT_START);
        fragment33_DATA_START = .;
        fragments_33_fragment33_header = .;
        build/asm/us/data/fragments/33/fragment33_header.o(.data);
        fragments_33_fragment33_code = .;
        build/asm/us/fragments/33/fragment33_code.o(.data);
        fragments_33_fragment33_data_data = .;
        build/asm/us/data/fragments/33/fragment33_data.data.o(.data);
        fragment33_DATA_END = .;
        fragment33_DATA_SIZE = ABSOLUTE(fragment33_DATA_END - fragment33_DATA_START);
        fragment33_RODATA_START = .;
        build/asm/us/data/fragments/33/fragment33_header.o(.rodata);
        build/asm/us/fragments/33/fragment33_code.o(.rodata);
        fragment33_RODATA_END = .;
        fragment33_RODATA_SIZE = ABSOLUTE(fragment33_RODATA_END - fragment33_RODATA_START);
    }
    fragment33_bss_VRAM = ADDR(.fragment33_bss);
    .fragment33_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment33_BSS_START = .;
        build/asm/us/data/fragments/33/fragment33_header.o(.bss);
        build/asm/us/fragments/33/fragment33_code.o(.bss);
        fragment33_BSS_END = .;
        fragment33_BSS_SIZE = ABSOLUTE(fragment33_BSS_END - fragment33_BSS_START);
    }
    __romPos += SIZEOF(.fragment33);
    fragment33_ROM_END = __romPos;
    fragment33_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment34_ROM_START = __romPos;
    fragment34_VRAM = ADDR(.fragment34);
    .fragment34 0x88500000 : AT(fragment34_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment34_TEXT_START = .;
        build/asm/us/data/fragments/34/fragment34_header.o(.text);
        build/asm/us/fragments/34/fragment34_1BD630.o(.text);
        build/asm/us/fragments/34/fragment34_1BE300.o(.text);
        build/asm/us/fragments/34/fragment34_1C1BC0.o(.text);
        build/asm/us/fragments/34/fragment34_1C3FA0.o(.text);
        build/asm/us/fragments/34/fragment34_1C5AA0.o(.text);
        fragment34_TEXT_END = .;
        fragment34_TEXT_SIZE = ABSOLUTE(fragment34_TEXT_END - fragment34_TEXT_START);
        fragment34_DATA_START = .;
        fragments_34_fragment34_header = .;
        build/asm/us/data/fragments/34/fragment34_header.o(.data);
        fragments_34_fragment34_1BD630 = .;
        build/asm/us/fragments/34/fragment34_1BD630.o(.data);
        fragments_34_fragment34_1BE300 = .;
        build/asm/us/fragments/34/fragment34_1BE300.o(.data);
        fragments_34_fragment34_1C1BC0 = .;
        build/asm/us/fragments/34/fragment34_1C1BC0.o(.data);
        fragments_34_fragment34_1C3FA0 = .;
        build/asm/us/fragments/34/fragment34_1C3FA0.o(.data);
        fragments_34_fragment34_1C5AA0 = .;
        build/asm/us/fragments/34/fragment34_1C5AA0.o(.data);
        fragments_34_fragment34_data_data = .;
        build/asm/us/data/fragments/34/fragment34_data.data.o(.data);
        fragment34_DATA_END = .;
        fragment34_DATA_SIZE = ABSOLUTE(fragment34_DATA_END - fragment34_DATA_START);
        fragment34_RODATA_START = .;
        build/asm/us/data/fragments/34/fragment34_header.o(.rodata);
        build/asm/us/fragments/34/fragment34_1BD630.o(.rodata);
        build/asm/us/fragments/34/fragment34_1BE300.o(.rodata);
        build/asm/us/fragments/34/fragment34_1C1BC0.o(.rodata);
        build/asm/us/fragments/34/fragment34_1C3FA0.o(.rodata);
        build/asm/us/fragments/34/fragment34_1C5AA0.o(.rodata);
        fragment34_RODATA_END = .;
        fragment34_RODATA_SIZE = ABSOLUTE(fragment34_RODATA_END - fragment34_RODATA_START);
    }
    fragment34_bss_VRAM = ADDR(.fragment34_bss);
    .fragment34_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment34_BSS_START = .;
        build/asm/us/data/fragments/34/fragment34_header.o(.bss);
        build/asm/us/fragments/34/fragment34_1BD630.o(.bss);
        build/asm/us/fragments/34/fragment34_1BE300.o(.bss);
        build/asm/us/fragments/34/fragment34_1C1BC0.o(.bss);
        build/asm/us/fragments/34/fragment34_1C3FA0.o(.bss);
        build/asm/us/fragments/34/fragment34_1C5AA0.o(.bss);
        fragment34_BSS_END = .;
        fragment34_BSS_SIZE = ABSOLUTE(fragment34_BSS_END - fragment34_BSS_START);
    }
    __romPos += SIZEOF(.fragment34);
    fragment34_ROM_END = __romPos;
    fragment34_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment35_ROM_START = __romPos;
    fragment35_VRAM = ADDR(.fragment35);
    .fragment35 0x88600000 : AT(fragment35_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment35_TEXT_START = .;
        build/asm/us/data/fragments/35/fragment35_header.o(.text);
        build/asm/us/fragments/35/fragment35_1CCC20.o(.text);
        build/asm/us/fragments/35/fragment35_1CCE70.o(.text);
        fragment35_TEXT_END = .;
        fragment35_TEXT_SIZE = ABSOLUTE(fragment35_TEXT_END - fragment35_TEXT_START);
        fragment35_DATA_START = .;
        fragments_35_fragment35_header = .;
        build/asm/us/data/fragments/35/fragment35_header.o(.data);
        fragments_35_fragment35_1CCC20 = .;
        build/asm/us/fragments/35/fragment35_1CCC20.o(.data);
        fragments_35_fragment35_1CCE70 = .;
        build/asm/us/fragments/35/fragment35_1CCE70.o(.data);
        fragments_35_fragment35_data_data = .;
        build/asm/us/data/fragments/35/fragment35_data.data.o(.data);
        fragment35_DATA_END = .;
        fragment35_DATA_SIZE = ABSOLUTE(fragment35_DATA_END - fragment35_DATA_START);
        fragment35_RODATA_START = .;
        build/asm/us/data/fragments/35/fragment35_header.o(.rodata);
        build/asm/us/fragments/35/fragment35_1CCC20.o(.rodata);
        build/asm/us/fragments/35/fragment35_1CCE70.o(.rodata);
        fragment35_RODATA_END = .;
        fragment35_RODATA_SIZE = ABSOLUTE(fragment35_RODATA_END - fragment35_RODATA_START);
    }
    fragment35_bss_VRAM = ADDR(.fragment35_bss);
    .fragment35_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment35_BSS_START = .;
        build/asm/us/data/fragments/35/fragment35_header.o(.bss);
        build/asm/us/fragments/35/fragment35_1CCC20.o(.bss);
        build/asm/us/fragments/35/fragment35_1CCE70.o(.bss);
        fragment35_BSS_END = .;
        fragment35_BSS_SIZE = ABSOLUTE(fragment35_BSS_END - fragment35_BSS_START);
    }
    __romPos += SIZEOF(.fragment35);
    fragment35_ROM_END = __romPos;
    fragment35_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment36_ROM_START = __romPos;
    fragment36_VRAM = ADDR(.fragment36);
    .fragment36 0x88700000 : AT(fragment36_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment36_TEXT_START = .;
        build/asm/us/data/fragments/36/fragment36_header.o(.text);
        build/asm/us/fragments/36/fragment36_code.o(.text);
        fragment36_TEXT_END = .;
        fragment36_TEXT_SIZE = ABSOLUTE(fragment36_TEXT_END - fragment36_TEXT_START);
        fragment36_DATA_START = .;
        fragments_36_fragment36_header = .;
        build/asm/us/data/fragments/36/fragment36_header.o(.data);
        fragments_36_fragment36_code = .;
        build/asm/us/fragments/36/fragment36_code.o(.data);
        fragments_36_fragment36_data_data = .;
        build/asm/us/data/fragments/36/fragment36_data.data.o(.data);
        fragment36_DATA_END = .;
        fragment36_DATA_SIZE = ABSOLUTE(fragment36_DATA_END - fragment36_DATA_START);
        fragment36_RODATA_START = .;
        build/asm/us/data/fragments/36/fragment36_header.o(.rodata);
        build/asm/us/fragments/36/fragment36_code.o(.rodata);
        fragment36_RODATA_END = .;
        fragment36_RODATA_SIZE = ABSOLUTE(fragment36_RODATA_END - fragment36_RODATA_START);
    }
    fragment36_bss_VRAM = ADDR(.fragment36_bss);
    .fragment36_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment36_BSS_START = .;
        build/asm/us/data/fragments/36/fragment36_header.o(.bss);
        build/asm/us/fragments/36/fragment36_code.o(.bss);
        fragment36_BSS_END = .;
        fragment36_BSS_SIZE = ABSOLUTE(fragment36_BSS_END - fragment36_BSS_START);
    }
    __romPos += SIZEOF(.fragment36);
    fragment36_ROM_END = __romPos;
    fragment36_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment37_ROM_START = __romPos;
    fragment37_VRAM = ADDR(.fragment37);
    .fragment37 0x88800000 : AT(fragment37_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment37_TEXT_START = .;
        build/asm/us/data/fragments/37/fragment37_header.o(.text);
        build/asm/us/fragments/37/fragment37_code.o(.text);
        fragment37_TEXT_END = .;
        fragment37_TEXT_SIZE = ABSOLUTE(fragment37_TEXT_END - fragment37_TEXT_START);
        fragment37_DATA_START = .;
        fragments_37_fragment37_header = .;
        build/asm/us/data/fragments/37/fragment37_header.o(.data);
        fragments_37_fragment37_code = .;
        build/asm/us/fragments/37/fragment37_code.o(.data);
        fragments_37_fragment37_data_data = .;
        build/asm/us/data/fragments/37/fragment37_data.data.o(.data);
        fragment37_DATA_END = .;
        fragment37_DATA_SIZE = ABSOLUTE(fragment37_DATA_END - fragment37_DATA_START);
        fragment37_RODATA_START = .;
        build/asm/us/data/fragments/37/fragment37_header.o(.rodata);
        build/asm/us/fragments/37/fragment37_code.o(.rodata);
        fragment37_RODATA_END = .;
        fragment37_RODATA_SIZE = ABSOLUTE(fragment37_RODATA_END - fragment37_RODATA_START);
    }
    fragment37_bss_VRAM = ADDR(.fragment37_bss);
    .fragment37_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment37_BSS_START = .;
        build/asm/us/data/fragments/37/fragment37_header.o(.bss);
        build/asm/us/fragments/37/fragment37_code.o(.bss);
        fragment37_BSS_END = .;
        fragment37_BSS_SIZE = ABSOLUTE(fragment37_BSS_END - fragment37_BSS_START);
    }
    __romPos += SIZEOF(.fragment37);
    fragment37_ROM_END = __romPos;
    fragment37_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment38_ROM_START = __romPos;
    fragment38_VRAM = ADDR(.fragment38);
    .fragment38 0x88900000 : AT(fragment38_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment38_TEXT_START = .;
        build/asm/us/data/fragments/38/fragment38_header.o(.text);
        build/asm/us/fragments/38/fragment38_1D5610.o(.text);
        build/asm/us/fragments/38/fragment38_1D8160.o(.text);
        build/asm/us/fragments/38/fragment38_1D8990.o(.text);
        fragment38_TEXT_END = .;
        fragment38_TEXT_SIZE = ABSOLUTE(fragment38_TEXT_END - fragment38_TEXT_START);
        fragment38_DATA_START = .;
        fragments_38_fragment38_header = .;
        build/asm/us/data/fragments/38/fragment38_header.o(.data);
        fragments_38_fragment38_1D5610 = .;
        build/asm/us/fragments/38/fragment38_1D5610.o(.data);
        fragments_38_fragment38_1D8160 = .;
        build/asm/us/fragments/38/fragment38_1D8160.o(.data);
        fragments_38_fragment38_1D8990 = .;
        build/asm/us/fragments/38/fragment38_1D8990.o(.data);
        fragments_38_fragment38_data_data = .;
        build/asm/us/data/fragments/38/fragment38_data.data.o(.data);
        fragment38_DATA_END = .;
        fragment38_DATA_SIZE = ABSOLUTE(fragment38_DATA_END - fragment38_DATA_START);
        fragment38_RODATA_START = .;
        build/asm/us/data/fragments/38/fragment38_header.o(.rodata);
        build/asm/us/fragments/38/fragment38_1D5610.o(.rodata);
        build/asm/us/fragments/38/fragment38_1D8160.o(.rodata);
        build/asm/us/fragments/38/fragment38_1D8990.o(.rodata);
        fragment38_RODATA_END = .;
        fragment38_RODATA_SIZE = ABSOLUTE(fragment38_RODATA_END - fragment38_RODATA_START);
    }
    fragment38_bss_VRAM = ADDR(.fragment38_bss);
    .fragment38_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment38_BSS_START = .;
        build/asm/us/data/fragments/38/fragment38_header.o(.bss);
        build/asm/us/fragments/38/fragment38_1D5610.o(.bss);
        build/asm/us/fragments/38/fragment38_1D8160.o(.bss);
        build/asm/us/fragments/38/fragment38_1D8990.o(.bss);
        fragment38_BSS_END = .;
        fragment38_BSS_SIZE = ABSOLUTE(fragment38_BSS_END - fragment38_BSS_START);
    }
    __romPos += SIZEOF(.fragment38);
    fragment38_ROM_END = __romPos;
    fragment38_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment39_ROM_START = __romPos;
    fragment39_VRAM = ADDR(.fragment39);
    .fragment39 0x88A00000 : AT(fragment39_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment39_TEXT_START = .;
        build/asm/us/data/fragments/39/fragment39_header.o(.text);
        build/asm/us/fragments/39/fragment39_1DA300.o(.text);
        build/asm/us/fragments/39/fragment39_1DA9F0.o(.text);
        fragment39_TEXT_END = .;
        fragment39_TEXT_SIZE = ABSOLUTE(fragment39_TEXT_END - fragment39_TEXT_START);
        fragment39_DATA_START = .;
        fragments_39_fragment39_header = .;
        build/asm/us/data/fragments/39/fragment39_header.o(.data);
        fragments_39_fragment39_1DA300 = .;
        build/asm/us/fragments/39/fragment39_1DA300.o(.data);
        fragments_39_fragment39_1DA9F0 = .;
        build/asm/us/fragments/39/fragment39_1DA9F0.o(.data);
        fragments_39_fragment39_data_data = .;
        build/asm/us/data/fragments/39/fragment39_data.data.o(.data);
        fragment39_DATA_END = .;
        fragment39_DATA_SIZE = ABSOLUTE(fragment39_DATA_END - fragment39_DATA_START);
        fragment39_RODATA_START = .;
        build/asm/us/data/fragments/39/fragment39_header.o(.rodata);
        build/asm/us/fragments/39/fragment39_1DA300.o(.rodata);
        build/asm/us/fragments/39/fragment39_1DA9F0.o(.rodata);
        fragment39_RODATA_END = .;
        fragment39_RODATA_SIZE = ABSOLUTE(fragment39_RODATA_END - fragment39_RODATA_START);
    }
    fragment39_bss_VRAM = ADDR(.fragment39_bss);
    .fragment39_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment39_BSS_START = .;
        build/asm/us/data/fragments/39/fragment39_header.o(.bss);
        build/asm/us/fragments/39/fragment39_1DA300.o(.bss);
        build/asm/us/fragments/39/fragment39_1DA9F0.o(.bss);
        fragment39_BSS_END = .;
        fragment39_BSS_SIZE = ABSOLUTE(fragment39_BSS_END - fragment39_BSS_START);
    }
    __romPos += SIZEOF(.fragment39);
    fragment39_ROM_END = __romPos;
    fragment39_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment40_ROM_START = __romPos;
    fragment40_VRAM = ADDR(.fragment40);
    .fragment40 0x88B00000 : AT(fragment40_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment40_TEXT_START = .;
        build/asm/us/data/fragments/40/fragment40_header.o(.text);
        build/asm/us/fragments/40/fragment40_1DC1F0.o(.text);
        build/asm/us/fragments/40/fragment40_1E0550.o(.text);
        fragment40_TEXT_END = .;
        fragment40_TEXT_SIZE = ABSOLUTE(fragment40_TEXT_END - fragment40_TEXT_START);
        fragment40_DATA_START = .;
        fragments_40_fragment40_header = .;
        build/asm/us/data/fragments/40/fragment40_header.o(.data);
        fragments_40_fragment40_1DC1F0 = .;
        build/asm/us/fragments/40/fragment40_1DC1F0.o(.data);
        fragments_40_fragment40_1E0550 = .;
        build/asm/us/fragments/40/fragment40_1E0550.o(.data);
        fragments_40_fragment40_data_data = .;
        build/asm/us/data/fragments/40/fragment40_data.data.o(.data);
        fragment40_DATA_END = .;
        fragment40_DATA_SIZE = ABSOLUTE(fragment40_DATA_END - fragment40_DATA_START);
        fragment40_RODATA_START = .;
        build/asm/us/data/fragments/40/fragment40_header.o(.rodata);
        build/asm/us/fragments/40/fragment40_1DC1F0.o(.rodata);
        build/asm/us/fragments/40/fragment40_1E0550.o(.rodata);
        fragment40_RODATA_END = .;
        fragment40_RODATA_SIZE = ABSOLUTE(fragment40_RODATA_END - fragment40_RODATA_START);
    }
    fragment40_bss_VRAM = ADDR(.fragment40_bss);
    .fragment40_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment40_BSS_START = .;
        build/asm/us/data/fragments/40/fragment40_header.o(.bss);
        build/asm/us/fragments/40/fragment40_1DC1F0.o(.bss);
        build/asm/us/fragments/40/fragment40_1E0550.o(.bss);
        fragment40_BSS_END = .;
        fragment40_BSS_SIZE = ABSOLUTE(fragment40_BSS_END - fragment40_BSS_START);
    }
    __romPos += SIZEOF(.fragment40);
    fragment40_ROM_END = __romPos;
    fragment40_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment41_ROM_START = __romPos;
    fragment41_VRAM = ADDR(.fragment41);
    .fragment41 0x88C00000 : AT(fragment41_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment41_TEXT_START = .;
        build/asm/us/data/fragments/41/fragment41_header.o(.text);
        build/asm/us/fragments/41/fragment41_code.o(.text);
        fragment41_TEXT_END = .;
        fragment41_TEXT_SIZE = ABSOLUTE(fragment41_TEXT_END - fragment41_TEXT_START);
        fragment41_DATA_START = .;
        fragments_41_fragment41_header = .;
        build/asm/us/data/fragments/41/fragment41_header.o(.data);
        fragments_41_fragment41_code = .;
        build/asm/us/fragments/41/fragment41_code.o(.data);
        fragments_41_fragment41_data_data = .;
        build/asm/us/data/fragments/41/fragment41_data.data.o(.data);
        fragment41_DATA_END = .;
        fragment41_DATA_SIZE = ABSOLUTE(fragment41_DATA_END - fragment41_DATA_START);
        fragment41_RODATA_START = .;
        build/asm/us/data/fragments/41/fragment41_header.o(.rodata);
        build/asm/us/fragments/41/fragment41_code.o(.rodata);
        fragment41_RODATA_END = .;
        fragment41_RODATA_SIZE = ABSOLUTE(fragment41_RODATA_END - fragment41_RODATA_START);
    }
    fragment41_bss_VRAM = ADDR(.fragment41_bss);
    .fragment41_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment41_BSS_START = .;
        build/asm/us/data/fragments/41/fragment41_header.o(.bss);
        build/asm/us/fragments/41/fragment41_code.o(.bss);
        fragment41_BSS_END = .;
        fragment41_BSS_SIZE = ABSOLUTE(fragment41_BSS_END - fragment41_BSS_START);
    }
    __romPos += SIZEOF(.fragment41);
    fragment41_ROM_END = __romPos;
    fragment41_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment42_ROM_START = __romPos;
    fragment42_VRAM = ADDR(.fragment42);
    .fragment42 0x88D00000 : AT(fragment42_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment42_TEXT_START = .;
        build/asm/us/data/fragments/42/fragment42_header.o(.text);
        build/asm/us/fragments/42/fragment42_code.o(.text);
        fragment42_TEXT_END = .;
        fragment42_TEXT_SIZE = ABSOLUTE(fragment42_TEXT_END - fragment42_TEXT_START);
        fragment42_DATA_START = .;
        fragments_42_fragment42_header = .;
        build/asm/us/data/fragments/42/fragment42_header.o(.data);
        fragments_42_fragment42_code = .;
        build/asm/us/fragments/42/fragment42_code.o(.data);
        fragments_42_fragment42_data_data = .;
        build/asm/us/data/fragments/42/fragment42_data.data.o(.data);
        fragment42_DATA_END = .;
        fragment42_DATA_SIZE = ABSOLUTE(fragment42_DATA_END - fragment42_DATA_START);
        fragment42_RODATA_START = .;
        build/asm/us/data/fragments/42/fragment42_header.o(.rodata);
        build/asm/us/fragments/42/fragment42_code.o(.rodata);
        fragment42_RODATA_END = .;
        fragment42_RODATA_SIZE = ABSOLUTE(fragment42_RODATA_END - fragment42_RODATA_START);
    }
    fragment42_bss_VRAM = ADDR(.fragment42_bss);
    .fragment42_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment42_BSS_START = .;
        build/asm/us/data/fragments/42/fragment42_header.o(.bss);
        build/asm/us/fragments/42/fragment42_code.o(.bss);
        fragment42_BSS_END = .;
        fragment42_BSS_SIZE = ABSOLUTE(fragment42_BSS_END - fragment42_BSS_START);
    }
    __romPos += SIZEOF(.fragment42);
    fragment42_ROM_END = __romPos;
    fragment42_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment43_ROM_START = __romPos;
    fragment43_VRAM = ADDR(.fragment43);
    .fragment43 0x8AC00000 : AT(fragment43_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment43_TEXT_START = .;
        build/asm/us/data/fragments/43/fragment43_header.o(.text);
        build/asm/us/fragments/43/fragment43_1E5A10.o(.text);
        build/asm/us/fragments/43/fragment43_1EC950.o(.text);
        fragment43_TEXT_END = .;
        fragment43_TEXT_SIZE = ABSOLUTE(fragment43_TEXT_END - fragment43_TEXT_START);
        fragment43_DATA_START = .;
        fragments_43_fragment43_header = .;
        build/asm/us/data/fragments/43/fragment43_header.o(.data);
        fragments_43_fragment43_1E5A10 = .;
        build/asm/us/fragments/43/fragment43_1E5A10.o(.data);
        fragments_43_fragment43_1EC950 = .;
        build/asm/us/fragments/43/fragment43_1EC950.o(.data);
        fragments_43_fragment43_data_data = .;
        build/asm/us/data/fragments/43/fragment43_data.data.o(.data);
        fragment43_DATA_END = .;
        fragment43_DATA_SIZE = ABSOLUTE(fragment43_DATA_END - fragment43_DATA_START);
        fragment43_RODATA_START = .;
        build/asm/us/data/fragments/43/fragment43_header.o(.rodata);
        build/asm/us/fragments/43/fragment43_1E5A10.o(.rodata);
        build/asm/us/fragments/43/fragment43_1EC950.o(.rodata);
        fragment43_RODATA_END = .;
        fragment43_RODATA_SIZE = ABSOLUTE(fragment43_RODATA_END - fragment43_RODATA_START);
    }
    fragment43_bss_VRAM = ADDR(.fragment43_bss);
    .fragment43_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment43_BSS_START = .;
        build/asm/us/data/fragments/43/fragment43_header.o(.bss);
        build/asm/us/fragments/43/fragment43_1E5A10.o(.bss);
        build/asm/us/fragments/43/fragment43_1EC950.o(.bss);
        fragment43_BSS_END = .;
        fragment43_BSS_SIZE = ABSOLUTE(fragment43_BSS_END - fragment43_BSS_START);
    }
    __romPos += SIZEOF(.fragment43);
    fragment43_ROM_END = __romPos;
    fragment43_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment44_ROM_START = __romPos;
    fragment44_VRAM = ADDR(.fragment44);
    .fragment44 0x8AF00000 : AT(fragment44_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment44_TEXT_START = .;
        build/asm/us/data/fragments/44/fragment44_header.o(.text);
        build/asm/us/fragments/44/fragment44_1EE290.o(.text);
        build/asm/us/fragments/44/fragment44_1F0680.o(.text);
        build/asm/us/fragments/44/fragment44_1F1850.o(.text);
        build/asm/us/fragments/44/fragment44_1F53D0.o(.text);
        build/asm/us/fragments/44/fragment44_1F5480.o(.text);
        build/asm/us/fragments/44/fragment44_1F5BD0.o(.text);
        build/asm/us/fragments/44/fragment44_1F5F20.o(.text);
        build/asm/us/fragments/44/fragment44_1F6BF0.o(.text);
        build/asm/us/fragments/44/fragment44_1F7DD0.o(.text);
        build/asm/us/fragments/44/fragment44_1F85B0.o(.text);
        build/asm/us/fragments/44/fragment44_1F9DB0.o(.text);
        build/asm/us/fragments/44/fragment44_1FD260.o(.text);
        build/asm/us/fragments/44/fragment44_201DA0.o(.text);
        build/asm/us/fragments/44/fragment44_2030B0.o(.text);
        build/asm/us/fragments/44/fragment44_204950.o(.text);
        build/asm/us/fragments/44/fragment44_205C30.o(.text);
        build/asm/us/fragments/44/fragment44_207AF0.o(.text);
        build/asm/us/fragments/44/fragment44_209BD0.o(.text);
        build/asm/us/fragments/44/fragment44_20A610.o(.text);
        build/asm/us/fragments/44/fragment44_20BDB0.o(.text);
        build/asm/us/fragments/44/fragment44_20C560.o(.text);
        build/asm/us/fragments/44/fragment44_20CBF0.o(.text);
        build/asm/us/fragments/44/fragment44_20D3A0.o(.text);
        build/asm/us/fragments/44/fragment44_20EBC0.o(.text);
        build/asm/us/fragments/44/fragment44_20F140.o(.text);
        build/asm/us/fragments/44/fragment44_212740.o(.text);
        fragment44_TEXT_END = .;
        fragment44_TEXT_SIZE = ABSOLUTE(fragment44_TEXT_END - fragment44_TEXT_START);
        fragment44_DATA_START = .;
        fragments_44_fragment44_header = .;
        build/asm/us/data/fragments/44/fragment44_header.o(.data);
        fragments_44_fragment44_1EE290 = .;
        build/asm/us/fragments/44/fragment44_1EE290.o(.data);
        fragments_44_fragment44_1F0680 = .;
        build/asm/us/fragments/44/fragment44_1F0680.o(.data);
        fragments_44_fragment44_1F1850 = .;
        build/asm/us/fragments/44/fragment44_1F1850.o(.data);
        fragments_44_fragment44_1F53D0 = .;
        build/asm/us/fragments/44/fragment44_1F53D0.o(.data);
        fragments_44_fragment44_1F5480 = .;
        build/asm/us/fragments/44/fragment44_1F5480.o(.data);
        fragments_44_fragment44_1F5BD0 = .;
        build/asm/us/fragments/44/fragment44_1F5BD0.o(.data);
        fragments_44_fragment44_1F5F20 = .;
        build/asm/us/fragments/44/fragment44_1F5F20.o(.data);
        fragments_44_fragment44_1F6BF0 = .;
        build/asm/us/fragments/44/fragment44_1F6BF0.o(.data);
        fragments_44_fragment44_1F7DD0 = .;
        build/asm/us/fragments/44/fragment44_1F7DD0.o(.data);
        fragments_44_fragment44_1F85B0 = .;
        build/asm/us/fragments/44/fragment44_1F85B0.o(.data);
        fragments_44_fragment44_1F9DB0 = .;
        build/asm/us/fragments/44/fragment44_1F9DB0.o(.data);
        fragments_44_fragment44_1FD260 = .;
        build/asm/us/fragments/44/fragment44_1FD260.o(.data);
        fragments_44_fragment44_201DA0 = .;
        build/asm/us/fragments/44/fragment44_201DA0.o(.data);
        fragments_44_fragment44_2030B0 = .;
        build/asm/us/fragments/44/fragment44_2030B0.o(.data);
        fragments_44_fragment44_204950 = .;
        build/asm/us/fragments/44/fragment44_204950.o(.data);
        fragments_44_fragment44_205C30 = .;
        build/asm/us/fragments/44/fragment44_205C30.o(.data);
        fragments_44_fragment44_207AF0 = .;
        build/asm/us/fragments/44/fragment44_207AF0.o(.data);
        fragments_44_fragment44_209BD0 = .;
        build/asm/us/fragments/44/fragment44_209BD0.o(.data);
        fragments_44_fragment44_20A610 = .;
        build/asm/us/fragments/44/fragment44_20A610.o(.data);
        fragments_44_fragment44_20BDB0 = .;
        build/asm/us/fragments/44/fragment44_20BDB0.o(.data);
        fragments_44_fragment44_20C560 = .;
        build/asm/us/fragments/44/fragment44_20C560.o(.data);
        fragments_44_fragment44_20CBF0 = .;
        build/asm/us/fragments/44/fragment44_20CBF0.o(.data);
        fragments_44_fragment44_20D3A0 = .;
        build/asm/us/fragments/44/fragment44_20D3A0.o(.data);
        fragments_44_fragment44_20EBC0 = .;
        build/asm/us/fragments/44/fragment44_20EBC0.o(.data);
        fragments_44_fragment44_20F140 = .;
        build/asm/us/fragments/44/fragment44_20F140.o(.data);
        fragments_44_fragment44_212740 = .;
        build/asm/us/fragments/44/fragment44_212740.o(.data);
        fragments_44_fragment44_data_data = .;
        build/asm/us/data/fragments/44/fragment44_data.data.o(.data);
        fragment44_DATA_END = .;
        fragment44_DATA_SIZE = ABSOLUTE(fragment44_DATA_END - fragment44_DATA_START);
        fragment44_RODATA_START = .;
        build/asm/us/data/fragments/44/fragment44_header.o(.rodata);
        build/asm/us/fragments/44/fragment44_1EE290.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F0680.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F1850.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F53D0.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F5480.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F5BD0.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F5F20.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F6BF0.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F7DD0.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F85B0.o(.rodata);
        build/asm/us/fragments/44/fragment44_1F9DB0.o(.rodata);
        build/asm/us/fragments/44/fragment44_1FD260.o(.rodata);
        build/asm/us/fragments/44/fragment44_201DA0.o(.rodata);
        build/asm/us/fragments/44/fragment44_2030B0.o(.rodata);
        build/asm/us/fragments/44/fragment44_204950.o(.rodata);
        build/asm/us/fragments/44/fragment44_205C30.o(.rodata);
        build/asm/us/fragments/44/fragment44_207AF0.o(.rodata);
        build/asm/us/fragments/44/fragment44_209BD0.o(.rodata);
        build/asm/us/fragments/44/fragment44_20A610.o(.rodata);
        build/asm/us/fragments/44/fragment44_20BDB0.o(.rodata);
        build/asm/us/fragments/44/fragment44_20C560.o(.rodata);
        build/asm/us/fragments/44/fragment44_20CBF0.o(.rodata);
        build/asm/us/fragments/44/fragment44_20D3A0.o(.rodata);
        build/asm/us/fragments/44/fragment44_20EBC0.o(.rodata);
        build/asm/us/fragments/44/fragment44_20F140.o(.rodata);
        build/asm/us/fragments/44/fragment44_212740.o(.rodata);
        fragment44_RODATA_END = .;
        fragment44_RODATA_SIZE = ABSOLUTE(fragment44_RODATA_END - fragment44_RODATA_START);
    }
    fragment44_bss_VRAM = ADDR(.fragment44_bss);
    .fragment44_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment44_BSS_START = .;
        build/asm/us/data/fragments/44/fragment44_header.o(.bss);
        build/asm/us/fragments/44/fragment44_1EE290.o(.bss);
        build/asm/us/fragments/44/fragment44_1F0680.o(.bss);
        build/asm/us/fragments/44/fragment44_1F1850.o(.bss);
        build/asm/us/fragments/44/fragment44_1F53D0.o(.bss);
        build/asm/us/fragments/44/fragment44_1F5480.o(.bss);
        build/asm/us/fragments/44/fragment44_1F5BD0.o(.bss);
        build/asm/us/fragments/44/fragment44_1F5F20.o(.bss);
        build/asm/us/fragments/44/fragment44_1F6BF0.o(.bss);
        build/asm/us/fragments/44/fragment44_1F7DD0.o(.bss);
        build/asm/us/fragments/44/fragment44_1F85B0.o(.bss);
        build/asm/us/fragments/44/fragment44_1F9DB0.o(.bss);
        build/asm/us/fragments/44/fragment44_1FD260.o(.bss);
        build/asm/us/fragments/44/fragment44_201DA0.o(.bss);
        build/asm/us/fragments/44/fragment44_2030B0.o(.bss);
        build/asm/us/fragments/44/fragment44_204950.o(.bss);
        build/asm/us/fragments/44/fragment44_205C30.o(.bss);
        build/asm/us/fragments/44/fragment44_207AF0.o(.bss);
        build/asm/us/fragments/44/fragment44_209BD0.o(.bss);
        build/asm/us/fragments/44/fragment44_20A610.o(.bss);
        build/asm/us/fragments/44/fragment44_20BDB0.o(.bss);
        build/asm/us/fragments/44/fragment44_20C560.o(.bss);
        build/asm/us/fragments/44/fragment44_20CBF0.o(.bss);
        build/asm/us/fragments/44/fragment44_20D3A0.o(.bss);
        build/asm/us/fragments/44/fragment44_20EBC0.o(.bss);
        build/asm/us/fragments/44/fragment44_20F140.o(.bss);
        build/asm/us/fragments/44/fragment44_212740.o(.bss);
        fragment44_BSS_END = .;
        fragment44_BSS_SIZE = ABSOLUTE(fragment44_BSS_END - fragment44_BSS_START);
    }
    __romPos += SIZEOF(.fragment44);
    fragment44_ROM_END = __romPos;
    fragment44_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment45_ROM_START = __romPos;
    fragment45_VRAM = ADDR(.fragment45);
    .fragment45 0x8AB00000 : AT(fragment45_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment45_TEXT_START = .;
        build/asm/us/data/fragments/45/fragment45_header.o(.text);
        build/asm/us/fragments/45/fragment45_2251A0.o(.text);
        build/asm/us/fragments/45/fragment45_22AB80.o(.text);
        build/asm/us/fragments/45/fragment45_22FAD0.o(.text);
        build/asm/us/fragments/45/fragment45_2324B0.o(.text);
        build/asm/us/fragments/45/fragment45_2348E0.o(.text);
        fragment45_TEXT_END = .;
        fragment45_TEXT_SIZE = ABSOLUTE(fragment45_TEXT_END - fragment45_TEXT_START);
        fragment45_DATA_START = .;
        fragments_45_fragment45_header = .;
        build/asm/us/data/fragments/45/fragment45_header.o(.data);
        fragments_45_fragment45_2251A0 = .;
        build/asm/us/fragments/45/fragment45_2251A0.o(.data);
        fragments_45_fragment45_22AB80 = .;
        build/asm/us/fragments/45/fragment45_22AB80.o(.data);
        fragments_45_fragment45_22FAD0 = .;
        build/asm/us/fragments/45/fragment45_22FAD0.o(.data);
        fragments_45_fragment45_2324B0 = .;
        build/asm/us/fragments/45/fragment45_2324B0.o(.data);
        fragments_45_fragment45_2348E0 = .;
        build/asm/us/fragments/45/fragment45_2348E0.o(.data);
        fragments_45_fragment45_data_data = .;
        build/asm/us/data/fragments/45/fragment45_data.data.o(.data);
        fragment45_DATA_END = .;
        fragment45_DATA_SIZE = ABSOLUTE(fragment45_DATA_END - fragment45_DATA_START);
        fragment45_RODATA_START = .;
        build/asm/us/data/fragments/45/fragment45_header.o(.rodata);
        build/asm/us/fragments/45/fragment45_2251A0.o(.rodata);
        build/asm/us/fragments/45/fragment45_22AB80.o(.rodata);
        build/asm/us/fragments/45/fragment45_22FAD0.o(.rodata);
        build/asm/us/fragments/45/fragment45_2324B0.o(.rodata);
        build/asm/us/fragments/45/fragment45_2348E0.o(.rodata);
        fragment45_RODATA_END = .;
        fragment45_RODATA_SIZE = ABSOLUTE(fragment45_RODATA_END - fragment45_RODATA_START);
    }
    fragment45_bss_VRAM = ADDR(.fragment45_bss);
    .fragment45_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment45_BSS_START = .;
        build/asm/us/data/fragments/45/fragment45_header.o(.bss);
        build/asm/us/fragments/45/fragment45_2251A0.o(.bss);
        build/asm/us/fragments/45/fragment45_22AB80.o(.bss);
        build/asm/us/fragments/45/fragment45_22FAD0.o(.bss);
        build/asm/us/fragments/45/fragment45_2324B0.o(.bss);
        build/asm/us/fragments/45/fragment45_2348E0.o(.bss);
        fragment45_BSS_END = .;
        fragment45_BSS_SIZE = ABSOLUTE(fragment45_BSS_END - fragment45_BSS_START);
    }
    __romPos += SIZEOF(.fragment45);
    fragment45_ROM_END = __romPos;
    fragment45_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment46_ROM_START = __romPos;
    fragment46_VRAM = ADDR(.fragment46);
    .fragment46 0x8AE00000 : AT(fragment46_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment46_TEXT_START = .;
        build/asm/us/data/fragments/46/fragment46_header.o(.text);
        build/asm/us/fragments/46/fragment46_code.o(.text);
        fragment46_TEXT_END = .;
        fragment46_TEXT_SIZE = ABSOLUTE(fragment46_TEXT_END - fragment46_TEXT_START);
        fragment46_DATA_START = .;
        fragments_46_fragment46_header = .;
        build/asm/us/data/fragments/46/fragment46_header.o(.data);
        fragments_46_fragment46_code = .;
        build/asm/us/fragments/46/fragment46_code.o(.data);
        fragments_46_fragment46_data_data = .;
        build/asm/us/data/fragments/46/fragment46_data.data.o(.data);
        fragment46_DATA_END = .;
        fragment46_DATA_SIZE = ABSOLUTE(fragment46_DATA_END - fragment46_DATA_START);
        fragment46_RODATA_START = .;
        build/asm/us/data/fragments/46/fragment46_header.o(.rodata);
        build/asm/us/fragments/46/fragment46_code.o(.rodata);
        fragment46_RODATA_END = .;
        fragment46_RODATA_SIZE = ABSOLUTE(fragment46_RODATA_END - fragment46_RODATA_START);
    }
    fragment46_bss_VRAM = ADDR(.fragment46_bss);
    .fragment46_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment46_BSS_START = .;
        build/asm/us/data/fragments/46/fragment46_header.o(.bss);
        build/asm/us/fragments/46/fragment46_code.o(.bss);
        fragment46_BSS_END = .;
        fragment46_BSS_SIZE = ABSOLUTE(fragment46_BSS_END - fragment46_BSS_START);
    }
    __romPos += SIZEOF(.fragment46);
    fragment46_ROM_END = __romPos;
    fragment46_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment47_ROM_START = __romPos;
    fragment47_VRAM = ADDR(.fragment47);
    .fragment47 0x86000000 : AT(fragment47_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment47_TEXT_START = .;
        build/asm/us/data/fragments/47/fragment47_header.o(.text);
        build/asm/us/fragments/47/fragment47_246640.o(.text);
        build/asm/us/fragments/47/fragment47_24AE60.o(.text);
        build/asm/us/fragments/47/fragment47_24E0A0.o(.text);
        build/asm/us/fragments/47/fragment47_251C30.o(.text);
        build/asm/us/fragments/47/fragment47_2533F0.o(.text);
        fragment47_TEXT_END = .;
        fragment47_TEXT_SIZE = ABSOLUTE(fragment47_TEXT_END - fragment47_TEXT_START);
        fragment47_DATA_START = .;
        fragments_47_fragment47_header = .;
        build/asm/us/data/fragments/47/fragment47_header.o(.data);
        fragments_47_fragment47_246640 = .;
        build/asm/us/fragments/47/fragment47_246640.o(.data);
        fragments_47_fragment47_24AE60 = .;
        build/asm/us/fragments/47/fragment47_24AE60.o(.data);
        fragments_47_fragment47_24E0A0 = .;
        build/asm/us/fragments/47/fragment47_24E0A0.o(.data);
        fragments_47_fragment47_251C30 = .;
        build/asm/us/fragments/47/fragment47_251C30.o(.data);
        fragments_47_fragment47_2533F0 = .;
        build/asm/us/fragments/47/fragment47_2533F0.o(.data);
        fragments_47_fragment47_data_data = .;
        build/asm/us/data/fragments/47/fragment47_data.data.o(.data);
        fragment47_DATA_END = .;
        fragment47_DATA_SIZE = ABSOLUTE(fragment47_DATA_END - fragment47_DATA_START);
        fragment47_RODATA_START = .;
        build/asm/us/data/fragments/47/fragment47_header.o(.rodata);
        build/asm/us/fragments/47/fragment47_246640.o(.rodata);
        build/asm/us/fragments/47/fragment47_24AE60.o(.rodata);
        build/asm/us/fragments/47/fragment47_24E0A0.o(.rodata);
        build/asm/us/fragments/47/fragment47_251C30.o(.rodata);
        build/asm/us/fragments/47/fragment47_2533F0.o(.rodata);
        fragment47_RODATA_END = .;
        fragment47_RODATA_SIZE = ABSOLUTE(fragment47_RODATA_END - fragment47_RODATA_START);
    }
    fragment47_bss_VRAM = ADDR(.fragment47_bss);
    .fragment47_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment47_BSS_START = .;
        build/asm/us/data/fragments/47/fragment47_header.o(.bss);
        build/asm/us/fragments/47/fragment47_246640.o(.bss);
        build/asm/us/fragments/47/fragment47_24AE60.o(.bss);
        build/asm/us/fragments/47/fragment47_24E0A0.o(.bss);
        build/asm/us/fragments/47/fragment47_251C30.o(.bss);
        build/asm/us/fragments/47/fragment47_2533F0.o(.bss);
        fragment47_BSS_END = .;
        fragment47_BSS_SIZE = ABSOLUTE(fragment47_BSS_END - fragment47_BSS_START);
    }
    __romPos += SIZEOF(.fragment47);
    fragment47_ROM_END = __romPos;
    fragment47_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment48_ROM_START = __romPos;
    fragment48_VRAM = ADDR(.fragment48);
    .fragment48 0x87C00000 : AT(fragment48_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment48_TEXT_START = .;
        build/asm/us/data/fragments/48/fragment48_header.o(.text);
        build/asm/us/fragments/48/fragment48_256020.o(.text);
        build/asm/us/fragments/48/fragment48_257730.o(.text);
        build/asm/us/fragments/48/fragment48_258080.o(.text);
        build/asm/us/fragments/48/fragment48_258D80.o(.text);
        build/asm/us/fragments/48/fragment48_2597B0.o(.text);
        fragment48_TEXT_END = .;
        fragment48_TEXT_SIZE = ABSOLUTE(fragment48_TEXT_END - fragment48_TEXT_START);
        fragment48_DATA_START = .;
        fragments_48_fragment48_header = .;
        build/asm/us/data/fragments/48/fragment48_header.o(.data);
        fragments_48_fragment48_256020 = .;
        build/asm/us/fragments/48/fragment48_256020.o(.data);
        fragments_48_fragment48_257730 = .;
        build/asm/us/fragments/48/fragment48_257730.o(.data);
        fragments_48_fragment48_258080 = .;
        build/asm/us/fragments/48/fragment48_258080.o(.data);
        fragments_48_fragment48_258D80 = .;
        build/asm/us/fragments/48/fragment48_258D80.o(.data);
        fragments_48_fragment48_2597B0 = .;
        build/asm/us/fragments/48/fragment48_2597B0.o(.data);
        fragments_48_fragment48_data_data = .;
        build/asm/us/data/fragments/48/fragment48_data.data.o(.data);
        fragment48_DATA_END = .;
        fragment48_DATA_SIZE = ABSOLUTE(fragment48_DATA_END - fragment48_DATA_START);
        fragment48_RODATA_START = .;
        build/asm/us/data/fragments/48/fragment48_header.o(.rodata);
        build/asm/us/fragments/48/fragment48_256020.o(.rodata);
        build/asm/us/fragments/48/fragment48_257730.o(.rodata);
        build/asm/us/fragments/48/fragment48_258080.o(.rodata);
        build/asm/us/fragments/48/fragment48_258D80.o(.rodata);
        build/asm/us/fragments/48/fragment48_2597B0.o(.rodata);
        fragment48_RODATA_END = .;
        fragment48_RODATA_SIZE = ABSOLUTE(fragment48_RODATA_END - fragment48_RODATA_START);
    }
    fragment48_bss_VRAM = ADDR(.fragment48_bss);
    .fragment48_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment48_BSS_START = .;
        build/asm/us/data/fragments/48/fragment48_header.o(.bss);
        build/asm/us/fragments/48/fragment48_256020.o(.bss);
        build/asm/us/fragments/48/fragment48_257730.o(.bss);
        build/asm/us/fragments/48/fragment48_258080.o(.bss);
        build/asm/us/fragments/48/fragment48_258D80.o(.bss);
        build/asm/us/fragments/48/fragment48_2597B0.o(.bss);
        fragment48_BSS_END = .;
        fragment48_BSS_SIZE = ABSOLUTE(fragment48_BSS_END - fragment48_BSS_START);
    }
    __romPos += SIZEOF(.fragment48);
    fragment48_ROM_END = __romPos;
    fragment48_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment49_ROM_START = __romPos;
    fragment49_VRAM = ADDR(.fragment49);
    .fragment49 0x86100000 : AT(fragment49_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment49_TEXT_START = .;
        build/asm/us/data/fragments/49/fragment49_header.o(.text);
        build/asm/us/fragments/49/fragment49_code.o(.text);
        fragment49_TEXT_END = .;
        fragment49_TEXT_SIZE = ABSOLUTE(fragment49_TEXT_END - fragment49_TEXT_START);
        fragment49_DATA_START = .;
        fragments_49_fragment49_header = .;
        build/asm/us/data/fragments/49/fragment49_header.o(.data);
        fragments_49_fragment49_code = .;
        build/asm/us/fragments/49/fragment49_code.o(.data);
        fragments_49_fragment49_data_data = .;
        build/asm/us/data/fragments/49/fragment49_data.data.o(.data);
        fragment49_DATA_END = .;
        fragment49_DATA_SIZE = ABSOLUTE(fragment49_DATA_END - fragment49_DATA_START);
        fragment49_RODATA_START = .;
        build/asm/us/data/fragments/49/fragment49_header.o(.rodata);
        build/asm/us/fragments/49/fragment49_code.o(.rodata);
        fragment49_RODATA_END = .;
        fragment49_RODATA_SIZE = ABSOLUTE(fragment49_RODATA_END - fragment49_RODATA_START);
    }
    fragment49_bss_VRAM = ADDR(.fragment49_bss);
    .fragment49_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment49_BSS_START = .;
        build/asm/us/data/fragments/49/fragment49_header.o(.bss);
        build/asm/us/fragments/49/fragment49_code.o(.bss);
        fragment49_BSS_END = .;
        fragment49_BSS_SIZE = ABSOLUTE(fragment49_BSS_END - fragment49_BSS_START);
    }
    __romPos += SIZEOF(.fragment49);
    fragment49_ROM_END = __romPos;
    fragment49_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment50_ROM_START = __romPos;
    fragment50_VRAM = ADDR(.fragment50);
    .fragment50 0x86200000 : AT(fragment50_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment50_TEXT_START = .;
        build/asm/us/data/fragments/50/fragment50_header.o(.text);
        build/asm/us/fragments/50/fragment50_266A60.o(.text);
        build/asm/us/fragments/50/fragment50_26BF40.o(.text);
        build/asm/us/fragments/50/fragment50_26D1D0.o(.text);
        build/asm/us/fragments/50/fragment50_26DCC0.o(.text);
        build/asm/us/fragments/50/fragment50_26E090.o(.text);
        build/asm/us/fragments/50/fragment50_26E4C0.o(.text);
        fragment50_TEXT_END = .;
        fragment50_TEXT_SIZE = ABSOLUTE(fragment50_TEXT_END - fragment50_TEXT_START);
        fragment50_DATA_START = .;
        fragments_50_fragment50_header = .;
        build/asm/us/data/fragments/50/fragment50_header.o(.data);
        fragments_50_fragment50_266A60 = .;
        build/asm/us/fragments/50/fragment50_266A60.o(.data);
        fragments_50_fragment50_26BF40 = .;
        build/asm/us/fragments/50/fragment50_26BF40.o(.data);
        fragments_50_fragment50_26D1D0 = .;
        build/asm/us/fragments/50/fragment50_26D1D0.o(.data);
        fragments_50_fragment50_26DCC0 = .;
        build/asm/us/fragments/50/fragment50_26DCC0.o(.data);
        fragments_50_fragment50_26E090 = .;
        build/asm/us/fragments/50/fragment50_26E090.o(.data);
        fragments_50_fragment50_26E4C0 = .;
        build/asm/us/fragments/50/fragment50_26E4C0.o(.data);
        fragments_50_fragment50_data_data = .;
        build/asm/us/data/fragments/50/fragment50_data.data.o(.data);
        fragment50_DATA_END = .;
        fragment50_DATA_SIZE = ABSOLUTE(fragment50_DATA_END - fragment50_DATA_START);
        fragment50_RODATA_START = .;
        build/asm/us/data/fragments/50/fragment50_header.o(.rodata);
        build/asm/us/fragments/50/fragment50_266A60.o(.rodata);
        build/asm/us/fragments/50/fragment50_26BF40.o(.rodata);
        build/asm/us/fragments/50/fragment50_26D1D0.o(.rodata);
        build/asm/us/fragments/50/fragment50_26DCC0.o(.rodata);
        build/asm/us/fragments/50/fragment50_26E090.o(.rodata);
        build/asm/us/fragments/50/fragment50_26E4C0.o(.rodata);
        fragment50_RODATA_END = .;
        fragment50_RODATA_SIZE = ABSOLUTE(fragment50_RODATA_END - fragment50_RODATA_START);
    }
    fragment50_bss_VRAM = ADDR(.fragment50_bss);
    .fragment50_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment50_BSS_START = .;
        build/asm/us/data/fragments/50/fragment50_header.o(.bss);
        build/asm/us/fragments/50/fragment50_266A60.o(.bss);
        build/asm/us/fragments/50/fragment50_26BF40.o(.bss);
        build/asm/us/fragments/50/fragment50_26D1D0.o(.bss);
        build/asm/us/fragments/50/fragment50_26DCC0.o(.bss);
        build/asm/us/fragments/50/fragment50_26E090.o(.bss);
        build/asm/us/fragments/50/fragment50_26E4C0.o(.bss);
        fragment50_BSS_END = .;
        fragment50_BSS_SIZE = ABSOLUTE(fragment50_BSS_END - fragment50_BSS_START);
    }
    __romPos += SIZEOF(.fragment50);
    fragment50_ROM_END = __romPos;
    fragment50_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment51_ROM_START = __romPos;
    fragment51_VRAM = ADDR(.fragment51);
    .fragment51 0x86300000 : AT(fragment51_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment51_TEXT_START = .;
        build/asm/us/data/fragments/51/fragment51_header.o(.text);
        build/asm/us/fragments/51/fragment51_275E40.o(.text);
        build/asm/us/fragments/51/fragment51_279A20.o(.text);
        build/asm/us/fragments/51/fragment51_279D70.o(.text);
        build/asm/us/fragments/51/fragment51_27A440.o(.text);
        build/asm/us/fragments/51/fragment51_27A740.o(.text);
        build/asm/us/fragments/51/fragment51_27AC10.o(.text);
        build/asm/us/fragments/51/fragment51_27B9E0.o(.text);
        fragment51_TEXT_END = .;
        fragment51_TEXT_SIZE = ABSOLUTE(fragment51_TEXT_END - fragment51_TEXT_START);
        fragment51_DATA_START = .;
        fragments_51_fragment51_header = .;
        build/asm/us/data/fragments/51/fragment51_header.o(.data);
        fragments_51_fragment51_275E40 = .;
        build/asm/us/fragments/51/fragment51_275E40.o(.data);
        fragments_51_fragment51_279A20 = .;
        build/asm/us/fragments/51/fragment51_279A20.o(.data);
        fragments_51_fragment51_279D70 = .;
        build/asm/us/fragments/51/fragment51_279D70.o(.data);
        fragments_51_fragment51_27A440 = .;
        build/asm/us/fragments/51/fragment51_27A440.o(.data);
        fragments_51_fragment51_27A740 = .;
        build/asm/us/fragments/51/fragment51_27A740.o(.data);
        fragments_51_fragment51_27AC10 = .;
        build/asm/us/fragments/51/fragment51_27AC10.o(.data);
        fragments_51_fragment51_27B9E0 = .;
        build/asm/us/fragments/51/fragment51_27B9E0.o(.data);
        fragments_51_fragment51_data_data = .;
        build/asm/us/data/fragments/51/fragment51_data.data.o(.data);
        fragment51_DATA_END = .;
        fragment51_DATA_SIZE = ABSOLUTE(fragment51_DATA_END - fragment51_DATA_START);
        fragment51_RODATA_START = .;
        build/asm/us/data/fragments/51/fragment51_header.o(.rodata);
        build/asm/us/fragments/51/fragment51_275E40.o(.rodata);
        build/asm/us/fragments/51/fragment51_279A20.o(.rodata);
        build/asm/us/fragments/51/fragment51_279D70.o(.rodata);
        build/asm/us/fragments/51/fragment51_27A440.o(.rodata);
        build/asm/us/fragments/51/fragment51_27A740.o(.rodata);
        build/asm/us/fragments/51/fragment51_27AC10.o(.rodata);
        build/asm/us/fragments/51/fragment51_27B9E0.o(.rodata);
        fragment51_RODATA_END = .;
        fragment51_RODATA_SIZE = ABSOLUTE(fragment51_RODATA_END - fragment51_RODATA_START);
    }
    fragment51_bss_VRAM = ADDR(.fragment51_bss);
    .fragment51_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment51_BSS_START = .;
        build/asm/us/data/fragments/51/fragment51_header.o(.bss);
        build/asm/us/fragments/51/fragment51_275E40.o(.bss);
        build/asm/us/fragments/51/fragment51_279A20.o(.bss);
        build/asm/us/fragments/51/fragment51_279D70.o(.bss);
        build/asm/us/fragments/51/fragment51_27A440.o(.bss);
        build/asm/us/fragments/51/fragment51_27A740.o(.bss);
        build/asm/us/fragments/51/fragment51_27AC10.o(.bss);
        build/asm/us/fragments/51/fragment51_27B9E0.o(.bss);
        fragment51_BSS_END = .;
        fragment51_BSS_SIZE = ABSOLUTE(fragment51_BSS_END - fragment51_BSS_START);
    }
    __romPos += SIZEOF(.fragment51);
    fragment51_ROM_END = __romPos;
    fragment51_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment52_ROM_START = __romPos;
    fragment52_VRAM = ADDR(.fragment52);
    .fragment52 0x86400000 : AT(fragment52_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment52_TEXT_START = .;
        build/asm/us/data/fragments/52/fragment52_header.o(.text);
        build/asm/us/fragments/52/fragment52_27E4E0.o(.text);
        build/asm/us/fragments/52/fragment52_2853B0.o(.text);
        build/asm/us/fragments/52/fragment52_285750.o(.text);
        build/asm/us/fragments/52/fragment52_285F60.o(.text);
        build/asm/us/fragments/52/fragment52_2862C0.o(.text);
        build/asm/us/fragments/52/fragment52_2870A0.o(.text);
        build/asm/us/fragments/52/fragment52_2871C0.o(.text);
        fragment52_TEXT_END = .;
        fragment52_TEXT_SIZE = ABSOLUTE(fragment52_TEXT_END - fragment52_TEXT_START);
        fragment52_DATA_START = .;
        fragments_52_fragment52_header = .;
        build/asm/us/data/fragments/52/fragment52_header.o(.data);
        fragments_52_fragment52_27E4E0 = .;
        build/asm/us/fragments/52/fragment52_27E4E0.o(.data);
        fragments_52_fragment52_2853B0 = .;
        build/asm/us/fragments/52/fragment52_2853B0.o(.data);
        fragments_52_fragment52_285750 = .;
        build/asm/us/fragments/52/fragment52_285750.o(.data);
        fragments_52_fragment52_285F60 = .;
        build/asm/us/fragments/52/fragment52_285F60.o(.data);
        fragments_52_fragment52_2862C0 = .;
        build/asm/us/fragments/52/fragment52_2862C0.o(.data);
        fragments_52_fragment52_2870A0 = .;
        build/asm/us/fragments/52/fragment52_2870A0.o(.data);
        fragments_52_fragment52_2871C0 = .;
        build/asm/us/fragments/52/fragment52_2871C0.o(.data);
        fragments_52_fragment52_data_data = .;
        build/asm/us/data/fragments/52/fragment52_data.data.o(.data);
        fragment52_DATA_END = .;
        fragment52_DATA_SIZE = ABSOLUTE(fragment52_DATA_END - fragment52_DATA_START);
        fragment52_RODATA_START = .;
        build/asm/us/data/fragments/52/fragment52_header.o(.rodata);
        build/asm/us/fragments/52/fragment52_27E4E0.o(.rodata);
        build/asm/us/fragments/52/fragment52_2853B0.o(.rodata);
        build/asm/us/fragments/52/fragment52_285750.o(.rodata);
        build/asm/us/fragments/52/fragment52_285F60.o(.rodata);
        build/asm/us/fragments/52/fragment52_2862C0.o(.rodata);
        build/asm/us/fragments/52/fragment52_2870A0.o(.rodata);
        build/asm/us/fragments/52/fragment52_2871C0.o(.rodata);
        fragment52_RODATA_END = .;
        fragment52_RODATA_SIZE = ABSOLUTE(fragment52_RODATA_END - fragment52_RODATA_START);
    }
    fragment52_bss_VRAM = ADDR(.fragment52_bss);
    .fragment52_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment52_BSS_START = .;
        build/asm/us/data/fragments/52/fragment52_header.o(.bss);
        build/asm/us/fragments/52/fragment52_27E4E0.o(.bss);
        build/asm/us/fragments/52/fragment52_2853B0.o(.bss);
        build/asm/us/fragments/52/fragment52_285750.o(.bss);
        build/asm/us/fragments/52/fragment52_285F60.o(.bss);
        build/asm/us/fragments/52/fragment52_2862C0.o(.bss);
        build/asm/us/fragments/52/fragment52_2870A0.o(.bss);
        build/asm/us/fragments/52/fragment52_2871C0.o(.bss);
        fragment52_BSS_END = .;
        fragment52_BSS_SIZE = ABSOLUTE(fragment52_BSS_END - fragment52_BSS_START);
    }
    __romPos += SIZEOF(.fragment52);
    fragment52_ROM_END = __romPos;
    fragment52_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment53_ROM_START = __romPos;
    fragment53_VRAM = ADDR(.fragment53);
    .fragment53 0x86500000 : AT(fragment53_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment53_TEXT_START = .;
        build/asm/us/data/fragments/53/fragment53_header.o(.text);
        build/asm/us/fragments/53/fragment53_code.o(.text);
        fragment53_TEXT_END = .;
        fragment53_TEXT_SIZE = ABSOLUTE(fragment53_TEXT_END - fragment53_TEXT_START);
        fragment53_DATA_START = .;
        fragments_53_fragment53_header = .;
        build/asm/us/data/fragments/53/fragment53_header.o(.data);
        fragments_53_fragment53_code = .;
        build/asm/us/fragments/53/fragment53_code.o(.data);
        fragments_53_fragment53_data_data = .;
        build/asm/us/data/fragments/53/fragment53_data.data.o(.data);
        fragment53_DATA_END = .;
        fragment53_DATA_SIZE = ABSOLUTE(fragment53_DATA_END - fragment53_DATA_START);
        fragment53_RODATA_START = .;
        build/asm/us/data/fragments/53/fragment53_header.o(.rodata);
        build/asm/us/fragments/53/fragment53_code.o(.rodata);
        fragment53_RODATA_END = .;
        fragment53_RODATA_SIZE = ABSOLUTE(fragment53_RODATA_END - fragment53_RODATA_START);
    }
    fragment53_bss_VRAM = ADDR(.fragment53_bss);
    .fragment53_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment53_BSS_START = .;
        build/asm/us/data/fragments/53/fragment53_header.o(.bss);
        build/asm/us/fragments/53/fragment53_code.o(.bss);
        fragment53_BSS_END = .;
        fragment53_BSS_SIZE = ABSOLUTE(fragment53_BSS_END - fragment53_BSS_START);
    }
    __romPos += SIZEOF(.fragment53);
    fragment53_ROM_END = __romPos;
    fragment53_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment54_ROM_START = __romPos;
    fragment54_VRAM = ADDR(.fragment54);
    .fragment54 0x86600000 : AT(fragment54_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment54_TEXT_START = .;
        build/asm/us/data/fragments/54/fragment54_header.o(.text);
        build/asm/us/fragments/54/fragment54_code.o(.text);
        fragment54_TEXT_END = .;
        fragment54_TEXT_SIZE = ABSOLUTE(fragment54_TEXT_END - fragment54_TEXT_START);
        fragment54_DATA_START = .;
        fragments_54_fragment54_header = .;
        build/asm/us/data/fragments/54/fragment54_header.o(.data);
        fragments_54_fragment54_code = .;
        build/asm/us/fragments/54/fragment54_code.o(.data);
        fragments_54_fragment54_data_data = .;
        build/asm/us/data/fragments/54/fragment54_data.data.o(.data);
        fragment54_DATA_END = .;
        fragment54_DATA_SIZE = ABSOLUTE(fragment54_DATA_END - fragment54_DATA_START);
        fragment54_RODATA_START = .;
        build/asm/us/data/fragments/54/fragment54_header.o(.rodata);
        build/asm/us/fragments/54/fragment54_code.o(.rodata);
        fragment54_RODATA_END = .;
        fragment54_RODATA_SIZE = ABSOLUTE(fragment54_RODATA_END - fragment54_RODATA_START);
    }
    fragment54_bss_VRAM = ADDR(.fragment54_bss);
    .fragment54_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment54_BSS_START = .;
        build/asm/us/data/fragments/54/fragment54_header.o(.bss);
        build/asm/us/fragments/54/fragment54_code.o(.bss);
        fragment54_BSS_END = .;
        fragment54_BSS_SIZE = ABSOLUTE(fragment54_BSS_END - fragment54_BSS_START);
    }
    __romPos += SIZEOF(.fragment54);
    fragment54_ROM_END = __romPos;
    fragment54_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment55_ROM_START = __romPos;
    fragment55_VRAM = ADDR(.fragment55);
    .fragment55 0x86700000 : AT(fragment55_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment55_TEXT_START = .;
        build/asm/us/data/fragments/55/fragment55_header.o(.text);
        build/asm/us/fragments/55/fragment55_code.o(.text);
        fragment55_TEXT_END = .;
        fragment55_TEXT_SIZE = ABSOLUTE(fragment55_TEXT_END - fragment55_TEXT_START);
        fragment55_DATA_START = .;
        fragments_55_fragment55_header = .;
        build/asm/us/data/fragments/55/fragment55_header.o(.data);
        fragments_55_fragment55_code = .;
        build/asm/us/fragments/55/fragment55_code.o(.data);
        fragments_55_fragment55_data_data = .;
        build/asm/us/data/fragments/55/fragment55_data.data.o(.data);
        fragment55_DATA_END = .;
        fragment55_DATA_SIZE = ABSOLUTE(fragment55_DATA_END - fragment55_DATA_START);
        fragment55_RODATA_START = .;
        build/asm/us/data/fragments/55/fragment55_header.o(.rodata);
        build/asm/us/fragments/55/fragment55_code.o(.rodata);
        fragment55_RODATA_END = .;
        fragment55_RODATA_SIZE = ABSOLUTE(fragment55_RODATA_END - fragment55_RODATA_START);
    }
    fragment55_bss_VRAM = ADDR(.fragment55_bss);
    .fragment55_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment55_BSS_START = .;
        build/asm/us/data/fragments/55/fragment55_header.o(.bss);
        build/asm/us/fragments/55/fragment55_code.o(.bss);
        fragment55_BSS_END = .;
        fragment55_BSS_SIZE = ABSOLUTE(fragment55_BSS_END - fragment55_BSS_START);
    }
    __romPos += SIZEOF(.fragment55);
    fragment55_ROM_END = __romPos;
    fragment55_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment56_ROM_START = __romPos;
    fragment56_VRAM = ADDR(.fragment56);
    .fragment56 0x86800000 : AT(fragment56_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment56_TEXT_START = .;
        build/asm/us/data/fragments/56/fragment56_header.o(.text);
        build/asm/us/fragments/56/fragment56_code.o(.text);
        fragment56_TEXT_END = .;
        fragment56_TEXT_SIZE = ABSOLUTE(fragment56_TEXT_END - fragment56_TEXT_START);
        fragment56_DATA_START = .;
        fragments_56_fragment56_header = .;
        build/asm/us/data/fragments/56/fragment56_header.o(.data);
        fragments_56_fragment56_code = .;
        build/asm/us/fragments/56/fragment56_code.o(.data);
        fragments_56_fragment56_data_data = .;
        build/asm/us/data/fragments/56/fragment56_data.data.o(.data);
        fragment56_DATA_END = .;
        fragment56_DATA_SIZE = ABSOLUTE(fragment56_DATA_END - fragment56_DATA_START);
        fragment56_RODATA_START = .;
        build/asm/us/data/fragments/56/fragment56_header.o(.rodata);
        build/asm/us/fragments/56/fragment56_code.o(.rodata);
        fragment56_RODATA_END = .;
        fragment56_RODATA_SIZE = ABSOLUTE(fragment56_RODATA_END - fragment56_RODATA_START);
    }
    fragment56_bss_VRAM = ADDR(.fragment56_bss);
    .fragment56_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment56_BSS_START = .;
        build/asm/us/data/fragments/56/fragment56_header.o(.bss);
        build/asm/us/fragments/56/fragment56_code.o(.bss);
        fragment56_BSS_END = .;
        fragment56_BSS_SIZE = ABSOLUTE(fragment56_BSS_END - fragment56_BSS_START);
    }
    __romPos += SIZEOF(.fragment56);
    fragment56_ROM_END = __romPos;
    fragment56_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment57_ROM_START = __romPos;
    fragment57_VRAM = ADDR(.fragment57);
    .fragment57 0x83300000 : AT(fragment57_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment57_TEXT_START = .;
        build/asm/us/data/fragments/57/fragment57_header.o(.text);
        build/asm/us/fragments/57/fragment57_code.o(.text);
        fragment57_TEXT_END = .;
        fragment57_TEXT_SIZE = ABSOLUTE(fragment57_TEXT_END - fragment57_TEXT_START);
        fragment57_DATA_START = .;
        fragments_57_fragment57_header = .;
        build/asm/us/data/fragments/57/fragment57_header.o(.data);
        fragments_57_fragment57_code = .;
        build/asm/us/fragments/57/fragment57_code.o(.data);
        fragments_57_fragment57_data_data = .;
        build/asm/us/data/fragments/57/fragment57_data.data.o(.data);
        fragment57_DATA_END = .;
        fragment57_DATA_SIZE = ABSOLUTE(fragment57_DATA_END - fragment57_DATA_START);
        fragment57_RODATA_START = .;
        build/asm/us/data/fragments/57/fragment57_header.o(.rodata);
        build/asm/us/fragments/57/fragment57_code.o(.rodata);
        fragment57_RODATA_END = .;
        fragment57_RODATA_SIZE = ABSOLUTE(fragment57_RODATA_END - fragment57_RODATA_START);
    }
    fragment57_bss_VRAM = ADDR(.fragment57_bss);
    .fragment57_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment57_BSS_START = .;
        build/asm/us/data/fragments/57/fragment57_header.o(.bss);
        build/asm/us/fragments/57/fragment57_code.o(.bss);
        fragment57_BSS_END = .;
        fragment57_BSS_SIZE = ABSOLUTE(fragment57_BSS_END - fragment57_BSS_START);
    }
    __romPos += SIZEOF(.fragment57);
    fragment57_ROM_END = __romPos;
    fragment57_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment58_ROM_START = __romPos;
    fragment58_VRAM = ADDR(.fragment58);
    .fragment58 0x83400000 : AT(fragment58_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment58_TEXT_START = .;
        build/asm/us/data/fragments/58/fragment58_header.o(.text);
        build/asm/us/fragments/58/fragment58_code.o(.text);
        fragment58_TEXT_END = .;
        fragment58_TEXT_SIZE = ABSOLUTE(fragment58_TEXT_END - fragment58_TEXT_START);
        fragment58_DATA_START = .;
        fragments_58_fragment58_header = .;
        build/asm/us/data/fragments/58/fragment58_header.o(.data);
        fragments_58_fragment58_code = .;
        build/asm/us/fragments/58/fragment58_code.o(.data);
        fragments_58_fragment58_data_data = .;
        build/asm/us/data/fragments/58/fragment58_data.data.o(.data);
        fragment58_DATA_END = .;
        fragment58_DATA_SIZE = ABSOLUTE(fragment58_DATA_END - fragment58_DATA_START);
        fragment58_RODATA_START = .;
        build/asm/us/data/fragments/58/fragment58_header.o(.rodata);
        build/asm/us/fragments/58/fragment58_code.o(.rodata);
        fragment58_RODATA_END = .;
        fragment58_RODATA_SIZE = ABSOLUTE(fragment58_RODATA_END - fragment58_RODATA_START);
    }
    fragment58_bss_VRAM = ADDR(.fragment58_bss);
    .fragment58_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment58_BSS_START = .;
        build/asm/us/data/fragments/58/fragment58_header.o(.bss);
        build/asm/us/fragments/58/fragment58_code.o(.bss);
        fragment58_BSS_END = .;
        fragment58_BSS_SIZE = ABSOLUTE(fragment58_BSS_END - fragment58_BSS_START);
    }
    __romPos += SIZEOF(.fragment58);
    fragment58_ROM_END = __romPos;
    fragment58_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment59_ROM_START = __romPos;
    fragment59_VRAM = ADDR(.fragment59);
    .fragment59 0x86900000 : AT(fragment59_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment59_TEXT_START = .;
        build/asm/us/data/fragments/59/fragment59_header.o(.text);
        build/asm/us/fragments/59/fragment59_code.o(.text);
        fragment59_TEXT_END = .;
        fragment59_TEXT_SIZE = ABSOLUTE(fragment59_TEXT_END - fragment59_TEXT_START);
        fragment59_DATA_START = .;
        fragments_59_fragment59_header = .;
        build/asm/us/data/fragments/59/fragment59_header.o(.data);
        fragments_59_fragment59_code = .;
        build/asm/us/fragments/59/fragment59_code.o(.data);
        fragments_59_fragment59_data_data = .;
        build/asm/us/data/fragments/59/fragment59_data.data.o(.data);
        fragment59_DATA_END = .;
        fragment59_DATA_SIZE = ABSOLUTE(fragment59_DATA_END - fragment59_DATA_START);
        fragment59_RODATA_START = .;
        build/asm/us/data/fragments/59/fragment59_header.o(.rodata);
        build/asm/us/fragments/59/fragment59_code.o(.rodata);
        fragment59_RODATA_END = .;
        fragment59_RODATA_SIZE = ABSOLUTE(fragment59_RODATA_END - fragment59_RODATA_START);
    }
    fragment59_bss_VRAM = ADDR(.fragment59_bss);
    .fragment59_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment59_BSS_START = .;
        build/asm/us/data/fragments/59/fragment59_header.o(.bss);
        build/asm/us/fragments/59/fragment59_code.o(.bss);
        fragment59_BSS_END = .;
        fragment59_BSS_SIZE = ABSOLUTE(fragment59_BSS_END - fragment59_BSS_START);
    }
    __romPos += SIZEOF(.fragment59);
    fragment59_ROM_END = __romPos;
    fragment59_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment60_ROM_START = __romPos;
    fragment60_VRAM = ADDR(.fragment60);
    .fragment60 0x86A00000 : AT(fragment60_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment60_TEXT_START = .;
        build/asm/us/data/fragments/60/fragment60_header.o(.text);
        build/asm/us/fragments/60/fragment60_code.o(.text);
        fragment60_TEXT_END = .;
        fragment60_TEXT_SIZE = ABSOLUTE(fragment60_TEXT_END - fragment60_TEXT_START);
        fragment60_DATA_START = .;
        fragments_60_fragment60_header = .;
        build/asm/us/data/fragments/60/fragment60_header.o(.data);
        fragments_60_fragment60_code = .;
        build/asm/us/fragments/60/fragment60_code.o(.data);
        fragments_60_fragment60_data_data = .;
        build/asm/us/data/fragments/60/fragment60_data.data.o(.data);
        fragment60_DATA_END = .;
        fragment60_DATA_SIZE = ABSOLUTE(fragment60_DATA_END - fragment60_DATA_START);
        fragment60_RODATA_START = .;
        build/asm/us/data/fragments/60/fragment60_header.o(.rodata);
        build/asm/us/fragments/60/fragment60_code.o(.rodata);
        fragment60_RODATA_END = .;
        fragment60_RODATA_SIZE = ABSOLUTE(fragment60_RODATA_END - fragment60_RODATA_START);
    }
    fragment60_bss_VRAM = ADDR(.fragment60_bss);
    .fragment60_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment60_BSS_START = .;
        build/asm/us/data/fragments/60/fragment60_header.o(.bss);
        build/asm/us/fragments/60/fragment60_code.o(.bss);
        fragment60_BSS_END = .;
        fragment60_BSS_SIZE = ABSOLUTE(fragment60_BSS_END - fragment60_BSS_START);
    }
    __romPos += SIZEOF(.fragment60);
    fragment60_ROM_END = __romPos;
    fragment60_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment61_ROM_START = __romPos;
    fragment61_VRAM = ADDR(.fragment61);
    .fragment61 0x86B00000 : AT(fragment61_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment61_TEXT_START = .;
        build/asm/us/data/fragments/61/fragment61_header.o(.text);
        build/asm/us/fragments/61/fragment61_code.o(.text);
        fragment61_TEXT_END = .;
        fragment61_TEXT_SIZE = ABSOLUTE(fragment61_TEXT_END - fragment61_TEXT_START);
        fragment61_DATA_START = .;
        fragments_61_fragment61_header = .;
        build/asm/us/data/fragments/61/fragment61_header.o(.data);
        fragments_61_fragment61_code = .;
        build/asm/us/fragments/61/fragment61_code.o(.data);
        fragments_61_fragment61_data_data = .;
        build/asm/us/data/fragments/61/fragment61_data.data.o(.data);
        fragment61_DATA_END = .;
        fragment61_DATA_SIZE = ABSOLUTE(fragment61_DATA_END - fragment61_DATA_START);
        fragment61_RODATA_START = .;
        build/asm/us/data/fragments/61/fragment61_header.o(.rodata);
        build/asm/us/fragments/61/fragment61_code.o(.rodata);
        fragment61_RODATA_END = .;
        fragment61_RODATA_SIZE = ABSOLUTE(fragment61_RODATA_END - fragment61_RODATA_START);
    }
    fragment61_bss_VRAM = ADDR(.fragment61_bss);
    .fragment61_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment61_BSS_START = .;
        build/asm/us/data/fragments/61/fragment61_header.o(.bss);
        build/asm/us/fragments/61/fragment61_code.o(.bss);
        fragment61_BSS_END = .;
        fragment61_BSS_SIZE = ABSOLUTE(fragment61_BSS_END - fragment61_BSS_START);
    }
    __romPos += SIZEOF(.fragment61);
    fragment61_ROM_END = __romPos;
    fragment61_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment62_ROM_START = __romPos;
    fragment62_VRAM = ADDR(.fragment62);
    .fragment62 0x86C00000 : AT(fragment62_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment62_TEXT_START = .;
        build/asm/us/data/fragments/62/fragment62_header.o(.text);
        build/asm/us/fragments/62/fragment62_code.o(.text);
        fragment62_TEXT_END = .;
        fragment62_TEXT_SIZE = ABSOLUTE(fragment62_TEXT_END - fragment62_TEXT_START);
        fragment62_DATA_START = .;
        fragments_62_fragment62_header = .;
        build/asm/us/data/fragments/62/fragment62_header.o(.data);
        fragments_62_fragment62_code = .;
        build/asm/us/fragments/62/fragment62_code.o(.data);
        fragments_62_fragment62_data_data = .;
        build/asm/us/data/fragments/62/fragment62_data.data.o(.data);
        fragment62_DATA_END = .;
        fragment62_DATA_SIZE = ABSOLUTE(fragment62_DATA_END - fragment62_DATA_START);
        fragment62_RODATA_START = .;
        build/asm/us/data/fragments/62/fragment62_header.o(.rodata);
        build/asm/us/fragments/62/fragment62_code.o(.rodata);
        fragment62_RODATA_END = .;
        fragment62_RODATA_SIZE = ABSOLUTE(fragment62_RODATA_END - fragment62_RODATA_START);
    }
    fragment62_bss_VRAM = ADDR(.fragment62_bss);
    .fragment62_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment62_BSS_START = .;
        build/asm/us/data/fragments/62/fragment62_header.o(.bss);
        build/asm/us/fragments/62/fragment62_code.o(.bss);
        fragment62_BSS_END = .;
        fragment62_BSS_SIZE = ABSOLUTE(fragment62_BSS_END - fragment62_BSS_START);
    }
    __romPos += SIZEOF(.fragment62);
    fragment62_ROM_END = __romPos;
    fragment62_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment63_ROM_START = __romPos;
    fragment63_VRAM = ADDR(.fragment63);
    .fragment63 0x87E00000 : AT(fragment63_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment63_TEXT_START = .;
        build/asm/us/data/fragments/63/fragment63_header.o(.text);
        build/asm/us/fragments/63/fragment63_303990.o(.text);
        build/asm/us/fragments/63/fragment63_305090.o(.text);
        build/asm/us/fragments/63/fragment63_306150.o(.text);
        build/asm/us/fragments/63/fragment63_307D60.o(.text);
        build/asm/us/fragments/63/fragment63_308D70.o(.text);
        build/asm/us/fragments/63/fragment63_30B540.o(.text);
        build/asm/us/fragments/63/fragment63_30E370.o(.text);
        build/asm/us/fragments/63/fragment63_30F070.o(.text);
        build/asm/us/fragments/63/fragment63_310270.o(.text);
        build/asm/us/fragments/63/fragment63_312AE0.o(.text);
        build/asm/us/fragments/63/fragment63_315A90.o(.text);
        build/asm/us/fragments/63/fragment63_317060.o(.text);
        build/asm/us/fragments/63/fragment63_31BD80.o(.text);
        build/asm/us/fragments/63/fragment63_31CB20.o(.text);
        fragment63_TEXT_END = .;
        fragment63_TEXT_SIZE = ABSOLUTE(fragment63_TEXT_END - fragment63_TEXT_START);
        fragment63_DATA_START = .;
        fragments_63_fragment63_header = .;
        build/asm/us/data/fragments/63/fragment63_header.o(.data);
        fragments_63_fragment63_303990 = .;
        build/asm/us/fragments/63/fragment63_303990.o(.data);
        fragments_63_fragment63_305090 = .;
        build/asm/us/fragments/63/fragment63_305090.o(.data);
        fragments_63_fragment63_306150 = .;
        build/asm/us/fragments/63/fragment63_306150.o(.data);
        fragments_63_fragment63_307D60 = .;
        build/asm/us/fragments/63/fragment63_307D60.o(.data);
        fragments_63_fragment63_308D70 = .;
        build/asm/us/fragments/63/fragment63_308D70.o(.data);
        fragments_63_fragment63_30B540 = .;
        build/asm/us/fragments/63/fragment63_30B540.o(.data);
        fragments_63_fragment63_30E370 = .;
        build/asm/us/fragments/63/fragment63_30E370.o(.data);
        fragments_63_fragment63_30F070 = .;
        build/asm/us/fragments/63/fragment63_30F070.o(.data);
        fragments_63_fragment63_310270 = .;
        build/asm/us/fragments/63/fragment63_310270.o(.data);
        fragments_63_fragment63_312AE0 = .;
        build/asm/us/fragments/63/fragment63_312AE0.o(.data);
        fragments_63_fragment63_315A90 = .;
        build/asm/us/fragments/63/fragment63_315A90.o(.data);
        fragments_63_fragment63_317060 = .;
        build/asm/us/fragments/63/fragment63_317060.o(.data);
        fragments_63_fragment63_31BD80 = .;
        build/asm/us/fragments/63/fragment63_31BD80.o(.data);
        fragments_63_fragment63_31CB20 = .;
        build/asm/us/fragments/63/fragment63_31CB20.o(.data);
        fragments_63_fragment63_data_data = .;
        build/asm/us/data/fragments/63/fragment63_data.data.o(.data);
        fragment63_DATA_END = .;
        fragment63_DATA_SIZE = ABSOLUTE(fragment63_DATA_END - fragment63_DATA_START);
        fragment63_RODATA_START = .;
        build/asm/us/data/fragments/63/fragment63_header.o(.rodata);
        build/asm/us/fragments/63/fragment63_303990.o(.rodata);
        build/asm/us/fragments/63/fragment63_305090.o(.rodata);
        build/asm/us/fragments/63/fragment63_306150.o(.rodata);
        build/asm/us/fragments/63/fragment63_307D60.o(.rodata);
        build/asm/us/fragments/63/fragment63_308D70.o(.rodata);
        build/asm/us/fragments/63/fragment63_30B540.o(.rodata);
        build/asm/us/fragments/63/fragment63_30E370.o(.rodata);
        build/asm/us/fragments/63/fragment63_30F070.o(.rodata);
        build/asm/us/fragments/63/fragment63_310270.o(.rodata);
        build/asm/us/fragments/63/fragment63_312AE0.o(.rodata);
        build/asm/us/fragments/63/fragment63_315A90.o(.rodata);
        build/asm/us/fragments/63/fragment63_317060.o(.rodata);
        build/asm/us/fragments/63/fragment63_31BD80.o(.rodata);
        build/asm/us/fragments/63/fragment63_31CB20.o(.rodata);
        fragment63_RODATA_END = .;
        fragment63_RODATA_SIZE = ABSOLUTE(fragment63_RODATA_END - fragment63_RODATA_START);
    }
    fragment63_bss_VRAM = ADDR(.fragment63_bss);
    .fragment63_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment63_BSS_START = .;
        build/asm/us/data/fragments/63/fragment63_header.o(.bss);
        build/asm/us/fragments/63/fragment63_303990.o(.bss);
        build/asm/us/fragments/63/fragment63_305090.o(.bss);
        build/asm/us/fragments/63/fragment63_306150.o(.bss);
        build/asm/us/fragments/63/fragment63_307D60.o(.bss);
        build/asm/us/fragments/63/fragment63_308D70.o(.bss);
        build/asm/us/fragments/63/fragment63_30B540.o(.bss);
        build/asm/us/fragments/63/fragment63_30E370.o(.bss);
        build/asm/us/fragments/63/fragment63_30F070.o(.bss);
        build/asm/us/fragments/63/fragment63_310270.o(.bss);
        build/asm/us/fragments/63/fragment63_312AE0.o(.bss);
        build/asm/us/fragments/63/fragment63_315A90.o(.bss);
        build/asm/us/fragments/63/fragment63_317060.o(.bss);
        build/asm/us/fragments/63/fragment63_31BD80.o(.bss);
        build/asm/us/fragments/63/fragment63_31CB20.o(.bss);
        fragment63_BSS_END = .;
        fragment63_BSS_SIZE = ABSOLUTE(fragment63_BSS_END - fragment63_BSS_START);
    }
    __romPos += SIZEOF(.fragment63);
    fragment63_ROM_END = __romPos;
    fragment63_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment64_ROM_START = __romPos;
    fragment64_VRAM = ADDR(.fragment64);
    .fragment64 0x87F00000 : AT(fragment64_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment64_TEXT_START = .;
        build/asm/us/data/fragments/64/fragment64_header.o(.text);
        build/asm/us/fragments/64/fragment64_322C90.o(.text);
        build/asm/us/fragments/64/fragment64_3235A0.o(.text);
        build/asm/us/fragments/64/fragment64_324A10.o(.text);
        build/asm/us/fragments/64/fragment64_324FB0.o(.text);
        build/asm/us/fragments/64/fragment64_325920.o(.text);
        build/asm/us/fragments/64/fragment64_326160.o(.text);
        build/asm/us/fragments/64/fragment64_326820.o(.text);
        build/asm/us/fragments/64/fragment64_326ED0.o(.text);
        build/asm/us/fragments/64/fragment64_328C20.o(.text);
        build/asm/us/fragments/64/fragment64_328E40.o(.text);
        build/asm/us/fragments/64/fragment64_3290A0.o(.text);
        build/asm/us/fragments/64/fragment64_32AEF0.o(.text);
        build/asm/us/fragments/64/fragment64_32BC10.o(.text);
        build/asm/us/fragments/64/fragment64_32C420.o(.text);
        build/asm/us/fragments/64/fragment64_32D260.o(.text);
        build/asm/us/fragments/64/fragment64_32D7D0.o(.text);
        build/asm/us/fragments/64/fragment64_32DC40.o(.text);
        build/asm/us/fragments/64/fragment64_32EC70.o(.text);
        build/asm/us/fragments/64/fragment64_32F2C0.o(.text);
        build/asm/us/fragments/64/fragment64_32F5F0.o(.text);
        build/asm/us/fragments/64/fragment64_32FE10.o(.text);
        build/asm/us/fragments/64/fragment64_330850.o(.text);
        build/asm/us/fragments/64/fragment64_331000.o(.text);
        build/asm/us/fragments/64/fragment64_3312D0.o(.text);
        build/asm/us/fragments/64/fragment64_3320F0.o(.text);
        fragment64_TEXT_END = .;
        fragment64_TEXT_SIZE = ABSOLUTE(fragment64_TEXT_END - fragment64_TEXT_START);
        fragment64_DATA_START = .;
        fragments_64_fragment64_header = .;
        build/asm/us/data/fragments/64/fragment64_header.o(.data);
        fragments_64_fragment64_322C90 = .;
        build/asm/us/fragments/64/fragment64_322C90.o(.data);
        fragments_64_fragment64_3235A0 = .;
        build/asm/us/fragments/64/fragment64_3235A0.o(.data);
        fragments_64_fragment64_324A10 = .;
        build/asm/us/fragments/64/fragment64_324A10.o(.data);
        fragments_64_fragment64_324FB0 = .;
        build/asm/us/fragments/64/fragment64_324FB0.o(.data);
        fragments_64_fragment64_325920 = .;
        build/asm/us/fragments/64/fragment64_325920.o(.data);
        fragments_64_fragment64_326160 = .;
        build/asm/us/fragments/64/fragment64_326160.o(.data);
        fragments_64_fragment64_326820 = .;
        build/asm/us/fragments/64/fragment64_326820.o(.data);
        fragments_64_fragment64_326ED0 = .;
        build/asm/us/fragments/64/fragment64_326ED0.o(.data);
        fragments_64_fragment64_328C20 = .;
        build/asm/us/fragments/64/fragment64_328C20.o(.data);
        fragments_64_fragment64_328E40 = .;
        build/asm/us/fragments/64/fragment64_328E40.o(.data);
        fragments_64_fragment64_3290A0 = .;
        build/asm/us/fragments/64/fragment64_3290A0.o(.data);
        fragments_64_fragment64_32AEF0 = .;
        build/asm/us/fragments/64/fragment64_32AEF0.o(.data);
        fragments_64_fragment64_32BC10 = .;
        build/asm/us/fragments/64/fragment64_32BC10.o(.data);
        fragments_64_fragment64_32C420 = .;
        build/asm/us/fragments/64/fragment64_32C420.o(.data);
        fragments_64_fragment64_32D260 = .;
        build/asm/us/fragments/64/fragment64_32D260.o(.data);
        fragments_64_fragment64_32D7D0 = .;
        build/asm/us/fragments/64/fragment64_32D7D0.o(.data);
        fragments_64_fragment64_32DC40 = .;
        build/asm/us/fragments/64/fragment64_32DC40.o(.data);
        fragments_64_fragment64_32EC70 = .;
        build/asm/us/fragments/64/fragment64_32EC70.o(.data);
        fragments_64_fragment64_32F2C0 = .;
        build/asm/us/fragments/64/fragment64_32F2C0.o(.data);
        fragments_64_fragment64_32F5F0 = .;
        build/asm/us/fragments/64/fragment64_32F5F0.o(.data);
        fragments_64_fragment64_32FE10 = .;
        build/asm/us/fragments/64/fragment64_32FE10.o(.data);
        fragments_64_fragment64_330850 = .;
        build/asm/us/fragments/64/fragment64_330850.o(.data);
        fragments_64_fragment64_331000 = .;
        build/asm/us/fragments/64/fragment64_331000.o(.data);
        fragments_64_fragment64_3312D0 = .;
        build/asm/us/fragments/64/fragment64_3312D0.o(.data);
        fragments_64_fragment64_3320F0 = .;
        build/asm/us/fragments/64/fragment64_3320F0.o(.data);
        fragments_64_fragment64_data_data = .;
        build/asm/us/data/fragments/64/fragment64_data.data.o(.data);
        fragment64_DATA_END = .;
        fragment64_DATA_SIZE = ABSOLUTE(fragment64_DATA_END - fragment64_DATA_START);
        fragment64_RODATA_START = .;
        build/asm/us/data/fragments/64/fragment64_header.o(.rodata);
        build/asm/us/fragments/64/fragment64_322C90.o(.rodata);
        build/asm/us/fragments/64/fragment64_3235A0.o(.rodata);
        build/asm/us/fragments/64/fragment64_324A10.o(.rodata);
        build/asm/us/fragments/64/fragment64_324FB0.o(.rodata);
        build/asm/us/fragments/64/fragment64_325920.o(.rodata);
        build/asm/us/fragments/64/fragment64_326160.o(.rodata);
        build/asm/us/fragments/64/fragment64_326820.o(.rodata);
        build/asm/us/fragments/64/fragment64_326ED0.o(.rodata);
        build/asm/us/fragments/64/fragment64_328C20.o(.rodata);
        build/asm/us/fragments/64/fragment64_328E40.o(.rodata);
        build/asm/us/fragments/64/fragment64_3290A0.o(.rodata);
        build/asm/us/fragments/64/fragment64_32AEF0.o(.rodata);
        build/asm/us/fragments/64/fragment64_32BC10.o(.rodata);
        build/asm/us/fragments/64/fragment64_32C420.o(.rodata);
        build/asm/us/fragments/64/fragment64_32D260.o(.rodata);
        build/asm/us/fragments/64/fragment64_32D7D0.o(.rodata);
        build/asm/us/fragments/64/fragment64_32DC40.o(.rodata);
        build/asm/us/fragments/64/fragment64_32EC70.o(.rodata);
        build/asm/us/fragments/64/fragment64_32F2C0.o(.rodata);
        build/asm/us/fragments/64/fragment64_32F5F0.o(.rodata);
        build/asm/us/fragments/64/fragment64_32FE10.o(.rodata);
        build/asm/us/fragments/64/fragment64_330850.o(.rodata);
        build/asm/us/fragments/64/fragment64_331000.o(.rodata);
        build/asm/us/fragments/64/fragment64_3312D0.o(.rodata);
        build/asm/us/fragments/64/fragment64_3320F0.o(.rodata);
        fragment64_RODATA_END = .;
        fragment64_RODATA_SIZE = ABSOLUTE(fragment64_RODATA_END - fragment64_RODATA_START);
    }
    fragment64_bss_VRAM = ADDR(.fragment64_bss);
    .fragment64_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment64_BSS_START = .;
        build/asm/us/data/fragments/64/fragment64_header.o(.bss);
        build/asm/us/fragments/64/fragment64_322C90.o(.bss);
        build/asm/us/fragments/64/fragment64_3235A0.o(.bss);
        build/asm/us/fragments/64/fragment64_324A10.o(.bss);
        build/asm/us/fragments/64/fragment64_324FB0.o(.bss);
        build/asm/us/fragments/64/fragment64_325920.o(.bss);
        build/asm/us/fragments/64/fragment64_326160.o(.bss);
        build/asm/us/fragments/64/fragment64_326820.o(.bss);
        build/asm/us/fragments/64/fragment64_326ED0.o(.bss);
        build/asm/us/fragments/64/fragment64_328C20.o(.bss);
        build/asm/us/fragments/64/fragment64_328E40.o(.bss);
        build/asm/us/fragments/64/fragment64_3290A0.o(.bss);
        build/asm/us/fragments/64/fragment64_32AEF0.o(.bss);
        build/asm/us/fragments/64/fragment64_32BC10.o(.bss);
        build/asm/us/fragments/64/fragment64_32C420.o(.bss);
        build/asm/us/fragments/64/fragment64_32D260.o(.bss);
        build/asm/us/fragments/64/fragment64_32D7D0.o(.bss);
        build/asm/us/fragments/64/fragment64_32DC40.o(.bss);
        build/asm/us/fragments/64/fragment64_32EC70.o(.bss);
        build/asm/us/fragments/64/fragment64_32F2C0.o(.bss);
        build/asm/us/fragments/64/fragment64_32F5F0.o(.bss);
        build/asm/us/fragments/64/fragment64_32FE10.o(.bss);
        build/asm/us/fragments/64/fragment64_330850.o(.bss);
        build/asm/us/fragments/64/fragment64_331000.o(.bss);
        build/asm/us/fragments/64/fragment64_3312D0.o(.bss);
        build/asm/us/fragments/64/fragment64_3320F0.o(.bss);
        fragment64_BSS_END = .;
        fragment64_BSS_SIZE = ABSOLUTE(fragment64_BSS_END - fragment64_BSS_START);
    }
    __romPos += SIZEOF(.fragment64);
    fragment64_ROM_END = __romPos;
    fragment64_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment65_ROM_START = __romPos;
    fragment65_VRAM = ADDR(.fragment65);
    .fragment65 0x87D00000 : AT(fragment65_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment65_TEXT_START = .;
        build/asm/us/data/fragments/65/fragment65_header.o(.text);
        build/asm/us/fragments/65/fragment65_code.o(.text);
        fragment65_TEXT_END = .;
        fragment65_TEXT_SIZE = ABSOLUTE(fragment65_TEXT_END - fragment65_TEXT_START);
        fragment65_DATA_START = .;
        fragments_65_fragment65_header = .;
        build/asm/us/data/fragments/65/fragment65_header.o(.data);
        fragments_65_fragment65_code = .;
        build/asm/us/fragments/65/fragment65_code.o(.data);
        fragments_65_fragment65_data_data = .;
        build/asm/us/data/fragments/65/fragment65_data.data.o(.data);
        fragment65_DATA_END = .;
        fragment65_DATA_SIZE = ABSOLUTE(fragment65_DATA_END - fragment65_DATA_START);
        fragment65_RODATA_START = .;
        build/asm/us/data/fragments/65/fragment65_header.o(.rodata);
        build/asm/us/fragments/65/fragment65_code.o(.rodata);
        fragment65_RODATA_END = .;
        fragment65_RODATA_SIZE = ABSOLUTE(fragment65_RODATA_END - fragment65_RODATA_START);
    }
    fragment65_bss_VRAM = ADDR(.fragment65_bss);
    .fragment65_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment65_BSS_START = .;
        build/asm/us/data/fragments/65/fragment65_header.o(.bss);
        build/asm/us/fragments/65/fragment65_code.o(.bss);
        fragment65_BSS_END = .;
        fragment65_BSS_SIZE = ABSOLUTE(fragment65_BSS_END - fragment65_BSS_START);
    }
    __romPos += SIZEOF(.fragment65);
    fragment65_ROM_END = __romPos;
    fragment65_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment66_ROM_START = __romPos;
    fragment66_VRAM = ADDR(.fragment66);
    .fragment66 0x82E00000 : AT(fragment66_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment66_TEXT_START = .;
        build/asm/us/data/fragments/66/fragment66_header.o(.text);
        build/asm/us/fragments/66/fragment66_code.o(.text);
        fragment66_TEXT_END = .;
        fragment66_TEXT_SIZE = ABSOLUTE(fragment66_TEXT_END - fragment66_TEXT_START);
        fragment66_DATA_START = .;
        fragments_66_fragment66_header = .;
        build/asm/us/data/fragments/66/fragment66_header.o(.data);
        fragments_66_fragment66_code = .;
        build/asm/us/fragments/66/fragment66_code.o(.data);
        fragments_66_fragment66_data_data = .;
        build/asm/us/data/fragments/66/fragment66_data.data.o(.data);
        fragment66_DATA_END = .;
        fragment66_DATA_SIZE = ABSOLUTE(fragment66_DATA_END - fragment66_DATA_START);
        fragment66_RODATA_START = .;
        build/asm/us/data/fragments/66/fragment66_header.o(.rodata);
        build/asm/us/fragments/66/fragment66_code.o(.rodata);
        fragment66_RODATA_END = .;
        fragment66_RODATA_SIZE = ABSOLUTE(fragment66_RODATA_END - fragment66_RODATA_START);
    }
    fragment66_bss_VRAM = ADDR(.fragment66_bss);
    .fragment66_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment66_BSS_START = .;
        build/asm/us/data/fragments/66/fragment66_header.o(.bss);
        build/asm/us/fragments/66/fragment66_code.o(.bss);
        fragment66_BSS_END = .;
        fragment66_BSS_SIZE = ABSOLUTE(fragment66_BSS_END - fragment66_BSS_START);
    }
    __romPos += SIZEOF(.fragment66);
    fragment66_ROM_END = __romPos;
    fragment66_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment67_ROM_START = __romPos;
    fragment67_VRAM = ADDR(.fragment67);
    .fragment67 0x82900000 : AT(fragment67_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment67_TEXT_START = .;
        build/asm/us/data/fragments/67/fragment67_header.o(.text);
        build/asm/us/fragments/67/fragment67_33CB20.o(.text);
        build/asm/us/fragments/67/fragment67_33D6A0.o(.text);
        build/asm/us/fragments/67/fragment67_33F420.o(.text);
        build/asm/us/fragments/67/fragment67_33FAE0.o(.text);
        build/asm/us/fragments/67/fragment67_3422F0.o(.text);
        build/asm/us/fragments/67/fragment67_342DB0.o(.text);
        build/asm/us/fragments/67/fragment67_343510.o(.text);
        build/asm/us/fragments/67/fragment67_344D70.o(.text);
        build/asm/us/fragments/67/fragment67_34AB40.o(.text);
        build/asm/us/fragments/67/fragment67_34B0F0.o(.text);
        build/asm/us/fragments/67/fragment67_34C8B0.o(.text);
        fragment67_TEXT_END = .;
        fragment67_TEXT_SIZE = ABSOLUTE(fragment67_TEXT_END - fragment67_TEXT_START);
        fragment67_DATA_START = .;
        fragments_67_fragment67_header = .;
        build/asm/us/data/fragments/67/fragment67_header.o(.data);
        fragments_67_fragment67_33CB20 = .;
        build/asm/us/fragments/67/fragment67_33CB20.o(.data);
        fragments_67_fragment67_33D6A0 = .;
        build/asm/us/fragments/67/fragment67_33D6A0.o(.data);
        fragments_67_fragment67_33F420 = .;
        build/asm/us/fragments/67/fragment67_33F420.o(.data);
        fragments_67_fragment67_33FAE0 = .;
        build/asm/us/fragments/67/fragment67_33FAE0.o(.data);
        fragments_67_fragment67_3422F0 = .;
        build/asm/us/fragments/67/fragment67_3422F0.o(.data);
        fragments_67_fragment67_342DB0 = .;
        build/asm/us/fragments/67/fragment67_342DB0.o(.data);
        fragments_67_fragment67_343510 = .;
        build/asm/us/fragments/67/fragment67_343510.o(.data);
        fragments_67_fragment67_344D70 = .;
        build/asm/us/fragments/67/fragment67_344D70.o(.data);
        fragments_67_fragment67_34AB40 = .;
        build/asm/us/fragments/67/fragment67_34AB40.o(.data);
        fragments_67_fragment67_34B0F0 = .;
        build/asm/us/fragments/67/fragment67_34B0F0.o(.data);
        fragments_67_fragment67_34C8B0 = .;
        build/asm/us/fragments/67/fragment67_34C8B0.o(.data);
        fragments_67_fragment67_data_data = .;
        build/asm/us/data/fragments/67/fragment67_data.data.o(.data);
        fragment67_DATA_END = .;
        fragment67_DATA_SIZE = ABSOLUTE(fragment67_DATA_END - fragment67_DATA_START);
        fragment67_RODATA_START = .;
        build/asm/us/data/fragments/67/fragment67_header.o(.rodata);
        build/asm/us/fragments/67/fragment67_33CB20.o(.rodata);
        build/asm/us/fragments/67/fragment67_33D6A0.o(.rodata);
        build/asm/us/fragments/67/fragment67_33F420.o(.rodata);
        build/asm/us/fragments/67/fragment67_33FAE0.o(.rodata);
        build/asm/us/fragments/67/fragment67_3422F0.o(.rodata);
        build/asm/us/fragments/67/fragment67_342DB0.o(.rodata);
        build/asm/us/fragments/67/fragment67_343510.o(.rodata);
        build/asm/us/fragments/67/fragment67_344D70.o(.rodata);
        build/asm/us/fragments/67/fragment67_34AB40.o(.rodata);
        build/asm/us/fragments/67/fragment67_34B0F0.o(.rodata);
        build/asm/us/fragments/67/fragment67_34C8B0.o(.rodata);
        fragment67_RODATA_END = .;
        fragment67_RODATA_SIZE = ABSOLUTE(fragment67_RODATA_END - fragment67_RODATA_START);
    }
    fragment67_bss_VRAM = ADDR(.fragment67_bss);
    .fragment67_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment67_BSS_START = .;
        build/asm/us/data/fragments/67/fragment67_header.o(.bss);
        build/asm/us/fragments/67/fragment67_33CB20.o(.bss);
        build/asm/us/fragments/67/fragment67_33D6A0.o(.bss);
        build/asm/us/fragments/67/fragment67_33F420.o(.bss);
        build/asm/us/fragments/67/fragment67_33FAE0.o(.bss);
        build/asm/us/fragments/67/fragment67_3422F0.o(.bss);
        build/asm/us/fragments/67/fragment67_342DB0.o(.bss);
        build/asm/us/fragments/67/fragment67_343510.o(.bss);
        build/asm/us/fragments/67/fragment67_344D70.o(.bss);
        build/asm/us/fragments/67/fragment67_34AB40.o(.bss);
        build/asm/us/fragments/67/fragment67_34B0F0.o(.bss);
        build/asm/us/fragments/67/fragment67_34C8B0.o(.bss);
        fragment67_BSS_END = .;
        fragment67_BSS_SIZE = ABSOLUTE(fragment67_BSS_END - fragment67_BSS_START);
    }
    __romPos += SIZEOF(.fragment67);
    fragment67_ROM_END = __romPos;
    fragment67_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment68_ROM_START = __romPos;
    fragment68_VRAM = ADDR(.fragment68);
    .fragment68 0x8F000000 : AT(fragment68_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment68_TEXT_START = .;
        build/asm/us/data/fragments/68/fragment68_header.o(.text);
        build/asm/us/fragments/68/fragment68_code.o(.text);
        fragment68_TEXT_END = .;
        fragment68_TEXT_SIZE = ABSOLUTE(fragment68_TEXT_END - fragment68_TEXT_START);
        fragment68_DATA_START = .;
        fragments_68_fragment68_header = .;
        build/asm/us/data/fragments/68/fragment68_header.o(.data);
        fragments_68_fragment68_code = .;
        build/asm/us/fragments/68/fragment68_code.o(.data);
        fragments_68_fragment68_data_data = .;
        build/asm/us/data/fragments/68/fragment68_data.data.o(.data);
        fragment68_DATA_END = .;
        fragment68_DATA_SIZE = ABSOLUTE(fragment68_DATA_END - fragment68_DATA_START);
        fragment68_RODATA_START = .;
        build/asm/us/data/fragments/68/fragment68_header.o(.rodata);
        build/asm/us/fragments/68/fragment68_code.o(.rodata);
        fragment68_RODATA_END = .;
        fragment68_RODATA_SIZE = ABSOLUTE(fragment68_RODATA_END - fragment68_RODATA_START);
    }
    fragment68_bss_VRAM = ADDR(.fragment68_bss);
    .fragment68_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment68_BSS_START = .;
        build/asm/us/data/fragments/68/fragment68_header.o(.bss);
        build/asm/us/fragments/68/fragment68_code.o(.bss);
        fragment68_BSS_END = .;
        fragment68_BSS_SIZE = ABSOLUTE(fragment68_BSS_END - fragment68_BSS_START);
    }
    __romPos += SIZEOF(.fragment68);
    fragment68_ROM_END = __romPos;
    fragment68_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment69_ROM_START = __romPos;
    fragment69_VRAM = ADDR(.fragment69);
    .fragment69 0x8F100000 : AT(fragment69_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment69_TEXT_START = .;
        build/asm/us/data/fragments/69/fragment69_header.o(.text);
        build/asm/us/fragments/69/fragment69_code.o(.text);
        fragment69_TEXT_END = .;
        fragment69_TEXT_SIZE = ABSOLUTE(fragment69_TEXT_END - fragment69_TEXT_START);
        fragment69_DATA_START = .;
        fragments_69_fragment69_header = .;
        build/asm/us/data/fragments/69/fragment69_header.o(.data);
        fragments_69_fragment69_code = .;
        build/asm/us/fragments/69/fragment69_code.o(.data);
        fragments_69_fragment69_data_data = .;
        build/asm/us/data/fragments/69/fragment69_data.data.o(.data);
        fragment69_DATA_END = .;
        fragment69_DATA_SIZE = ABSOLUTE(fragment69_DATA_END - fragment69_DATA_START);
        fragment69_RODATA_START = .;
        build/asm/us/data/fragments/69/fragment69_header.o(.rodata);
        build/asm/us/fragments/69/fragment69_code.o(.rodata);
        fragment69_RODATA_END = .;
        fragment69_RODATA_SIZE = ABSOLUTE(fragment69_RODATA_END - fragment69_RODATA_START);
    }
    fragment69_bss_VRAM = ADDR(.fragment69_bss);
    .fragment69_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment69_BSS_START = .;
        build/asm/us/data/fragments/69/fragment69_header.o(.bss);
        build/asm/us/fragments/69/fragment69_code.o(.bss);
        fragment69_BSS_END = .;
        fragment69_BSS_SIZE = ABSOLUTE(fragment69_BSS_END - fragment69_BSS_START);
    }
    __romPos += SIZEOF(.fragment69);
    fragment69_ROM_END = __romPos;
    fragment69_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment70_ROM_START = __romPos;
    fragment70_VRAM = ADDR(.fragment70);
    .fragment70 0x8F200000 : AT(fragment70_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment70_TEXT_START = .;
        build/asm/us/data/fragments/70/fragment70_header.o(.text);
        build/asm/us/fragments/70/fragment70_code.o(.text);
        fragment70_TEXT_END = .;
        fragment70_TEXT_SIZE = ABSOLUTE(fragment70_TEXT_END - fragment70_TEXT_START);
        fragment70_DATA_START = .;
        fragments_70_fragment70_header = .;
        build/asm/us/data/fragments/70/fragment70_header.o(.data);
        fragments_70_fragment70_code = .;
        build/asm/us/fragments/70/fragment70_code.o(.data);
        fragments_70_fragment70_data_data = .;
        build/asm/us/data/fragments/70/fragment70_data.data.o(.data);
        fragment70_DATA_END = .;
        fragment70_DATA_SIZE = ABSOLUTE(fragment70_DATA_END - fragment70_DATA_START);
        fragment70_RODATA_START = .;
        build/asm/us/data/fragments/70/fragment70_header.o(.rodata);
        build/asm/us/fragments/70/fragment70_code.o(.rodata);
        fragment70_RODATA_END = .;
        fragment70_RODATA_SIZE = ABSOLUTE(fragment70_RODATA_END - fragment70_RODATA_START);
    }
    fragment70_bss_VRAM = ADDR(.fragment70_bss);
    .fragment70_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment70_BSS_START = .;
        build/asm/us/data/fragments/70/fragment70_header.o(.bss);
        build/asm/us/fragments/70/fragment70_code.o(.bss);
        fragment70_BSS_END = .;
        fragment70_BSS_SIZE = ABSOLUTE(fragment70_BSS_END - fragment70_BSS_START);
    }
    __romPos += SIZEOF(.fragment70);
    fragment70_ROM_END = __romPos;
    fragment70_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment71_ROM_START = __romPos;
    fragment71_VRAM = ADDR(.fragment71);
    .fragment71 0x8F300000 : AT(fragment71_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment71_TEXT_START = .;
        build/asm/us/data/fragments/71/fragment71_header.o(.text);
        build/asm/us/fragments/71/fragment71_code.o(.text);
        fragment71_TEXT_END = .;
        fragment71_TEXT_SIZE = ABSOLUTE(fragment71_TEXT_END - fragment71_TEXT_START);
        fragment71_DATA_START = .;
        fragments_71_fragment71_header = .;
        build/asm/us/data/fragments/71/fragment71_header.o(.data);
        fragments_71_fragment71_code = .;
        build/asm/us/fragments/71/fragment71_code.o(.data);
        fragments_71_fragment71_data_data = .;
        build/asm/us/data/fragments/71/fragment71_data.data.o(.data);
        fragment71_DATA_END = .;
        fragment71_DATA_SIZE = ABSOLUTE(fragment71_DATA_END - fragment71_DATA_START);
        fragment71_RODATA_START = .;
        build/asm/us/data/fragments/71/fragment71_header.o(.rodata);
        build/asm/us/fragments/71/fragment71_code.o(.rodata);
        fragment71_RODATA_END = .;
        fragment71_RODATA_SIZE = ABSOLUTE(fragment71_RODATA_END - fragment71_RODATA_START);
    }
    fragment71_bss_VRAM = ADDR(.fragment71_bss);
    .fragment71_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment71_BSS_START = .;
        build/asm/us/data/fragments/71/fragment71_header.o(.bss);
        build/asm/us/fragments/71/fragment71_code.o(.bss);
        fragment71_BSS_END = .;
        fragment71_BSS_SIZE = ABSOLUTE(fragment71_BSS_END - fragment71_BSS_START);
    }
    __romPos += SIZEOF(.fragment71);
    fragment71_ROM_END = __romPos;
    fragment71_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment72_ROM_START = __romPos;
    fragment72_VRAM = ADDR(.fragment72);
    .fragment72 0x8F400000 : AT(fragment72_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment72_TEXT_START = .;
        build/asm/us/data/fragments/72/fragment72_header.o(.text);
        build/asm/us/fragments/72/fragment72_code.o(.text);
        fragment72_TEXT_END = .;
        fragment72_TEXT_SIZE = ABSOLUTE(fragment72_TEXT_END - fragment72_TEXT_START);
        fragment72_DATA_START = .;
        fragments_72_fragment72_header = .;
        build/asm/us/data/fragments/72/fragment72_header.o(.data);
        fragments_72_fragment72_code = .;
        build/asm/us/fragments/72/fragment72_code.o(.data);
        fragments_72_fragment72_data_data = .;
        build/asm/us/data/fragments/72/fragment72_data.data.o(.data);
        fragment72_DATA_END = .;
        fragment72_DATA_SIZE = ABSOLUTE(fragment72_DATA_END - fragment72_DATA_START);
        fragment72_RODATA_START = .;
        build/asm/us/data/fragments/72/fragment72_header.o(.rodata);
        build/asm/us/fragments/72/fragment72_code.o(.rodata);
        fragment72_RODATA_END = .;
        fragment72_RODATA_SIZE = ABSOLUTE(fragment72_RODATA_END - fragment72_RODATA_START);
    }
    fragment72_bss_VRAM = ADDR(.fragment72_bss);
    .fragment72_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment72_BSS_START = .;
        build/asm/us/data/fragments/72/fragment72_header.o(.bss);
        build/asm/us/fragments/72/fragment72_code.o(.bss);
        fragment72_BSS_END = .;
        fragment72_BSS_SIZE = ABSOLUTE(fragment72_BSS_END - fragment72_BSS_START);
    }
    __romPos += SIZEOF(.fragment72);
    fragment72_ROM_END = __romPos;
    fragment72_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment73_ROM_START = __romPos;
    fragment73_VRAM = ADDR(.fragment73);
    .fragment73 0x8F500000 : AT(fragment73_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment73_TEXT_START = .;
        build/asm/us/data/fragments/73/fragment73_header.o(.text);
        build/asm/us/fragments/73/fragment73_code.o(.text);
        fragment73_TEXT_END = .;
        fragment73_TEXT_SIZE = ABSOLUTE(fragment73_TEXT_END - fragment73_TEXT_START);
        fragment73_DATA_START = .;
        fragments_73_fragment73_header = .;
        build/asm/us/data/fragments/73/fragment73_header.o(.data);
        fragments_73_fragment73_code = .;
        build/asm/us/fragments/73/fragment73_code.o(.data);
        fragments_73_fragment73_data_data = .;
        build/asm/us/data/fragments/73/fragment73_data.data.o(.data);
        fragment73_DATA_END = .;
        fragment73_DATA_SIZE = ABSOLUTE(fragment73_DATA_END - fragment73_DATA_START);
        fragment73_RODATA_START = .;
        build/asm/us/data/fragments/73/fragment73_header.o(.rodata);
        build/asm/us/fragments/73/fragment73_code.o(.rodata);
        fragment73_RODATA_END = .;
        fragment73_RODATA_SIZE = ABSOLUTE(fragment73_RODATA_END - fragment73_RODATA_START);
    }
    fragment73_bss_VRAM = ADDR(.fragment73_bss);
    .fragment73_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment73_BSS_START = .;
        build/asm/us/data/fragments/73/fragment73_header.o(.bss);
        build/asm/us/fragments/73/fragment73_code.o(.bss);
        fragment73_BSS_END = .;
        fragment73_BSS_SIZE = ABSOLUTE(fragment73_BSS_END - fragment73_BSS_START);
    }
    __romPos += SIZEOF(.fragment73);
    fragment73_ROM_END = __romPos;
    fragment73_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment74_ROM_START = __romPos;
    fragment74_VRAM = ADDR(.fragment74);
    .fragment74 0x8F600000 : AT(fragment74_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment74_TEXT_START = .;
        build/asm/us/data/fragments/74/fragment74_header.o(.text);
        build/asm/us/fragments/74/fragment74_code.o(.text);
        fragment74_TEXT_END = .;
        fragment74_TEXT_SIZE = ABSOLUTE(fragment74_TEXT_END - fragment74_TEXT_START);
        fragment74_DATA_START = .;
        fragments_74_fragment74_header = .;
        build/asm/us/data/fragments/74/fragment74_header.o(.data);
        fragments_74_fragment74_code = .;
        build/asm/us/fragments/74/fragment74_code.o(.data);
        fragments_74_fragment74_data_data = .;
        build/asm/us/data/fragments/74/fragment74_data.data.o(.data);
        fragment74_DATA_END = .;
        fragment74_DATA_SIZE = ABSOLUTE(fragment74_DATA_END - fragment74_DATA_START);
        fragment74_RODATA_START = .;
        build/asm/us/data/fragments/74/fragment74_header.o(.rodata);
        build/asm/us/fragments/74/fragment74_code.o(.rodata);
        fragment74_RODATA_END = .;
        fragment74_RODATA_SIZE = ABSOLUTE(fragment74_RODATA_END - fragment74_RODATA_START);
    }
    fragment74_bss_VRAM = ADDR(.fragment74_bss);
    .fragment74_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment74_BSS_START = .;
        build/asm/us/data/fragments/74/fragment74_header.o(.bss);
        build/asm/us/fragments/74/fragment74_code.o(.bss);
        fragment74_BSS_END = .;
        fragment74_BSS_SIZE = ABSOLUTE(fragment74_BSS_END - fragment74_BSS_START);
    }
    __romPos += SIZEOF(.fragment74);
    fragment74_ROM_END = __romPos;
    fragment74_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment75_ROM_START = __romPos;
    fragment75_VRAM = ADDR(.fragment75);
    .fragment75 0x8FA00000 : AT(fragment75_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment75_TEXT_START = .;
        build/asm/us/data/fragments/75/fragment75_header.o(.text);
        build/asm/us/fragments/75/fragment75_code.o(.text);
        fragment75_TEXT_END = .;
        fragment75_TEXT_SIZE = ABSOLUTE(fragment75_TEXT_END - fragment75_TEXT_START);
        fragment75_DATA_START = .;
        fragments_75_fragment75_header = .;
        build/asm/us/data/fragments/75/fragment75_header.o(.data);
        fragments_75_fragment75_code = .;
        build/asm/us/fragments/75/fragment75_code.o(.data);
        fragments_75_fragment75_data_data = .;
        build/asm/us/data/fragments/75/fragment75_data.data.o(.data);
        fragment75_DATA_END = .;
        fragment75_DATA_SIZE = ABSOLUTE(fragment75_DATA_END - fragment75_DATA_START);
        fragment75_RODATA_START = .;
        build/asm/us/data/fragments/75/fragment75_header.o(.rodata);
        build/asm/us/fragments/75/fragment75_code.o(.rodata);
        fragment75_RODATA_END = .;
        fragment75_RODATA_SIZE = ABSOLUTE(fragment75_RODATA_END - fragment75_RODATA_START);
    }
    fragment75_bss_VRAM = ADDR(.fragment75_bss);
    .fragment75_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment75_BSS_START = .;
        build/asm/us/data/fragments/75/fragment75_header.o(.bss);
        build/asm/us/fragments/75/fragment75_code.o(.bss);
        fragment75_BSS_END = .;
        fragment75_BSS_SIZE = ABSOLUTE(fragment75_BSS_END - fragment75_BSS_START);
    }
    __romPos += SIZEOF(.fragment75);
    fragment75_ROM_END = __romPos;
    fragment75_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment76_ROM_START = __romPos;
    fragment76_VRAM = ADDR(.fragment76);
    .fragment76 0x8F700000 : AT(fragment76_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment76_TEXT_START = .;
        build/asm/us/data/fragments/76/fragment76_header.o(.text);
        build/asm/us/fragments/76/fragment76_code.o(.text);
        fragment76_TEXT_END = .;
        fragment76_TEXT_SIZE = ABSOLUTE(fragment76_TEXT_END - fragment76_TEXT_START);
        fragment76_DATA_START = .;
        fragments_76_fragment76_header = .;
        build/asm/us/data/fragments/76/fragment76_header.o(.data);
        fragments_76_fragment76_code = .;
        build/asm/us/fragments/76/fragment76_code.o(.data);
        fragments_76_fragment76_data_data = .;
        build/asm/us/data/fragments/76/fragment76_data.data.o(.data);
        fragment76_DATA_END = .;
        fragment76_DATA_SIZE = ABSOLUTE(fragment76_DATA_END - fragment76_DATA_START);
        fragment76_RODATA_START = .;
        build/asm/us/data/fragments/76/fragment76_header.o(.rodata);
        build/asm/us/fragments/76/fragment76_code.o(.rodata);
        fragment76_RODATA_END = .;
        fragment76_RODATA_SIZE = ABSOLUTE(fragment76_RODATA_END - fragment76_RODATA_START);
    }
    fragment76_bss_VRAM = ADDR(.fragment76_bss);
    .fragment76_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment76_BSS_START = .;
        build/asm/us/data/fragments/76/fragment76_header.o(.bss);
        build/asm/us/fragments/76/fragment76_code.o(.bss);
        fragment76_BSS_END = .;
        fragment76_BSS_SIZE = ABSOLUTE(fragment76_BSS_END - fragment76_BSS_START);
    }
    __romPos += SIZEOF(.fragment76);
    fragment76_ROM_END = __romPos;
    fragment76_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment77_ROM_START = __romPos;
    fragment77_VRAM = ADDR(.fragment77);
    .fragment77 0x8F800000 : AT(fragment77_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment77_TEXT_START = .;
        build/asm/us/data/fragments/77/fragment77_header.o(.text);
        build/asm/us/fragments/77/fragment77_code.o(.text);
        fragment77_TEXT_END = .;
        fragment77_TEXT_SIZE = ABSOLUTE(fragment77_TEXT_END - fragment77_TEXT_START);
        fragment77_DATA_START = .;
        fragments_77_fragment77_header = .;
        build/asm/us/data/fragments/77/fragment77_header.o(.data);
        fragments_77_fragment77_code = .;
        build/asm/us/fragments/77/fragment77_code.o(.data);
        fragments_77_fragment77_data_data = .;
        build/asm/us/data/fragments/77/fragment77_data.data.o(.data);
        fragment77_DATA_END = .;
        fragment77_DATA_SIZE = ABSOLUTE(fragment77_DATA_END - fragment77_DATA_START);
        fragment77_RODATA_START = .;
        build/asm/us/data/fragments/77/fragment77_header.o(.rodata);
        build/asm/us/fragments/77/fragment77_code.o(.rodata);
        fragment77_RODATA_END = .;
        fragment77_RODATA_SIZE = ABSOLUTE(fragment77_RODATA_END - fragment77_RODATA_START);
    }
    fragment77_bss_VRAM = ADDR(.fragment77_bss);
    .fragment77_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment77_BSS_START = .;
        build/asm/us/data/fragments/77/fragment77_header.o(.bss);
        build/asm/us/fragments/77/fragment77_code.o(.bss);
        fragment77_BSS_END = .;
        fragment77_BSS_SIZE = ABSOLUTE(fragment77_BSS_END - fragment77_BSS_START);
    }
    __romPos += SIZEOF(.fragment77);
    fragment77_ROM_END = __romPos;
    fragment77_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment78_ROM_START = __romPos;
    fragment78_VRAM = ADDR(.fragment78);
    .fragment78 0x8F900000 : AT(fragment78_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment78_TEXT_START = .;
        build/asm/us/data/fragments/78/fragment78_header.o(.text);
        build/asm/us/fragments/78/fragment78_code.o(.text);
        fragment78_TEXT_END = .;
        fragment78_TEXT_SIZE = ABSOLUTE(fragment78_TEXT_END - fragment78_TEXT_START);
        fragment78_DATA_START = .;
        fragments_78_fragment78_header = .;
        build/asm/us/data/fragments/78/fragment78_header.o(.data);
        fragments_78_fragment78_code = .;
        build/asm/us/fragments/78/fragment78_code.o(.data);
        fragments_78_fragment78_data_data = .;
        build/asm/us/data/fragments/78/fragment78_data.data.o(.data);
        fragment78_DATA_END = .;
        fragment78_DATA_SIZE = ABSOLUTE(fragment78_DATA_END - fragment78_DATA_START);
        fragment78_RODATA_START = .;
        build/asm/us/data/fragments/78/fragment78_header.o(.rodata);
        build/asm/us/fragments/78/fragment78_code.o(.rodata);
        fragment78_RODATA_END = .;
        fragment78_RODATA_SIZE = ABSOLUTE(fragment78_RODATA_END - fragment78_RODATA_START);
    }
    fragment78_bss_VRAM = ADDR(.fragment78_bss);
    .fragment78_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment78_BSS_START = .;
        build/asm/us/data/fragments/78/fragment78_header.o(.bss);
        build/asm/us/fragments/78/fragment78_code.o(.bss);
        fragment78_BSS_END = .;
        fragment78_BSS_SIZE = ABSOLUTE(fragment78_BSS_END - fragment78_BSS_START);
    }
    __romPos += SIZEOF(.fragment78);
    fragment78_ROM_END = __romPos;
    fragment78_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment79_ROM_START = __romPos;
    fragment79_VRAM = ADDR(.fragment79);
    .fragment79 0x84100000 : AT(fragment79_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment79_TEXT_START = .;
        build/asm/us/data/fragments/79/fragment79_header.o(.text);
        build/asm/us/fragments/79/fragment79_36F8B0.o(.text);
        build/asm/us/fragments/79/fragment79_372DE0.o(.text);
        build/asm/us/fragments/79/fragment79_373F70.o(.text);
        build/asm/us/fragments/79/fragment79_374840.o(.text);
        build/asm/us/fragments/79/fragment79_3749B0.o(.text);
        build/asm/us/fragments/79/fragment79_375110.o(.text);
        build/asm/us/fragments/79/fragment79_375530.o(.text);
        build/asm/us/fragments/79/fragment79_377570.o(.text);
        build/asm/us/fragments/79/fragment79_377F80.o(.text);
        build/asm/us/fragments/79/fragment79_379450.o(.text);
        build/asm/us/fragments/79/fragment79_379E90.o(.text);
        build/asm/us/fragments/79/fragment79_37A6E0.o(.text);
        build/asm/us/fragments/79/fragment79_38D510.o(.text);
        build/asm/us/fragments/79/fragment79_38EBD0.o(.text);
        build/asm/us/fragments/79/fragment79_38EFA0.o(.text);
        build/asm/us/fragments/79/fragment79_38EFE0.o(.text);
        build/asm/us/fragments/79/fragment79_393B40.o(.text);
        build/asm/us/fragments/79/fragment79_393BF0.o(.text);
        build/asm/us/fragments/79/fragment79_393CA0.o(.text);
        build/asm/us/fragments/79/fragment79_3ADCA0.o(.text);
        build/asm/us/fragments/79/fragment79_3B7DB0.o(.text);
        build/asm/us/fragments/79/fragment79_3B7EA0.o(.text);
        build/asm/us/fragments/79/fragment79_3B9B80.o(.text);
        build/asm/us/fragments/79/fragment79_3BC290.o(.text);
        build/asm/us/fragments/79/fragment79_3BE6B0.o(.text);
        build/asm/us/fragments/79/fragment79_3BEAF0.o(.text);
        build/asm/us/fragments/79/fragment79_3BF4C0.o(.text);
        build/asm/us/fragments/79/fragment79_3C40B0.o(.text);
        build/asm/us/fragments/79/fragment79_3C50B0.o(.text);
        build/asm/us/fragments/79/fragment79_3C60B0.o(.text);
        build/asm/us/fragments/79/fragment79_3CB430.o(.text);
        build/asm/us/fragments/79/fragment79_3CE960.o(.text);
        build/asm/us/fragments/79/fragment79_3CFAE0.o(.text);
        build/asm/us/fragments/79/fragment79_3D0D70.o(.text);
        build/asm/us/fragments/79/fragment79_3D2C10.o(.text);
        build/asm/us/fragments/79/fragment79_3D3260.o(.text);
        build/asm/us/fragments/79/fragment79_3D4060.o(.text);
        build/asm/us/fragments/79/fragment79_3D4DA0.o(.text);
        build/asm/us/fragments/79/fragment79_3D7DD0.o(.text);
        build/asm/us/fragments/79/fragment79_3D99F0.o(.text);
        fragment79_TEXT_END = .;
        fragment79_TEXT_SIZE = ABSOLUTE(fragment79_TEXT_END - fragment79_TEXT_START);
        fragment79_DATA_START = .;
        fragments_79_fragment79_header = .;
        build/asm/us/data/fragments/79/fragment79_header.o(.data);
        fragments_79_fragment79_36F8B0 = .;
        build/asm/us/fragments/79/fragment79_36F8B0.o(.data);
        fragments_79_fragment79_372DE0 = .;
        build/asm/us/fragments/79/fragment79_372DE0.o(.data);
        fragments_79_fragment79_373F70 = .;
        build/asm/us/fragments/79/fragment79_373F70.o(.data);
        fragments_79_fragment79_374840 = .;
        build/asm/us/fragments/79/fragment79_374840.o(.data);
        fragments_79_fragment79_3749B0 = .;
        build/asm/us/fragments/79/fragment79_3749B0.o(.data);
        fragments_79_fragment79_375110 = .;
        build/asm/us/fragments/79/fragment79_375110.o(.data);
        fragments_79_fragment79_375530 = .;
        build/asm/us/fragments/79/fragment79_375530.o(.data);
        fragments_79_fragment79_377570 = .;
        build/asm/us/fragments/79/fragment79_377570.o(.data);
        fragments_79_fragment79_377F80 = .;
        build/asm/us/fragments/79/fragment79_377F80.o(.data);
        fragments_79_fragment79_379450 = .;
        build/asm/us/fragments/79/fragment79_379450.o(.data);
        fragments_79_fragment79_379E90 = .;
        build/asm/us/fragments/79/fragment79_379E90.o(.data);
        fragments_79_fragment79_37A6E0 = .;
        build/asm/us/fragments/79/fragment79_37A6E0.o(.data);
        fragments_79_fragment79_38D510 = .;
        build/asm/us/fragments/79/fragment79_38D510.o(.data);
        fragments_79_fragment79_38EBD0 = .;
        build/asm/us/fragments/79/fragment79_38EBD0.o(.data);
        fragments_79_fragment79_38EFA0 = .;
        build/asm/us/fragments/79/fragment79_38EFA0.o(.data);
        fragments_79_fragment79_38EFE0 = .;
        build/asm/us/fragments/79/fragment79_38EFE0.o(.data);
        fragments_79_fragment79_393B40 = .;
        build/asm/us/fragments/79/fragment79_393B40.o(.data);
        fragments_79_fragment79_393BF0 = .;
        build/asm/us/fragments/79/fragment79_393BF0.o(.data);
        fragments_79_fragment79_393CA0 = .;
        build/asm/us/fragments/79/fragment79_393CA0.o(.data);
        fragments_79_fragment79_3ADCA0 = .;
        build/asm/us/fragments/79/fragment79_3ADCA0.o(.data);
        fragments_79_fragment79_3B7DB0 = .;
        build/asm/us/fragments/79/fragment79_3B7DB0.o(.data);
        fragments_79_fragment79_3B7EA0 = .;
        build/asm/us/fragments/79/fragment79_3B7EA0.o(.data);
        fragments_79_fragment79_3B9B80 = .;
        build/asm/us/fragments/79/fragment79_3B9B80.o(.data);
        fragments_79_fragment79_3BC290 = .;
        build/asm/us/fragments/79/fragment79_3BC290.o(.data);
        fragments_79_fragment79_3BE6B0 = .;
        build/asm/us/fragments/79/fragment79_3BE6B0.o(.data);
        fragments_79_fragment79_3BEAF0 = .;
        build/asm/us/fragments/79/fragment79_3BEAF0.o(.data);
        fragments_79_fragment79_3BF4C0 = .;
        build/asm/us/fragments/79/fragment79_3BF4C0.o(.data);
        fragments_79_fragment79_3C40B0 = .;
        build/asm/us/fragments/79/fragment79_3C40B0.o(.data);
        fragments_79_fragment79_3C50B0 = .;
        build/asm/us/fragments/79/fragment79_3C50B0.o(.data);
        fragments_79_fragment79_3C60B0 = .;
        build/asm/us/fragments/79/fragment79_3C60B0.o(.data);
        fragments_79_fragment79_3CB430 = .;
        build/asm/us/fragments/79/fragment79_3CB430.o(.data);
        fragments_79_fragment79_3CE960 = .;
        build/asm/us/fragments/79/fragment79_3CE960.o(.data);
        fragments_79_fragment79_3CFAE0 = .;
        build/asm/us/fragments/79/fragment79_3CFAE0.o(.data);
        fragments_79_fragment79_3D0D70 = .;
        build/asm/us/fragments/79/fragment79_3D0D70.o(.data);
        fragments_79_fragment79_3D2C10 = .;
        build/asm/us/fragments/79/fragment79_3D2C10.o(.data);
        fragments_79_fragment79_3D3260 = .;
        build/asm/us/fragments/79/fragment79_3D3260.o(.data);
        fragments_79_fragment79_3D4060 = .;
        build/asm/us/fragments/79/fragment79_3D4060.o(.data);
        fragments_79_fragment79_3D4DA0 = .;
        build/asm/us/fragments/79/fragment79_3D4DA0.o(.data);
        fragments_79_fragment79_3D7DD0 = .;
        build/asm/us/fragments/79/fragment79_3D7DD0.o(.data);
        fragments_79_fragment79_3D99F0 = .;
        build/asm/us/fragments/79/fragment79_3D99F0.o(.data);
        fragments_79_fragment79_data_data = .;
        build/asm/us/data/fragments/79/fragment79_data.data.o(.data);
        fragment79_DATA_END = .;
        fragment79_DATA_SIZE = ABSOLUTE(fragment79_DATA_END - fragment79_DATA_START);
        fragment79_RODATA_START = .;
        build/asm/us/data/fragments/79/fragment79_header.o(.rodata);
        build/asm/us/fragments/79/fragment79_36F8B0.o(.rodata);
        build/asm/us/fragments/79/fragment79_372DE0.o(.rodata);
        build/asm/us/fragments/79/fragment79_373F70.o(.rodata);
        build/asm/us/fragments/79/fragment79_374840.o(.rodata);
        build/asm/us/fragments/79/fragment79_3749B0.o(.rodata);
        build/asm/us/fragments/79/fragment79_375110.o(.rodata);
        build/asm/us/fragments/79/fragment79_375530.o(.rodata);
        build/asm/us/fragments/79/fragment79_377570.o(.rodata);
        build/asm/us/fragments/79/fragment79_377F80.o(.rodata);
        build/asm/us/fragments/79/fragment79_379450.o(.rodata);
        build/asm/us/fragments/79/fragment79_379E90.o(.rodata);
        build/asm/us/fragments/79/fragment79_37A6E0.o(.rodata);
        build/asm/us/fragments/79/fragment79_38D510.o(.rodata);
        build/asm/us/fragments/79/fragment79_38EBD0.o(.rodata);
        build/asm/us/fragments/79/fragment79_38EFA0.o(.rodata);
        build/asm/us/fragments/79/fragment79_38EFE0.o(.rodata);
        build/asm/us/fragments/79/fragment79_393B40.o(.rodata);
        build/asm/us/fragments/79/fragment79_393BF0.o(.rodata);
        build/asm/us/fragments/79/fragment79_393CA0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3ADCA0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3B7DB0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3B7EA0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3B9B80.o(.rodata);
        build/asm/us/fragments/79/fragment79_3BC290.o(.rodata);
        build/asm/us/fragments/79/fragment79_3BE6B0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3BEAF0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3BF4C0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3C40B0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3C50B0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3C60B0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3CB430.o(.rodata);
        build/asm/us/fragments/79/fragment79_3CE960.o(.rodata);
        build/asm/us/fragments/79/fragment79_3CFAE0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3D0D70.o(.rodata);
        build/asm/us/fragments/79/fragment79_3D2C10.o(.rodata);
        build/asm/us/fragments/79/fragment79_3D3260.o(.rodata);
        build/asm/us/fragments/79/fragment79_3D4060.o(.rodata);
        build/asm/us/fragments/79/fragment79_3D4DA0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3D7DD0.o(.rodata);
        build/asm/us/fragments/79/fragment79_3D99F0.o(.rodata);
        fragment79_RODATA_END = .;
        fragment79_RODATA_SIZE = ABSOLUTE(fragment79_RODATA_END - fragment79_RODATA_START);
    }
    fragment79_bss_VRAM = ADDR(.fragment79_bss);
    .fragment79_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment79_BSS_START = .;
        build/asm/us/data/fragments/79/fragment79_header.o(.bss);
        build/asm/us/fragments/79/fragment79_36F8B0.o(.bss);
        build/asm/us/fragments/79/fragment79_372DE0.o(.bss);
        build/asm/us/fragments/79/fragment79_373F70.o(.bss);
        build/asm/us/fragments/79/fragment79_374840.o(.bss);
        build/asm/us/fragments/79/fragment79_3749B0.o(.bss);
        build/asm/us/fragments/79/fragment79_375110.o(.bss);
        build/asm/us/fragments/79/fragment79_375530.o(.bss);
        build/asm/us/fragments/79/fragment79_377570.o(.bss);
        build/asm/us/fragments/79/fragment79_377F80.o(.bss);
        build/asm/us/fragments/79/fragment79_379450.o(.bss);
        build/asm/us/fragments/79/fragment79_379E90.o(.bss);
        build/asm/us/fragments/79/fragment79_37A6E0.o(.bss);
        build/asm/us/fragments/79/fragment79_38D510.o(.bss);
        build/asm/us/fragments/79/fragment79_38EBD0.o(.bss);
        build/asm/us/fragments/79/fragment79_38EFA0.o(.bss);
        build/asm/us/fragments/79/fragment79_38EFE0.o(.bss);
        build/asm/us/fragments/79/fragment79_393B40.o(.bss);
        build/asm/us/fragments/79/fragment79_393BF0.o(.bss);
        build/asm/us/fragments/79/fragment79_393CA0.o(.bss);
        build/asm/us/fragments/79/fragment79_3ADCA0.o(.bss);
        build/asm/us/fragments/79/fragment79_3B7DB0.o(.bss);
        build/asm/us/fragments/79/fragment79_3B7EA0.o(.bss);
        build/asm/us/fragments/79/fragment79_3B9B80.o(.bss);
        build/asm/us/fragments/79/fragment79_3BC290.o(.bss);
        build/asm/us/fragments/79/fragment79_3BE6B0.o(.bss);
        build/asm/us/fragments/79/fragment79_3BEAF0.o(.bss);
        build/asm/us/fragments/79/fragment79_3BF4C0.o(.bss);
        build/asm/us/fragments/79/fragment79_3C40B0.o(.bss);
        build/asm/us/fragments/79/fragment79_3C50B0.o(.bss);
        build/asm/us/fragments/79/fragment79_3C60B0.o(.bss);
        build/asm/us/fragments/79/fragment79_3CB430.o(.bss);
        build/asm/us/fragments/79/fragment79_3CE960.o(.bss);
        build/asm/us/fragments/79/fragment79_3CFAE0.o(.bss);
        build/asm/us/fragments/79/fragment79_3D0D70.o(.bss);
        build/asm/us/fragments/79/fragment79_3D2C10.o(.bss);
        build/asm/us/fragments/79/fragment79_3D3260.o(.bss);
        build/asm/us/fragments/79/fragment79_3D4060.o(.bss);
        build/asm/us/fragments/79/fragment79_3D4DA0.o(.bss);
        build/asm/us/fragments/79/fragment79_3D7DD0.o(.bss);
        build/asm/us/fragments/79/fragment79_3D99F0.o(.bss);
        fragment79_BSS_END = .;
        fragment79_BSS_SIZE = ABSOLUTE(fragment79_BSS_END - fragment79_BSS_START);
    }
    __romPos += SIZEOF(.fragment79);
    fragment79_ROM_END = __romPos;
    fragment79_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment80_ROM_START = __romPos;
    fragment80_VRAM = ADDR(.fragment80);
    .fragment80 0x84200000 : AT(fragment80_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment80_TEXT_START = .;
        build/asm/us/data/fragments/80/fragment80_header.o(.text);
        build/asm/us/fragments/80/fragment80_4194A0.o(.text);
        build/asm/us/fragments/80/fragment80_41A5F0.o(.text);
        build/asm/us/fragments/80/fragment80_41AC50.o(.text);
        build/asm/us/fragments/80/fragment80_41C930.o(.text);
        fragment80_TEXT_END = .;
        fragment80_TEXT_SIZE = ABSOLUTE(fragment80_TEXT_END - fragment80_TEXT_START);
        fragment80_DATA_START = .;
        fragments_80_fragment80_header = .;
        build/asm/us/data/fragments/80/fragment80_header.o(.data);
        fragments_80_fragment80_4194A0 = .;
        build/asm/us/fragments/80/fragment80_4194A0.o(.data);
        fragments_80_fragment80_41A5F0 = .;
        build/asm/us/fragments/80/fragment80_41A5F0.o(.data);
        fragments_80_fragment80_41AC50 = .;
        build/asm/us/fragments/80/fragment80_41AC50.o(.data);
        fragments_80_fragment80_41C930 = .;
        build/asm/us/fragments/80/fragment80_41C930.o(.data);
        fragments_80_fragment80_data_data = .;
        build/asm/us/data/fragments/80/fragment80_data.data.o(.data);
        fragment80_DATA_END = .;
        fragment80_DATA_SIZE = ABSOLUTE(fragment80_DATA_END - fragment80_DATA_START);
        fragment80_RODATA_START = .;
        build/asm/us/data/fragments/80/fragment80_header.o(.rodata);
        build/asm/us/fragments/80/fragment80_4194A0.o(.rodata);
        build/asm/us/fragments/80/fragment80_41A5F0.o(.rodata);
        build/asm/us/fragments/80/fragment80_41AC50.o(.rodata);
        build/asm/us/fragments/80/fragment80_41C930.o(.rodata);
        fragment80_RODATA_END = .;
        fragment80_RODATA_SIZE = ABSOLUTE(fragment80_RODATA_END - fragment80_RODATA_START);
    }
    fragment80_bss_VRAM = ADDR(.fragment80_bss);
    .fragment80_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment80_BSS_START = .;
        build/asm/us/data/fragments/80/fragment80_header.o(.bss);
        build/asm/us/fragments/80/fragment80_4194A0.o(.bss);
        build/asm/us/fragments/80/fragment80_41A5F0.o(.bss);
        build/asm/us/fragments/80/fragment80_41AC50.o(.bss);
        build/asm/us/fragments/80/fragment80_41C930.o(.bss);
        fragment80_BSS_END = .;
        fragment80_BSS_SIZE = ABSOLUTE(fragment80_BSS_END - fragment80_BSS_START);
    }
    __romPos += SIZEOF(.fragment80);
    fragment80_ROM_END = __romPos;
    fragment80_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment81_ROM_START = __romPos;
    fragment81_VRAM = ADDR(.fragment81);
    .fragment81 0x84300000 : AT(fragment81_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment81_TEXT_START = .;
        build/asm/us/data/fragments/81/fragment81_header.o(.text);
        build/asm/us/fragments/81/fragment81_code.o(.text);
        fragment81_TEXT_END = .;
        fragment81_TEXT_SIZE = ABSOLUTE(fragment81_TEXT_END - fragment81_TEXT_START);
        fragment81_DATA_START = .;
        fragments_81_fragment81_header = .;
        build/asm/us/data/fragments/81/fragment81_header.o(.data);
        fragments_81_fragment81_code = .;
        build/asm/us/fragments/81/fragment81_code.o(.data);
        fragments_81_fragment81_data_data = .;
        build/asm/us/data/fragments/81/fragment81_data.data.o(.data);
        fragment81_DATA_END = .;
        fragment81_DATA_SIZE = ABSOLUTE(fragment81_DATA_END - fragment81_DATA_START);
        fragment81_RODATA_START = .;
        build/asm/us/data/fragments/81/fragment81_header.o(.rodata);
        build/asm/us/fragments/81/fragment81_code.o(.rodata);
        fragment81_RODATA_END = .;
        fragment81_RODATA_SIZE = ABSOLUTE(fragment81_RODATA_END - fragment81_RODATA_START);
    }
    fragment81_bss_VRAM = ADDR(.fragment81_bss);
    .fragment81_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment81_BSS_START = .;
        build/asm/us/data/fragments/81/fragment81_header.o(.bss);
        build/asm/us/fragments/81/fragment81_code.o(.bss);
        fragment81_BSS_END = .;
        fragment81_BSS_SIZE = ABSOLUTE(fragment81_BSS_END - fragment81_BSS_START);
    }
    __romPos += SIZEOF(.fragment81);
    fragment81_ROM_END = __romPos;
    fragment81_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment82_ROM_START = __romPos;
    fragment82_VRAM = ADDR(.fragment82);
    .fragment82 0x82D00000 : AT(fragment82_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment82_TEXT_START = .;
        build/asm/us/data/fragments/82/fragment82_header.o(.text);
        build/asm/us/fragments/82/fragment82_420EA0.o(.text);
        build/asm/us/fragments/82/fragment82_4238F0.o(.text);
        fragment82_TEXT_END = .;
        fragment82_TEXT_SIZE = ABSOLUTE(fragment82_TEXT_END - fragment82_TEXT_START);
        fragment82_DATA_START = .;
        fragments_82_fragment82_header = .;
        build/asm/us/data/fragments/82/fragment82_header.o(.data);
        fragments_82_fragment82_420EA0 = .;
        build/asm/us/fragments/82/fragment82_420EA0.o(.data);
        fragments_82_fragment82_4238F0 = .;
        build/asm/us/fragments/82/fragment82_4238F0.o(.data);
        fragments_82_fragment82_data_data = .;
        build/asm/us/data/fragments/82/fragment82_data.data.o(.data);
        fragment82_DATA_END = .;
        fragment82_DATA_SIZE = ABSOLUTE(fragment82_DATA_END - fragment82_DATA_START);
        fragment82_RODATA_START = .;
        build/asm/us/data/fragments/82/fragment82_header.o(.rodata);
        build/asm/us/fragments/82/fragment82_420EA0.o(.rodata);
        build/asm/us/fragments/82/fragment82_4238F0.o(.rodata);
        fragment82_RODATA_END = .;
        fragment82_RODATA_SIZE = ABSOLUTE(fragment82_RODATA_END - fragment82_RODATA_START);
    }
    fragment82_bss_VRAM = ADDR(.fragment82_bss);
    .fragment82_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment82_BSS_START = .;
        build/asm/us/data/fragments/82/fragment82_header.o(.bss);
        build/asm/us/fragments/82/fragment82_420EA0.o(.bss);
        build/asm/us/fragments/82/fragment82_4238F0.o(.bss);
        fragment82_BSS_END = .;
        fragment82_BSS_SIZE = ABSOLUTE(fragment82_BSS_END - fragment82_BSS_START);
    }
    __romPos += SIZEOF(.fragment82);
    fragment82_ROM_END = __romPos;
    fragment82_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment83_ROM_START = __romPos;
    fragment83_VRAM = ADDR(.fragment83);
    .fragment83 0x82C00000 : AT(fragment83_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment83_TEXT_START = .;
        build/asm/us/data/fragments/83/fragment83_header.o(.text);
        build/asm/us/fragments/83/fragment83_code.o(.text);
        fragment83_TEXT_END = .;
        fragment83_TEXT_SIZE = ABSOLUTE(fragment83_TEXT_END - fragment83_TEXT_START);
        fragment83_DATA_START = .;
        fragments_83_fragment83_header = .;
        build/asm/us/data/fragments/83/fragment83_header.o(.data);
        fragments_83_fragment83_code = .;
        build/asm/us/fragments/83/fragment83_code.o(.data);
        fragments_83_fragment83_data_data = .;
        build/asm/us/data/fragments/83/fragment83_data.data.o(.data);
        fragment83_DATA_END = .;
        fragment83_DATA_SIZE = ABSOLUTE(fragment83_DATA_END - fragment83_DATA_START);
        fragment83_RODATA_START = .;
        build/asm/us/data/fragments/83/fragment83_header.o(.rodata);
        build/asm/us/fragments/83/fragment83_code.o(.rodata);
        fragment83_RODATA_END = .;
        fragment83_RODATA_SIZE = ABSOLUTE(fragment83_RODATA_END - fragment83_RODATA_START);
    }
    fragment83_bss_VRAM = ADDR(.fragment83_bss);
    .fragment83_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment83_BSS_START = .;
        build/asm/us/data/fragments/83/fragment83_header.o(.bss);
        build/asm/us/fragments/83/fragment83_code.o(.bss);
        fragment83_BSS_END = .;
        fragment83_BSS_SIZE = ABSOLUTE(fragment83_BSS_END - fragment83_BSS_START);
    }
    __romPos += SIZEOF(.fragment83);
    fragment83_ROM_END = __romPos;
    fragment83_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment84_ROM_START = __romPos;
    fragment84_VRAM = ADDR(.fragment84);
    .fragment84 0x8FC00000 : AT(fragment84_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment84_TEXT_START = .;
        build/asm/us/data/fragments/84/fragment84_header.o(.text);
        build/asm/us/fragments/84/fragment84_code.o(.text);
        fragment84_TEXT_END = .;
        fragment84_TEXT_SIZE = ABSOLUTE(fragment84_TEXT_END - fragment84_TEXT_START);
        fragment84_DATA_START = .;
        fragments_84_fragment84_header = .;
        build/asm/us/data/fragments/84/fragment84_header.o(.data);
        fragments_84_fragment84_code = .;
        build/asm/us/fragments/84/fragment84_code.o(.data);
        fragments_84_fragment84_data_data = .;
        build/asm/us/data/fragments/84/fragment84_data.data.o(.data);
        fragment84_DATA_END = .;
        fragment84_DATA_SIZE = ABSOLUTE(fragment84_DATA_END - fragment84_DATA_START);
        fragment84_RODATA_START = .;
        build/asm/us/data/fragments/84/fragment84_header.o(.rodata);
        build/asm/us/fragments/84/fragment84_code.o(.rodata);
        fragment84_RODATA_END = .;
        fragment84_RODATA_SIZE = ABSOLUTE(fragment84_RODATA_END - fragment84_RODATA_START);
    }
    fragment84_bss_VRAM = ADDR(.fragment84_bss);
    .fragment84_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment84_BSS_START = .;
        build/asm/us/data/fragments/84/fragment84_header.o(.bss);
        build/asm/us/fragments/84/fragment84_code.o(.bss);
        fragment84_BSS_END = .;
        fragment84_BSS_SIZE = ABSOLUTE(fragment84_BSS_END - fragment84_BSS_START);
    }
    __romPos += SIZEOF(.fragment84);
    fragment84_ROM_END = __romPos;
    fragment84_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment85_ROM_START = __romPos;
    fragment85_VRAM = ADDR(.fragment85);
    .fragment85 0x8FD00000 : AT(fragment85_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment85_TEXT_START = .;
        build/asm/us/data/fragments/85/fragment85_header.o(.text);
        build/asm/us/fragments/85/fragment85_code.o(.text);
        fragment85_TEXT_END = .;
        fragment85_TEXT_SIZE = ABSOLUTE(fragment85_TEXT_END - fragment85_TEXT_START);
        fragment85_DATA_START = .;
        fragments_85_fragment85_header = .;
        build/asm/us/data/fragments/85/fragment85_header.o(.data);
        fragments_85_fragment85_code = .;
        build/asm/us/fragments/85/fragment85_code.o(.data);
        fragments_85_fragment85_data_data = .;
        build/asm/us/data/fragments/85/fragment85_data.data.o(.data);
        fragment85_DATA_END = .;
        fragment85_DATA_SIZE = ABSOLUTE(fragment85_DATA_END - fragment85_DATA_START);
        fragment85_RODATA_START = .;
        build/asm/us/data/fragments/85/fragment85_header.o(.rodata);
        build/asm/us/fragments/85/fragment85_code.o(.rodata);
        fragment85_RODATA_END = .;
        fragment85_RODATA_SIZE = ABSOLUTE(fragment85_RODATA_END - fragment85_RODATA_START);
    }
    fragment85_bss_VRAM = ADDR(.fragment85_bss);
    .fragment85_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment85_BSS_START = .;
        build/asm/us/data/fragments/85/fragment85_header.o(.bss);
        build/asm/us/fragments/85/fragment85_code.o(.bss);
        fragment85_BSS_END = .;
        fragment85_BSS_SIZE = ABSOLUTE(fragment85_BSS_END - fragment85_BSS_START);
    }
    __romPos += SIZEOF(.fragment85);
    fragment85_ROM_END = __romPos;
    fragment85_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment86_ROM_START = __romPos;
    fragment86_VRAM = ADDR(.fragment86);
    .fragment86 0x84400000 : AT(fragment86_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment86_TEXT_START = .;
        build/asm/us/data/fragments/86/fragment86_header.o(.text);
        build/asm/us/fragments/86/fragment86_code.o(.text);
        fragment86_TEXT_END = .;
        fragment86_TEXT_SIZE = ABSOLUTE(fragment86_TEXT_END - fragment86_TEXT_START);
        fragment86_DATA_START = .;
        fragments_86_fragment86_header = .;
        build/asm/us/data/fragments/86/fragment86_header.o(.data);
        fragments_86_fragment86_code = .;
        build/asm/us/fragments/86/fragment86_code.o(.data);
        fragments_86_fragment86_data_data = .;
        build/asm/us/data/fragments/86/fragment86_data.data.o(.data);
        fragment86_DATA_END = .;
        fragment86_DATA_SIZE = ABSOLUTE(fragment86_DATA_END - fragment86_DATA_START);
        fragment86_RODATA_START = .;
        build/asm/us/data/fragments/86/fragment86_header.o(.rodata);
        build/asm/us/fragments/86/fragment86_code.o(.rodata);
        fragment86_RODATA_END = .;
        fragment86_RODATA_SIZE = ABSOLUTE(fragment86_RODATA_END - fragment86_RODATA_START);
    }
    fragment86_bss_VRAM = ADDR(.fragment86_bss);
    .fragment86_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment86_BSS_START = .;
        build/asm/us/data/fragments/86/fragment86_header.o(.bss);
        build/asm/us/fragments/86/fragment86_code.o(.bss);
        fragment86_BSS_END = .;
        fragment86_BSS_SIZE = ABSOLUTE(fragment86_BSS_END - fragment86_BSS_START);
    }
    __romPos += SIZEOF(.fragment86);
    fragment86_ROM_END = __romPos;
    fragment86_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment87_ROM_START = __romPos;
    fragment87_VRAM = ADDR(.fragment87);
    .fragment87 0x81B00000 : AT(fragment87_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment87_TEXT_START = .;
        build/asm/us/data/fragments/87/fragment87_header.o(.text);
        build/asm/us/fragments/87/fragment87_code.o(.text);
        fragment87_TEXT_END = .;
        fragment87_TEXT_SIZE = ABSOLUTE(fragment87_TEXT_END - fragment87_TEXT_START);
        fragment87_DATA_START = .;
        fragments_87_fragment87_header = .;
        build/asm/us/data/fragments/87/fragment87_header.o(.data);
        fragments_87_fragment87_code = .;
        build/asm/us/fragments/87/fragment87_code.o(.data);
        fragments_87_fragment87_data_data = .;
        build/asm/us/data/fragments/87/fragment87_data.data.o(.data);
        fragment87_DATA_END = .;
        fragment87_DATA_SIZE = ABSOLUTE(fragment87_DATA_END - fragment87_DATA_START);
        fragment87_RODATA_START = .;
        build/asm/us/data/fragments/87/fragment87_header.o(.rodata);
        build/asm/us/fragments/87/fragment87_code.o(.rodata);
        fragment87_RODATA_END = .;
        fragment87_RODATA_SIZE = ABSOLUTE(fragment87_RODATA_END - fragment87_RODATA_START);
    }
    fragment87_bss_VRAM = ADDR(.fragment87_bss);
    .fragment87_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment87_BSS_START = .;
        build/asm/us/data/fragments/87/fragment87_header.o(.bss);
        build/asm/us/fragments/87/fragment87_code.o(.bss);
        fragment87_BSS_END = .;
        fragment87_BSS_SIZE = ABSOLUTE(fragment87_BSS_END - fragment87_BSS_START);
    }
    __romPos += SIZEOF(.fragment87);
    fragment87_ROM_END = __romPos;
    fragment87_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment88_ROM_START = __romPos;
    fragment88_VRAM = ADDR(.fragment88);
    .fragment88 0x81C00000 : AT(fragment88_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment88_TEXT_START = .;
        build/asm/us/data/fragments/88/fragment88_header.o(.text);
        build/asm/us/fragments/88/fragment88_code.o(.text);
        fragment88_TEXT_END = .;
        fragment88_TEXT_SIZE = ABSOLUTE(fragment88_TEXT_END - fragment88_TEXT_START);
        fragment88_DATA_START = .;
        fragments_88_fragment88_header = .;
        build/asm/us/data/fragments/88/fragment88_header.o(.data);
        fragments_88_fragment88_code = .;
        build/asm/us/fragments/88/fragment88_code.o(.data);
        fragments_88_fragment88_data_data = .;
        build/asm/us/data/fragments/88/fragment88_data.data.o(.data);
        fragment88_DATA_END = .;
        fragment88_DATA_SIZE = ABSOLUTE(fragment88_DATA_END - fragment88_DATA_START);
        fragment88_RODATA_START = .;
        build/asm/us/data/fragments/88/fragment88_header.o(.rodata);
        build/asm/us/fragments/88/fragment88_code.o(.rodata);
        fragment88_RODATA_END = .;
        fragment88_RODATA_SIZE = ABSOLUTE(fragment88_RODATA_END - fragment88_RODATA_START);
    }
    fragment88_bss_VRAM = ADDR(.fragment88_bss);
    .fragment88_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment88_BSS_START = .;
        build/asm/us/data/fragments/88/fragment88_header.o(.bss);
        build/asm/us/fragments/88/fragment88_code.o(.bss);
        fragment88_BSS_END = .;
        fragment88_BSS_SIZE = ABSOLUTE(fragment88_BSS_END - fragment88_BSS_START);
    }
    __romPos += SIZEOF(.fragment88);
    fragment88_ROM_END = __romPos;
    fragment88_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    _437610_ROM_START = __romPos;
    _437610_VRAM = ADDR(._437610);
    ._437610 : AT(_437610_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        _437610_DATA_START = .;
        _437610 = .;
        build/assets/us/437610.o(.data);
        _437610_DATA_END = .;
        _437610_DATA_SIZE = ABSOLUTE(_437610_DATA_END - _437610_DATA_START);
    }
    __romPos += SIZEOF(._437610);
    _437610_ROM_END = __romPos;
    _437610_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
