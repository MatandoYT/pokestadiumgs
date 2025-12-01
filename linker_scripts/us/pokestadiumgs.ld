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
        build/src/main.o(.text);
        build/src/dp_intro.o(.text);
        build/src/2CA0.o(.text);
        build/src/3280.o(.text);
        build/src/3A00.o(.text);
        build/src/3E40.o(.text);
        build/src/4420.o(.text);
        build/src/57C0.o(.text);
        build/src/62E0.o(.text);
        build/src/6670.o(.text);
        build/src/7140.o(.text);
        build/src/78D0.o(.text);
        build/src/7A50.o(.text);
        build/src/8470.o(.text);
        build/src/95C0.o(.text);
        build/src/9E00.o(.text);
        build/src/AC80.o(.text);
        build/src/BF50.o(.text);
        build/src/C180.o(.text);
        build/src/C290.o(.text);
        build/src/C2A0.o(.text);
        build/src/C2C0.o(.text);
        build/src/C380.o(.text);
        build/src/C890.o(.text);
        build/src/CE80.o(.text);
        build/src/10BB0.o(.text);
        build/src/14640.o(.text);
        build/src/1A140.o(.text);
        build/src/1A360.o(.text);
        build/src/1C2D0.o(.text);
        build/src/1CDC0.o(.text);
        build/src/20860.o(.text);
        build/src/208A0.o(.text);
        build/src/20C50.o(.text);
        build/src/unk_220C0.o(.text);
        build/src/226C0.o(.text);
        build/src/229E0.o(.text);
        build/src/43700.o(.text);
        build/src/44300.o(.text);
        build/src/44E70.o(.text);
        build/src/47580.o(.text);
        build/src/4AAD0.o(.text);
        build/src/4AC10.o(.text);
        build/src/4C2E0.o(.text);
        build/src/4CC20.o(.text);
        build/src/4EE50.o(.text);
        build/src/4F800.o(.text);
        build/src/517E0.o(.text);
        build/src/56F90.o(.text);
        build/src/585D0.o(.text);
        build/src/615D0.o(.text);
        build/src/638E0.o(.text);
        build/src/63CF0.o(.text);
        build/src/641E0.o(.text);
        build/src/654A0.o(.text);
        build/src/65820.o(.text);
        build/src/65E20.o(.text);
        build/src/667B0.o(.text);
        build/src/66990.o(.text);
        build/src/66B50.o(.text);
        build/src/66DF0.o(.text);
        build/src/672F0.o(.text);
        build/src/674C0.o(.text);
        build/src/674D0.o(.text);
        build/src/67F00.o(.text);
        build/src/68F90.o(.text);
        build/src/69650.o(.text);
        build/src/69F70.o(.text);
        build/src/6AA10.o(.text);
        build/src/6AA80.o(.text);
        build/src/6DDA0.o(.text);
        build/src/6DEC0.o(.text);
        build/src/6E850.o(.text);
        build/src/71E10.o(.text);
        build/src/72540.o(.text);
        build/src/72720.o(.text);
        build/src/728D0.o(.text);
        build/src/72C30.o(.text);
        build/src/73C80.o(.text);
        build/src/74020.o(.text);
        build/lib/libultra.a:sendmesg.o(.text);
        build/lib/libultra.a:stopthread.o(.text);
        build/lib/libultra.a:recvmesg.o(.text);
        build/lib/libultra.a:setintmask.o(.text);
        build/lib/libultra.a:scale.o(.text);
        build/lib/libultra.a:sinf.o(.text);
        build/lib/libultra.a:sptask.o(.text);
        build/lib/libultra.a:destroythread.o(.text);
        build/lib/libultra.a:ll.o(.text);
        build/lib/libultra.a:exceptasm.o(.text);
        build/lib/libultra.a:thread.o(.text);
        . += 0x10;
        build/lib/libultra.a:scalef.o(.text);
        build/lib/libultra.a:bzero.o(.text);
        build/lib/libultra.a:gbpakcheckconnector.o(.text);
        build/lib/libultra.a:gbpakpower.o(.text);
        build/lib/libultra.a:controller.o(.text);
        build/lib/libultra.a:siacs.o(.text);
        build/lib/libultra.a:flashsectorerase.o(.text);
        build/lib/libultra.a:initialize.o(.text);
        build/lib/libultra.a:initialize_emu.o(.text);
        build/lib/libultra.a:initialize_msp.o(.text);
        build/lib/libultra.a:initialize_isv.o(.text);
        build/lib/libultra.a:piread.o(.text);
        build/lib/libultra.a:piacs.o(.text);
        . += 0x60;
        build/lib/libultra.a:createthread.o(.text);
        build/lib/libultra.a:initrdb.o(.text);
        build/lib/libultra.a:contreaddata.o(.text);
        build/lib/libultra.a:conteeplongread.o(.text);
        build/lib/libultra.a:virtualtophysical.o(.text);
        build/lib/libultra.a:setsr.o(.text);
        build/lib/libultra.a:getsr.o(.text);
        build/lib/libultra.a:writebackdcache.o(.text);
        build/lib/libultra.a:gbpakinit.o(.text);
        build/lib/libultra.a:pfsgetstatus.o(.text);
        build/lib/libultra.a:perspective.o(.text);
        build/lib/libultra.a:sprawdma.o(.text);
        build/lib/libultra.a:sirawdma.o(.text);
        build/lib/libultra.a:epilinkhandle.o(.text);
        build/lib/libultra.a:kdebugserver.o(.text);
        build/lib/libultra.a:viblack.o(.text);
        build/lib/libultra.a:sirawread.o(.text);
        build/lib/libultra.a:pirawread.o(.text);
        build/lib/libultra.a:sptaskyield.o(.text);
        build/lib/libultra.a:lookatref.o(.text);
        build/lib/libultra.a:mtxidentf.o(.text);
        build/lib/libultra.a:readhost.o(.text);
        build/lib/libultra.a:visetmode.o(.text);
        build/lib/libultra.a:virepeatline.o(.text);
        build/lib/libultra.a:threadprofile.o(.text);
        build/lib/libultra.a:monutil.o(.text);
        build/lib/libultra.a:flashinit.o(.text);
        build/lib/libultra.a:flashreadid.o(.text);
        build/lib/libultra.a:pfsisplug.o(.text);
        build/lib/libultra.a:probetlb.o(.text);
        build/lib/libultra.a:pimgr.o(.text);
        build/lib/libultra.a:devmgr.o(.text);
        build/lib/libultra.a:pirawdma.o(.text);
        build/lib/libultra.a:getcount.o(.text);
        build/lib/libultra.a:conteepprobe.o(.text);
        build/lib/libultra.a:conteepwrite.o(.text);
        build/lib/libultra.a:conteepread.o(.text);
        build/lib/libultra.a:flashreadstatus.o(.text);
        build/lib/libultra.a:getmemsize.o(.text);
        build/lib/libultra.a:contpfs.o(.text);
        build/lib/libultra.a:seteventmesg.o(.text);
        build/lib/libultra.a:sqrtf.o(.text);
        build/lib/libultra.a:afterprenmi.o(.text);
        build/lib/libultra.a:mtxxfmf.o(.text);
        build/lib/libultra.a:random.o(.text);
        build/lib/libultra.a:xprintf.o(.text);
        build/lib/libultra.a:gbpakgetstatus.o(.text);
        build/lib/libultra.a:sprintf.o(.text);
        build/lib/libultra.a:unmaptlball.o(.text);
        build/lib/libultra.a:epidma.o(.text);
        build/lib/libultra.a:syncprintf.o(.text);
        build/lib/libultra.a:string.o(.text);
        build/lib/libultra.a:createmesgqueue.o(.text);
        build/lib/libultra.a:invaldcache.o(.text);
        build/lib/libultra.a:invalicache.o(.text);
        build/lib/libultra.a:rmonsio.o(.text);
        build/lib/libultra.a:initialize_kmc.o(.text);
        build/lib/libultra.a:conteeplongwrite.o(.text);
        build/lib/libultra.a:sp.o(.text);
        build/lib/libultra.a:si.o(.text);
        . += 0x10;
        build/lib/libultra.a:translatef.o(.text);
        build/lib/libultra.a:jammesg.o(.text);
        build/lib/libultra.a:setthreadpri.o(.text);
        build/lib/libultra.a:getthreadpri.o(.text);
        build/lib/libultra.a:epirawread.o(.text);
        build/lib/libultra.a:viswapbuf.o(.text);
        . += 0x10;
        build/lib/libultra.a:mtxcatf.o(.text);
        build/lib/libultra.a:mtxcatl.o(.text);
        . += 0x10;
        build/lib/libultra.a:mtxl2f.o(.text);
        build/lib/libultra.a:epirawdma.o(.text);
        build/lib/libultra.a:sptaskyielded.o(.text);
        build/lib/libultra.a:rotaterpy.o(.text);
        build/lib/libultra.a:bcmp.o(.text);
        build/lib/libultra.a:gettime.o(.text);
        build/lib/libultra.a:timerintr.o(.text);
        build/lib/libultra.a:rotate.o(.text);
        build/lib/libultra.a:setglobalintmask.o(.text);
        build/lib/libultra.a:aisetfreq.o(.text);
        build/lib/libultra.a:dpctr.o(.text);
        build/lib/libultra.a:getactivequeue.o(.text);
        . += 0x10;
        build/lib/libultra.a:normalize.o(.text);
        build/lib/libultra.a:setcompare.o(.text);
        build/lib/libultra.a:aigetstat.o(.text);
        build/lib/libultra.a:dpsetstat.o(.text);
        build/lib/libultra.a:bcopy.o(.text);
        build/lib/libultra.a:resetglobalintmask.o(.text);
        build/lib/libultra.a:ortho.o(.text);
        build/lib/libultra.a:interrupt.o(.text);
        build/lib/libultra.a:vi.o(.text);
        build/lib/libultra.a:viswapcontext.o(.text);
        build/lib/libultra.a:pigetcmdq.o(.text);
        build/lib/libultra.a:cosf.o(.text);
        build/lib/libultra.a:epiread.o(.text);
        build/lib/libultra.a:visetspecial.o(.text);
        build/lib/libultra.a:flashwritearray.o(.text);
        build/lib/libultra.a:settime.o(.text);
        build/lib/libultra.a:flashclearstatus.o(.text);
        build/lib/libultra.a:visetevent.o(.text);
        build/lib/libultra.a:rdbsend.o(.text);
        build/lib/libultra.a:flashwritebuffer.o(.text);
        build/lib/libultra.a:cartrominit.o(.text);
        build/lib/libultra.a:gbpakreadid.o(.text);
        build/lib/libultra.a:rmoncmds.o(.text);
        build/lib/libultra.a:rmonmem.o(.text);
        . += 0x10;
        build/lib/libultra.a:rmonmain.o(.text);
        build/lib/libultra.a:rmontask.o(.text);
        . += 0x10;
        build/lib/libultra.a:rmonmisc.o(.text);
        build/lib/libultra.a:rmonrcp.o(.text);
        build/lib/libultra.a:rmonbrk.o(.text);
        build/lib/libultra.a:sprawread.o(.text);
        build/lib/libultra.a:rmonregs.o(.text);
        build/lib/libultra.a:pfsselectbank.o(.text);
        build/lib/libultra.a:setfpccsr.o(.text);
        build/lib/libultra.a:aigetlen.o(.text);
        build/lib/libultra.a:epiwrite.o(.text);
        build/lib/libultra.a:piwrite.o(.text);
        build/lib/libultra.a:maptlbrdb.o(.text);
        build/lib/libultra.a:yieldthread.o(.text);
        build/lib/libultra.a:translate.o(.text);
        build/lib/libultra.a:contramwrite.o(.text);
        build/lib/libultra.a:contramread.o(.text);
        build/lib/libultra.a:crc.o(.text);
        build/lib/libultra.a:getcause.o(.text);
        build/lib/libultra.a:epirawwrite.o(.text);
        build/lib/libultra.a:settimer.o(.text);
        build/lib/libultra.a:xldtob.o(.text);
        build/lib/libultra.a:ldiv.o(.text);
        build/lib/libultra.a:xlitob.o(.text);
        build/lib/libultra.a:sirawwrite.o(.text);
        build/lib/libultra.a:pirawwrite.o(.text);
        build/lib/libultra.a:sprawwrite.o(.text);
        build/lib/libultra.a:spsetstat.o(.text);
        build/lib/libultra.a:spgetstat.o(.text);
        . += 0x10;
        build/lib/libultra.a:vimgr.o(.text);
        build/lib/libultra.a:vigetcurrcontext.o(.text);
        build/lib/libultra.a:writebackdcacheall.o(.text);
        . += 0x10;
        build/lib/libultra.a:mtxf2l.o(.text);
        build/lib/libultra.a:startthread.o(.text);
        build/lib/libultra.a:visetxscale.o(.text);
        build/lib/libultra.a:visetyscale.o(.text);
        build/lib/libultra.a:llcvt.o(.text);
        build/lib/libultra.a:gbpakreadwrite.o(.text);
        build/lib/libultra.a:gbpaksetbank.o(.text);
        build/lib/libultra.a:vigetcurrframebuf.o(.text);
        build/lib/libultra.a:spsetpc.o(.text);
        build/lib/libultra.a:flashreadarray.o(.text);
        build/lib/libultra.a:flashgetaddr.o(.text);
        build/lib/libultra.a:setwatchlo.o(.text);
        text_TEXT_END = .;
        text_TEXT_SIZE = ABSOLUTE(text_TEXT_END - text_TEXT_START);
        text_DATA_START = .;
        entry = .;
        build/asm/us/entry.o(.data);
        pre_main = .;
        build/asm/us/pre_main.o(.data);
        main = .;
        build/src/main.o(.data);
        dp_intro = .;
        build/src/dp_intro.o(.data);
        _2CA0 = .;
        build/src/2CA0.o(.data);
        _3280 = .;
        build/src/3280.o(.data);
        _3A00 = .;
        build/src/3A00.o(.data);
        _3E40 = .;
        build/src/3E40.o(.data);
        _4420 = .;
        build/src/4420.o(.data);
        _57C0 = .;
        build/src/57C0.o(.data);
        _62E0 = .;
        build/src/62E0.o(.data);
        _6670 = .;
        build/src/6670.o(.data);
        _7140 = .;
        build/src/7140.o(.data);
        _78D0 = .;
        build/src/78D0.o(.data);
        _7A50 = .;
        build/src/7A50.o(.data);
        _8470 = .;
        build/src/8470.o(.data);
        _95C0 = .;
        build/src/95C0.o(.data);
        _9E00 = .;
        build/src/9E00.o(.data);
        AC80 = .;
        build/src/AC80.o(.data);
        BF50 = .;
        build/src/BF50.o(.data);
        C180 = .;
        build/src/C180.o(.data);
        C290 = .;
        build/src/C290.o(.data);
        C2A0 = .;
        build/src/C2A0.o(.data);
        C2C0 = .;
        build/src/C2C0.o(.data);
        C380 = .;
        build/src/C380.o(.data);
        C890 = .;
        build/src/C890.o(.data);
        CE80 = .;
        build/src/CE80.o(.data);
        _10BB0 = .;
        build/src/10BB0.o(.data);
        _14640 = .;
        build/src/14640.o(.data);
        _1A140 = .;
        build/src/1A140.o(.data);
        _1A360 = .;
        build/src/1A360.o(.data);
        _1C2D0 = .;
        build/src/1C2D0.o(.data);
        _1CDC0 = .;
        build/src/1CDC0.o(.data);
        _20860 = .;
        build/src/20860.o(.data);
        _208A0 = .;
        build/src/208A0.o(.data);
        _20C50 = .;
        build/src/20C50.o(.data);
        ______src_unk_220C0 = .;
        build/src/unk_220C0.o(.data);
        _226C0 = .;
        build/src/226C0.o(.data);
        _229E0 = .;
        build/src/229E0.o(.data);
        _43700 = .;
        build/src/43700.o(.data);
        _44300 = .;
        build/src/44300.o(.data);
        _44E70 = .;
        build/src/44E70.o(.data);
        _47580 = .;
        build/src/47580.o(.data);
        _4AAD0 = .;
        build/src/4AAD0.o(.data);
        _4AC10 = .;
        build/src/4AC10.o(.data);
        _4C2E0 = .;
        build/src/4C2E0.o(.data);
        _4CC20 = .;
        build/src/4CC20.o(.data);
        _4EE50 = .;
        build/src/4EE50.o(.data);
        _4F800 = .;
        build/src/4F800.o(.data);
        _517E0 = .;
        build/src/517E0.o(.data);
        _56F90 = .;
        build/src/56F90.o(.data);
        _585D0 = .;
        build/src/585D0.o(.data);
        _615D0 = .;
        build/src/615D0.o(.data);
        _638E0 = .;
        build/src/638E0.o(.data);
        _63CF0 = .;
        build/src/63CF0.o(.data);
        _641E0 = .;
        build/src/641E0.o(.data);
        _654A0 = .;
        build/src/654A0.o(.data);
        _65820 = .;
        build/src/65820.o(.data);
        _65E20 = .;
        build/src/65E20.o(.data);
        _667B0 = .;
        build/src/667B0.o(.data);
        _66990 = .;
        build/src/66990.o(.data);
        _66B50 = .;
        build/src/66B50.o(.data);
        _66DF0 = .;
        build/src/66DF0.o(.data);
        _672F0 = .;
        build/src/672F0.o(.data);
        _674C0 = .;
        build/src/674C0.o(.data);
        _674D0 = .;
        build/src/674D0.o(.data);
        _67F00 = .;
        build/src/67F00.o(.data);
        _68F90 = .;
        build/src/68F90.o(.data);
        _69650 = .;
        build/src/69650.o(.data);
        _69F70 = .;
        build/src/69F70.o(.data);
        _6AA10 = .;
        build/src/6AA10.o(.data);
        _6AA80 = .;
        build/src/6AA80.o(.data);
        _6DDA0 = .;
        build/src/6DDA0.o(.data);
        _6DEC0 = .;
        build/src/6DEC0.o(.data);
        _6E850 = .;
        build/src/6E850.o(.data);
        _71E10 = .;
        build/src/71E10.o(.data);
        _72540 = .;
        build/src/72540.o(.data);
        _72720 = .;
        build/src/72720.o(.data);
        _728D0 = .;
        build/src/728D0.o(.data);
        _72C30 = .;
        build/src/72C30.o(.data);
        _73C80 = .;
        build/src/73C80.o(.data);
        _74020 = .;
        build/src/74020.o(.data);
        _85DA0_data = .;
        build/asm/us/data/85DA0.data.o(.data);
        build/lib/libultra.a:exceptasm.o(.data);
        build/lib/libultra.a:thread.o(.data);
        build/lib/libultra.a:controller.o(.data);
        build/lib/libultra.a:siacs.o(.data);
        build/lib/libultra.a:initialize.o(.data);
        build/lib/libultra.a:initialize_msp.o(.data);
        build/lib/libultra.a:piacs.o(.data);
        build/lib/libultra.a:vitbl.o(.data);
        build/lib/libultra.a:kdebugserver.o(.data);
        build/lib/libultra.a:readhost.o(.data);
        build/lib/libultra.a:threadprofile.o(.data);
        build/lib/libultra.a:pimgr.o(.data);
        build/lib/libultra.a:vimodentsclpn1.o(.data);
        build/lib/libultra.a:vimodempallpn1.o(.data);
        build/lib/libultra.a:contpfs.o(.data);
        build/lib/libultra.a:seteventmesg.o(.data);
        build/lib/libultra.a:random.o(.data);
        build/lib/libultra.a:xprintf.o(.data);
        build/lib/libultra.a:initialize_kmc.o(.data);
        build/lib/libultra.a:rotaterpy.o(.data);
        build/lib/libultra.a:timerintr.o(.data);
        build/lib/libultra.a:rotate.o(.data);
        build/lib/libultra.a:vi.o(.data);
        build/lib/libultra.a:vimodepallan1.o(.data);
        build/lib/libultra.a:vimodentsclan1.o(.data);
        build/lib/libultra.a:vimodempallan1.o(.data);
        build/lib/libultra.a:rdbsend.o(.data);
        build/lib/libultra.a:cartrominit.o(.data);
        build/lib/libultra.a:gbpakreadid.o(.data);
        build/lib/libultra.a:rmoncmds.o(.data);
        build/lib/libultra.a:rmonmain.o(.data);
        build/lib/libultra.a:contramread.o(.data);
        build/lib/libultra.a:xlitob.o(.data);
        build/lib/libultra.a:vimgr.o(.data);
        text_DATA_END = .;
        text_DATA_SIZE = ABSOLUTE(text_DATA_END - text_DATA_START);
        text_RODATA_START = .;
        build/asm/us/entry.o(.rodata);
        build/asm/us/pre_main.o(.rodata);
        build/src/main.o(.rodata);
        build/src/dp_intro.o(.rodata);
        build/src/2CA0.o(.rodata);
        build/src/3280.o(.rodata);
        build/src/3A00.o(.rodata);
        build/src/3E40.o(.rodata);
        build/src/4420.o(.rodata);
        build/src/57C0.o(.rodata);
        build/src/62E0.o(.rodata);
        build/src/6670.o(.rodata);
        build/src/7140.o(.rodata);
        build/src/78D0.o(.rodata);
        build/src/7A50.o(.rodata);
        build/src/8470.o(.rodata);
        build/src/95C0.o(.rodata);
        build/src/9E00.o(.rodata);
        build/src/AC80.o(.rodata);
        build/src/BF50.o(.rodata);
        build/src/C180.o(.rodata);
        build/src/C290.o(.rodata);
        build/src/C2A0.o(.rodata);
        build/src/C2C0.o(.rodata);
        build/src/C380.o(.rodata);
        build/src/C890.o(.rodata);
        build/src/CE80.o(.rodata);
        build/src/10BB0.o(.rodata);
        build/src/14640.o(.rodata);
        build/src/1A140.o(.rodata);
        build/src/1A360.o(.rodata);
        build/src/1C2D0.o(.rodata);
        build/src/1CDC0.o(.rodata);
        build/src/20860.o(.rodata);
        build/src/208A0.o(.rodata);
        build/src/20C50.o(.rodata);
        build/src/unk_220C0.o(.rodata);
        build/src/226C0.o(.rodata);
        build/src/229E0.o(.rodata);
        build/src/43700.o(.rodata);
        build/src/44300.o(.rodata);
        build/src/44E70.o(.rodata);
        build/src/47580.o(.rodata);
        build/src/4AAD0.o(.rodata);
        build/src/4AC10.o(.rodata);
        build/src/4C2E0.o(.rodata);
        build/src/4CC20.o(.rodata);
        build/src/4EE50.o(.rodata);
        build/src/4F800.o(.rodata);
        build/src/517E0.o(.rodata);
        build/src/56F90.o(.rodata);
        build/src/585D0.o(.rodata);
        build/src/615D0.o(.rodata);
        build/src/638E0.o(.rodata);
        build/src/63CF0.o(.rodata);
        build/src/641E0.o(.rodata);
        build/src/654A0.o(.rodata);
        build/src/65820.o(.rodata);
        build/src/65E20.o(.rodata);
        build/src/667B0.o(.rodata);
        build/src/66990.o(.rodata);
        build/src/66B50.o(.rodata);
        build/src/66DF0.o(.rodata);
        build/src/672F0.o(.rodata);
        build/src/674C0.o(.rodata);
        build/src/674D0.o(.rodata);
        build/src/67F00.o(.rodata);
        build/src/68F90.o(.rodata);
        build/src/69650.o(.rodata);
        build/src/69F70.o(.rodata);
        build/src/6AA10.o(.rodata);
        build/src/6AA80.o(.rodata);
        build/src/6DDA0.o(.rodata);
        build/src/6DEC0.o(.rodata);
        build/src/6E850.o(.rodata);
        build/src/71E10.o(.rodata);
        build/src/72540.o(.rodata);
        build/src/72720.o(.rodata);
        build/src/728D0.o(.rodata);
        build/src/72C30.o(.rodata);
        build/src/73C80.o(.rodata);
        build/src/74020.o(.rodata);
        build/asm/us/data/A23F0.rodata.o(.rodata);
        build/lib/libultra.a:setintmask.o(.rodata);
        build/lib/libultra.a:sinf.o(.rodata);
        build/lib/libultra.a:exceptasm.o(.rodata);
        build/lib/libultra.a:perspective.o(.rodata);
        build/lib/libultra.a:devmgr.o(.rodata);
        build/lib/libultra.a:xprintf.o(.rodata);
        build/lib/libultra.a:cosf.o(.rodata);
        build/lib/libultra.a:rmonmem.o(.rodata);
        build/lib/libultra.a:rmonmain.o(.rodata);
        build/lib/libultra.a:rmontask.o(.rodata);
        build/lib/libultra.a:rmonmisc.o(.rodata);
        build/lib/libultra.a:rmonbrk.o(.rodata);
        build/lib/libultra.a:rmonregs.o(.rodata);
        build/lib/libultra.a:libm_vals.o(.rodata);
        build/lib/libultra.a:xldtob.o(.rodata);
        build/lib/libultra.a:llcvt.o(.rodata);
        build/asm/us/data/A6FD0.rodata.o(.rodata);
        build/asm/us/data/A8600.rodata.o(.rodata);
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
        build/src/main.o(.bss);
        build/src/dp_intro.o(.bss);
        build/src/2CA0.o(.bss);
        build/src/3280.o(.bss);
        build/src/3A00.o(.bss);
        build/src/3E40.o(.bss);
        build/src/4420.o(.bss);
        build/src/57C0.o(.bss);
        build/src/62E0.o(.bss);
        build/src/6670.o(.bss);
        build/src/7140.o(.bss);
        build/src/78D0.o(.bss);
        build/src/7A50.o(.bss);
        build/src/8470.o(.bss);
        build/src/95C0.o(.bss);
        build/src/9E00.o(.bss);
        build/src/AC80.o(.bss);
        build/src/BF50.o(.bss);
        build/src/C180.o(.bss);
        build/src/C290.o(.bss);
        build/src/C2A0.o(.bss);
        build/src/C2C0.o(.bss);
        build/src/C380.o(.bss);
        build/src/C890.o(.bss);
        build/src/CE80.o(.bss);
        build/src/10BB0.o(.bss);
        build/src/14640.o(.bss);
        build/src/1A140.o(.bss);
        build/src/1A360.o(.bss);
        build/src/1C2D0.o(.bss);
        build/src/1CDC0.o(.bss);
        build/src/20860.o(.bss);
        build/src/208A0.o(.bss);
        build/src/20C50.o(.bss);
        build/src/unk_220C0.o(.bss);
        build/src/226C0.o(.bss);
        build/src/229E0.o(.bss);
        build/src/43700.o(.bss);
        build/src/44300.o(.bss);
        build/src/44E70.o(.bss);
        build/src/47580.o(.bss);
        build/src/4AAD0.o(.bss);
        build/src/4AC10.o(.bss);
        build/src/4C2E0.o(.bss);
        build/src/4CC20.o(.bss);
        build/src/4EE50.o(.bss);
        build/src/4F800.o(.bss);
        build/src/517E0.o(.bss);
        build/src/56F90.o(.bss);
        build/src/585D0.o(.bss);
        build/src/615D0.o(.bss);
        build/src/638E0.o(.bss);
        build/src/63CF0.o(.bss);
        build/src/641E0.o(.bss);
        build/src/654A0.o(.bss);
        build/src/65820.o(.bss);
        build/src/65E20.o(.bss);
        build/src/667B0.o(.bss);
        build/src/66990.o(.bss);
        build/src/66B50.o(.bss);
        build/src/66DF0.o(.bss);
        build/src/672F0.o(.bss);
        build/src/674C0.o(.bss);
        build/src/674D0.o(.bss);
        build/src/67F00.o(.bss);
        build/src/68F90.o(.bss);
        build/src/69650.o(.bss);
        build/src/69F70.o(.bss);
        build/src/6AA10.o(.bss);
        build/src/6AA80.o(.bss);
        build/src/6DDA0.o(.bss);
        build/src/6DEC0.o(.bss);
        build/src/6E850.o(.bss);
        build/src/71E10.o(.bss);
        build/src/72540.o(.bss);
        build/src/72720.o(.bss);
        build/src/728D0.o(.bss);
        build/src/72C30.o(.bss);
        build/src/73C80.o(.bss);
        build/src/74020.o(.bss);
        build/asm/us/data/unk_bss.bss.o(.bss);
        build/lib/libultra.a:sptask.o(.bss);
        build/lib/libultra.a:controller.o(.bss);
        build/lib/libultra.a:siacs.o(.bss);
        build/lib/libultra.a:initialize.o(.bss);
        build/lib/libultra.a:initialize_isv.o(.bss);
        build/lib/libultra.a:piacs.o(.bss);
        build/lib/libultra.a:initrdb.o(.bss);
        build/lib/libultra.a:gbpakinit.o(.bss);
        build/lib/libultra.a:kdebugserver.o(.bss);
        build/lib/libultra.a:readhost.o(.bss);
        build/lib/libultra.a:threadprofile.o(.bss);
        build/lib/libultra.a:flashinit.o(.bss);
        build/lib/libultra.a:pfsisplug.o(.bss);
        build/lib/libultra.a:pimgr.o(.bss);
        build/lib/libultra.a:conteepread.o(.bss);
        build/lib/libultra.a:contpfs.o(.bss);
        build/lib/libultra.a:seteventmesg.o(.bss);
        build/lib/libultra.a:rmonsio.o(.bss);
        build/lib/libultra.a:timerintr.o(.bss);
        build/lib/libultra.a:cartrominit.o(.bss);
        build/lib/libultra.a:rmonmem.o(.bss);
        build/lib/libultra.a:rmonmain.o(.bss);
        build/lib/libultra.a:rmonmisc.o(.bss);
        build/lib/libultra.a:rmonbrk.o(.bss);
        build/lib/libultra.a:rmonregs.o(.bss);
        build/lib/libultra.a:vimgr.o(.bss);
        text_BSS_END = .;
        text_BSS_SIZE = ABSOLUTE(text_BSS_END - text_BSS_START);
    }
    __romPos += SIZEOF(.text);
    text_ROM_END = __romPos;
    text_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x25_ROM_START = __romPos;
    fragment_0x25_VRAM = ADDR(.fragment_0x25);
    .fragment_0x25 0x83500000 : AT(fragment_0x25_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x25_TEXT_START = .;
        build/asm/us/data/fragments/0x25/fragment_0x25_header.o(.text);
        build/src/fragments/0x25/fragment_0x25_code.o(.text);
        fragment_0x25_TEXT_END = .;
        fragment_0x25_TEXT_SIZE = ABSOLUTE(fragment_0x25_TEXT_END - fragment_0x25_TEXT_START);
        fragment_0x25_DATA_START = .;
        fragments_0x25_fragment_0x25_header = .;
        build/asm/us/data/fragments/0x25/fragment_0x25_header.o(.data);
        fragments_0x25_fragment_0x25_code = .;
        build/src/fragments/0x25/fragment_0x25_code.o(.data);
        fragments_0x25_fragment_0x25_data_data = .;
        build/asm/us/data/fragments/0x25/fragment_0x25_data.data.o(.data);
        fragment_0x25_DATA_END = .;
        fragment_0x25_DATA_SIZE = ABSOLUTE(fragment_0x25_DATA_END - fragment_0x25_DATA_START);
        fragment_0x25_RODATA_START = .;
        build/asm/us/data/fragments/0x25/fragment_0x25_header.o(.rodata);
        build/src/fragments/0x25/fragment_0x25_code.o(.rodata);
        fragment_0x25_RODATA_END = .;
        fragment_0x25_RODATA_SIZE = ABSOLUTE(fragment_0x25_RODATA_END - fragment_0x25_RODATA_START);
    }
    fragment_0x25_bss_VRAM = ADDR(.fragment_0x25_bss);
    .fragment_0x25_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x25_BSS_START = .;
        build/asm/us/data/fragments/0x25/fragment_0x25_header.o(.bss);
        build/src/fragments/0x25/fragment_0x25_code.o(.bss);
        fragment_0x25_BSS_END = .;
        fragment_0x25_BSS_SIZE = ABSOLUTE(fragment_0x25_BSS_END - fragment_0x25_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x25);
    fragment_0x25_ROM_END = __romPos;
    fragment_0x25_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x9_ROM_START = __romPos;
    fragment_0x9_VRAM = ADDR(.fragment_0x9);
    .fragment_0x9 0x81900000 : AT(fragment_0x9_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9_TEXT_START = .;
        build/asm/us/data/fragments/0x9/fragment_0x9_header.o(.text);
        build/src/fragments/0x9/fragment_0x9_code.o(.text);
        fragment_0x9_TEXT_END = .;
        fragment_0x9_TEXT_SIZE = ABSOLUTE(fragment_0x9_TEXT_END - fragment_0x9_TEXT_START);
        fragment_0x9_DATA_START = .;
        fragments_0x9_fragment_0x9_header = .;
        build/asm/us/data/fragments/0x9/fragment_0x9_header.o(.data);
        fragments_0x9_fragment_0x9_code = .;
        build/src/fragments/0x9/fragment_0x9_code.o(.data);
        fragments_0x9_fragment_0x9_data_data = .;
        build/asm/us/data/fragments/0x9/fragment_0x9_data.data.o(.data);
        fragment_0x9_DATA_END = .;
        fragment_0x9_DATA_SIZE = ABSOLUTE(fragment_0x9_DATA_END - fragment_0x9_DATA_START);
        fragment_0x9_RODATA_START = .;
        build/asm/us/data/fragments/0x9/fragment_0x9_header.o(.rodata);
        build/src/fragments/0x9/fragment_0x9_code.o(.rodata);
        fragment_0x9_RODATA_END = .;
        fragment_0x9_RODATA_SIZE = ABSOLUTE(fragment_0x9_RODATA_END - fragment_0x9_RODATA_START);
    }
    fragment_0x9_bss_VRAM = ADDR(.fragment_0x9_bss);
    .fragment_0x9_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9_BSS_START = .;
        build/asm/us/data/fragments/0x9/fragment_0x9_header.o(.bss);
        build/src/fragments/0x9/fragment_0x9_code.o(.bss);
        fragment_0x9_BSS_END = .;
        fragment_0x9_BSS_SIZE = ABSOLUTE(fragment_0x9_BSS_END - fragment_0x9_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x9);
    fragment_0x9_ROM_END = __romPos;
    fragment_0x9_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xA_ROM_START = __romPos;
    fragment_0xA_VRAM = ADDR(.fragment_0xA);
    .fragment_0xA 0x81A00000 : AT(fragment_0xA_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xA_TEXT_START = .;
        build/asm/us/data/fragments/0xA/fragment_0xA_header.o(.text);
        build/src/fragments/0xA/fragment_0xA_code.o(.text);
        fragment_0xA_TEXT_END = .;
        fragment_0xA_TEXT_SIZE = ABSOLUTE(fragment_0xA_TEXT_END - fragment_0xA_TEXT_START);
        fragment_0xA_DATA_START = .;
        fragments_0xA_fragment_0xA_header = .;
        build/asm/us/data/fragments/0xA/fragment_0xA_header.o(.data);
        fragments_0xA_fragment_0xA_code = .;
        build/src/fragments/0xA/fragment_0xA_code.o(.data);
        fragments_0xA_fragment_0xA_data_data = .;
        build/asm/us/data/fragments/0xA/fragment_0xA_data.data.o(.data);
        fragment_0xA_DATA_END = .;
        fragment_0xA_DATA_SIZE = ABSOLUTE(fragment_0xA_DATA_END - fragment_0xA_DATA_START);
        fragment_0xA_RODATA_START = .;
        build/asm/us/data/fragments/0xA/fragment_0xA_header.o(.rodata);
        build/src/fragments/0xA/fragment_0xA_code.o(.rodata);
        fragment_0xA_RODATA_END = .;
        fragment_0xA_RODATA_SIZE = ABSOLUTE(fragment_0xA_RODATA_END - fragment_0xA_RODATA_START);
    }
    fragment_0xA_bss_VRAM = ADDR(.fragment_0xA_bss);
    .fragment_0xA_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xA_BSS_START = .;
        build/asm/us/data/fragments/0xA/fragment_0xA_header.o(.bss);
        build/src/fragments/0xA/fragment_0xA_code.o(.bss);
        fragment_0xA_BSS_END = .;
        fragment_0xA_BSS_SIZE = ABSOLUTE(fragment_0xA_BSS_END - fragment_0xA_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xA);
    fragment_0xA_ROM_END = __romPos;
    fragment_0xA_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x8_ROM_START = __romPos;
    fragment_0x8_VRAM = ADDR(.fragment_0x8);
    .fragment_0x8 0x81800000 : AT(fragment_0x8_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x8_TEXT_START = .;
        build/asm/us/data/fragments/0x8/fragment_0x8_header.o(.text);
        build/src/fragments/0x8/fragment_0x8_AE600.o(.text);
        build/src/fragments/0x8/fragment_0x8_AFAA0.o(.text);
        build/src/fragments/0x8/fragment_0x8_B2D00.o(.text);
        fragment_0x8_TEXT_END = .;
        fragment_0x8_TEXT_SIZE = ABSOLUTE(fragment_0x8_TEXT_END - fragment_0x8_TEXT_START);
        fragment_0x8_DATA_START = .;
        fragments_0x8_fragment_0x8_header = .;
        build/asm/us/data/fragments/0x8/fragment_0x8_header.o(.data);
        fragments_0x8_fragment_0x8_AE600 = .;
        build/src/fragments/0x8/fragment_0x8_AE600.o(.data);
        fragments_0x8_fragment_0x8_AFAA0 = .;
        build/src/fragments/0x8/fragment_0x8_AFAA0.o(.data);
        fragments_0x8_fragment_0x8_B2D00 = .;
        build/src/fragments/0x8/fragment_0x8_B2D00.o(.data);
        fragments_0x8_fragment_0x8_data_data = .;
        build/asm/us/data/fragments/0x8/fragment_0x8_data.data.o(.data);
        fragment_0x8_DATA_END = .;
        fragment_0x8_DATA_SIZE = ABSOLUTE(fragment_0x8_DATA_END - fragment_0x8_DATA_START);
        fragment_0x8_RODATA_START = .;
        build/asm/us/data/fragments/0x8/fragment_0x8_header.o(.rodata);
        build/src/fragments/0x8/fragment_0x8_AE600.o(.rodata);
        build/src/fragments/0x8/fragment_0x8_AFAA0.o(.rodata);
        build/src/fragments/0x8/fragment_0x8_B2D00.o(.rodata);
        fragment_0x8_RODATA_END = .;
        fragment_0x8_RODATA_SIZE = ABSOLUTE(fragment_0x8_RODATA_END - fragment_0x8_RODATA_START);
    }
    fragment_0x8_bss_VRAM = ADDR(.fragment_0x8_bss);
    .fragment_0x8_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x8_BSS_START = .;
        build/asm/us/data/fragments/0x8/fragment_0x8_header.o(.bss);
        build/src/fragments/0x8/fragment_0x8_AE600.o(.bss);
        build/src/fragments/0x8/fragment_0x8_AFAA0.o(.bss);
        build/src/fragments/0x8/fragment_0x8_B2D00.o(.bss);
        fragment_0x8_BSS_END = .;
        fragment_0x8_BSS_SIZE = ABSOLUTE(fragment_0x8_BSS_END - fragment_0x8_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x8);
    fragment_0x8_ROM_END = __romPos;
    fragment_0x8_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x22_ROM_START = __romPos;
    fragment_0x22_VRAM = ADDR(.fragment_0x22);
    .fragment_0x22 0x83200000 : AT(fragment_0x22_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x22_TEXT_START = .;
        build/asm/us/data/fragments/0x22/fragment_0x22_header.o(.text);
        build/src/fragments/0x22/fragment_0x22_code.o(.text);
        fragment_0x22_TEXT_END = .;
        fragment_0x22_TEXT_SIZE = ABSOLUTE(fragment_0x22_TEXT_END - fragment_0x22_TEXT_START);
        fragment_0x22_DATA_START = .;
        fragments_0x22_fragment_0x22_header = .;
        build/asm/us/data/fragments/0x22/fragment_0x22_header.o(.data);
        fragments_0x22_fragment_0x22_code = .;
        build/src/fragments/0x22/fragment_0x22_code.o(.data);
        fragments_0x22_fragment_0x22_data_data = .;
        build/asm/us/data/fragments/0x22/fragment_0x22_data.data.o(.data);
        fragment_0x22_DATA_END = .;
        fragment_0x22_DATA_SIZE = ABSOLUTE(fragment_0x22_DATA_END - fragment_0x22_DATA_START);
        fragment_0x22_RODATA_START = .;
        build/asm/us/data/fragments/0x22/fragment_0x22_header.o(.rodata);
        build/src/fragments/0x22/fragment_0x22_code.o(.rodata);
        fragment_0x22_RODATA_END = .;
        fragment_0x22_RODATA_SIZE = ABSOLUTE(fragment_0x22_RODATA_END - fragment_0x22_RODATA_START);
    }
    fragment_0x22_bss_VRAM = ADDR(.fragment_0x22_bss);
    .fragment_0x22_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x22_BSS_START = .;
        build/asm/us/data/fragments/0x22/fragment_0x22_header.o(.bss);
        build/src/fragments/0x22/fragment_0x22_code.o(.bss);
        fragment_0x22_BSS_END = .;
        fragment_0x22_BSS_SIZE = ABSOLUTE(fragment_0x22_BSS_END - fragment_0x22_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x22);
    fragment_0x22_ROM_END = __romPos;
    fragment_0x22_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x21_ROM_START = __romPos;
    fragment_0x21_VRAM = ADDR(.fragment_0x21);
    .fragment_0x21 0x83100000 : AT(fragment_0x21_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x21_TEXT_START = .;
        build/asm/us/data/fragments/0x21/fragment_0x21_header.o(.text);
        build/src/fragments/0x21/fragment_0x21_code.o(.text);
        fragment_0x21_TEXT_END = .;
        fragment_0x21_TEXT_SIZE = ABSOLUTE(fragment_0x21_TEXT_END - fragment_0x21_TEXT_START);
        fragment_0x21_DATA_START = .;
        fragments_0x21_fragment_0x21_header = .;
        build/asm/us/data/fragments/0x21/fragment_0x21_header.o(.data);
        fragments_0x21_fragment_0x21_code = .;
        build/src/fragments/0x21/fragment_0x21_code.o(.data);
        fragments_0x21_fragment_0x21_data_data = .;
        build/asm/us/data/fragments/0x21/fragment_0x21_data.data.o(.data);
        fragment_0x21_DATA_END = .;
        fragment_0x21_DATA_SIZE = ABSOLUTE(fragment_0x21_DATA_END - fragment_0x21_DATA_START);
        fragment_0x21_RODATA_START = .;
        build/asm/us/data/fragments/0x21/fragment_0x21_header.o(.rodata);
        build/src/fragments/0x21/fragment_0x21_code.o(.rodata);
        fragment_0x21_RODATA_END = .;
        fragment_0x21_RODATA_SIZE = ABSOLUTE(fragment_0x21_RODATA_END - fragment_0x21_RODATA_START);
    }
    fragment_0x21_bss_VRAM = ADDR(.fragment_0x21_bss);
    .fragment_0x21_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x21_BSS_START = .;
        build/asm/us/data/fragments/0x21/fragment_0x21_header.o(.bss);
        build/src/fragments/0x21/fragment_0x21_code.o(.bss);
        fragment_0x21_BSS_END = .;
        fragment_0x21_BSS_SIZE = ABSOLUTE(fragment_0x21_BSS_END - fragment_0x21_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x21);
    fragment_0x21_ROM_END = __romPos;
    fragment_0x21_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x20_ROM_START = __romPos;
    fragment_0x20_VRAM = ADDR(.fragment_0x20);
    .fragment_0x20 0x83000000 : AT(fragment_0x20_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x20_TEXT_START = .;
        build/asm/us/data/fragments/0x20/fragment_0x20_header.o(.text);
        build/src/fragments/0x20/fragment_0x20_BA250.o(.text);
        build/src/fragments/0x20/fragment_0x20_C4C10.o(.text);
        fragment_0x20_TEXT_END = .;
        fragment_0x20_TEXT_SIZE = ABSOLUTE(fragment_0x20_TEXT_END - fragment_0x20_TEXT_START);
        fragment_0x20_DATA_START = .;
        fragments_0x20_fragment_0x20_header = .;
        build/asm/us/data/fragments/0x20/fragment_0x20_header.o(.data);
        fragments_0x20_fragment_0x20_BA250 = .;
        build/src/fragments/0x20/fragment_0x20_BA250.o(.data);
        fragments_0x20_fragment_0x20_C4C10 = .;
        build/src/fragments/0x20/fragment_0x20_C4C10.o(.data);
        fragments_0x20_fragment_0x20_data_data = .;
        build/asm/us/data/fragments/0x20/fragment_0x20_data.data.o(.data);
        fragment_0x20_DATA_END = .;
        fragment_0x20_DATA_SIZE = ABSOLUTE(fragment_0x20_DATA_END - fragment_0x20_DATA_START);
        fragment_0x20_RODATA_START = .;
        build/asm/us/data/fragments/0x20/fragment_0x20_header.o(.rodata);
        build/src/fragments/0x20/fragment_0x20_BA250.o(.rodata);
        build/src/fragments/0x20/fragment_0x20_C4C10.o(.rodata);
        fragment_0x20_RODATA_END = .;
        fragment_0x20_RODATA_SIZE = ABSOLUTE(fragment_0x20_RODATA_END - fragment_0x20_RODATA_START);
    }
    fragment_0x20_bss_VRAM = ADDR(.fragment_0x20_bss);
    .fragment_0x20_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x20_BSS_START = .;
        build/asm/us/data/fragments/0x20/fragment_0x20_header.o(.bss);
        build/src/fragments/0x20/fragment_0x20_BA250.o(.bss);
        build/src/fragments/0x20/fragment_0x20_C4C10.o(.bss);
        fragment_0x20_BSS_END = .;
        fragment_0x20_BSS_SIZE = ABSOLUTE(fragment_0x20_BSS_END - fragment_0x20_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x20);
    fragment_0x20_ROM_END = __romPos;
    fragment_0x20_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x1F_ROM_START = __romPos;
    fragment_0x1F_VRAM = ADDR(.fragment_0x1F);
    .fragment_0x1F 0x82F00000 : AT(fragment_0x1F_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1F_TEXT_START = .;
        build/asm/us/data/fragments/0x1F/fragment_0x1F_header.o(.text);
        build/src/fragments/0x1F/fragment_0x1F_code.o(.text);
        fragment_0x1F_TEXT_END = .;
        fragment_0x1F_TEXT_SIZE = ABSOLUTE(fragment_0x1F_TEXT_END - fragment_0x1F_TEXT_START);
        fragment_0x1F_DATA_START = .;
        fragments_0x1F_fragment_0x1F_header = .;
        build/asm/us/data/fragments/0x1F/fragment_0x1F_header.o(.data);
        fragments_0x1F_fragment_0x1F_code = .;
        build/src/fragments/0x1F/fragment_0x1F_code.o(.data);
        fragments_0x1F_fragment_0x1F_data_data = .;
        build/asm/us/data/fragments/0x1F/fragment_0x1F_data.data.o(.data);
        fragment_0x1F_DATA_END = .;
        fragment_0x1F_DATA_SIZE = ABSOLUTE(fragment_0x1F_DATA_END - fragment_0x1F_DATA_START);
        fragment_0x1F_RODATA_START = .;
        build/asm/us/data/fragments/0x1F/fragment_0x1F_header.o(.rodata);
        build/src/fragments/0x1F/fragment_0x1F_code.o(.rodata);
        fragment_0x1F_RODATA_END = .;
        fragment_0x1F_RODATA_SIZE = ABSOLUTE(fragment_0x1F_RODATA_END - fragment_0x1F_RODATA_START);
    }
    fragment_0x1F_bss_VRAM = ADDR(.fragment_0x1F_bss);
    .fragment_0x1F_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1F_BSS_START = .;
        build/asm/us/data/fragments/0x1F/fragment_0x1F_header.o(.bss);
        build/src/fragments/0x1F/fragment_0x1F_code.o(.bss);
        fragment_0x1F_BSS_END = .;
        fragment_0x1F_BSS_SIZE = ABSOLUTE(fragment_0x1F_BSS_END - fragment_0x1F_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x1F);
    fragment_0x1F_ROM_END = __romPos;
    fragment_0x1F_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xEB_ROM_START = __romPos;
    fragment_0xEB_VRAM = ADDR(.fragment_0xEB);
    .fragment_0xEB 0x8FB00000 : AT(fragment_0xEB_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xEB_TEXT_START = .;
        build/asm/us/data/fragments/0xEB/fragment_0xEB_header.o(.text);
        build/src/fragments/0xEB/fragment_0xEB_code.o(.text);
        fragment_0xEB_TEXT_END = .;
        fragment_0xEB_TEXT_SIZE = ABSOLUTE(fragment_0xEB_TEXT_END - fragment_0xEB_TEXT_START);
        fragment_0xEB_DATA_START = .;
        fragments_0xEB_fragment_0xEB_header = .;
        build/asm/us/data/fragments/0xEB/fragment_0xEB_header.o(.data);
        fragments_0xEB_fragment_0xEB_code = .;
        build/src/fragments/0xEB/fragment_0xEB_code.o(.data);
        fragments_0xEB_fragment_0xEB_data_data = .;
        build/asm/us/data/fragments/0xEB/fragment_0xEB_data.data.o(.data);
        fragment_0xEB_DATA_END = .;
        fragment_0xEB_DATA_SIZE = ABSOLUTE(fragment_0xEB_DATA_END - fragment_0xEB_DATA_START);
        fragment_0xEB_RODATA_START = .;
        build/asm/us/data/fragments/0xEB/fragment_0xEB_header.o(.rodata);
        build/src/fragments/0xEB/fragment_0xEB_code.o(.rodata);
        fragment_0xEB_RODATA_END = .;
        fragment_0xEB_RODATA_SIZE = ABSOLUTE(fragment_0xEB_RODATA_END - fragment_0xEB_RODATA_START);
    }
    fragment_0xEB_bss_VRAM = ADDR(.fragment_0xEB_bss);
    .fragment_0xEB_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xEB_BSS_START = .;
        build/asm/us/data/fragments/0xEB/fragment_0xEB_header.o(.bss);
        build/src/fragments/0xEB/fragment_0xEB_code.o(.bss);
        fragment_0xEB_BSS_END = .;
        fragment_0xEB_BSS_SIZE = ABSOLUTE(fragment_0xEB_BSS_END - fragment_0xEB_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xEB);
    fragment_0xEB_ROM_END = __romPos;
    fragment_0xEB_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x18_ROM_START = __romPos;
    fragment_0x18_VRAM = ADDR(.fragment_0x18);
    .fragment_0x18 0x82800000 : AT(fragment_0x18_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x18_TEXT_START = .;
        build/asm/us/data/fragments/0x18/fragment_0x18_header.o(.text);
        build/src/fragments/0x18/fragment_0x18_D4C50.o(.text);
        build/src/fragments/0x18/fragment_0x18_D5250.o(.text);
        fragment_0x18_TEXT_END = .;
        fragment_0x18_TEXT_SIZE = ABSOLUTE(fragment_0x18_TEXT_END - fragment_0x18_TEXT_START);
        fragment_0x18_DATA_START = .;
        fragments_0x18_fragment_0x18_header = .;
        build/asm/us/data/fragments/0x18/fragment_0x18_header.o(.data);
        fragments_0x18_fragment_0x18_D4C50 = .;
        build/src/fragments/0x18/fragment_0x18_D4C50.o(.data);
        fragments_0x18_fragment_0x18_D5250 = .;
        build/src/fragments/0x18/fragment_0x18_D5250.o(.data);
        fragments_0x18_fragment_0x18_data_data = .;
        build/asm/us/data/fragments/0x18/fragment_0x18_data.data.o(.data);
        fragment_0x18_DATA_END = .;
        fragment_0x18_DATA_SIZE = ABSOLUTE(fragment_0x18_DATA_END - fragment_0x18_DATA_START);
        fragment_0x18_RODATA_START = .;
        build/asm/us/data/fragments/0x18/fragment_0x18_header.o(.rodata);
        build/src/fragments/0x18/fragment_0x18_D4C50.o(.rodata);
        build/src/fragments/0x18/fragment_0x18_D5250.o(.rodata);
        fragment_0x18_RODATA_END = .;
        fragment_0x18_RODATA_SIZE = ABSOLUTE(fragment_0x18_RODATA_END - fragment_0x18_RODATA_START);
    }
    fragment_0x18_bss_VRAM = ADDR(.fragment_0x18_bss);
    .fragment_0x18_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x18_BSS_START = .;
        build/asm/us/data/fragments/0x18/fragment_0x18_header.o(.bss);
        build/src/fragments/0x18/fragment_0x18_D4C50.o(.bss);
        build/src/fragments/0x18/fragment_0x18_D5250.o(.bss);
        fragment_0x18_BSS_END = .;
        fragment_0x18_BSS_SIZE = ABSOLUTE(fragment_0x18_BSS_END - fragment_0x18_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x18);
    fragment_0x18_ROM_END = __romPos;
    fragment_0x18_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x6_ROM_START = __romPos;
    fragment_0x6_VRAM = ADDR(.fragment_0x6);
    .fragment_0x6 0x81600000 : AT(fragment_0x6_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6_TEXT_START = .;
        build/asm/us/data/fragments/0x6/fragment_0x6_header.o(.text);
        build/src/fragments/0x6/fragment_0x6_D7BC0.o(.text);
        build/src/fragments/0x6/fragment_0x6_D9520.o(.text);
        build/src/fragments/0x6/fragment_0x6_E1E10.o(.text);
        build/src/fragments/0x6/fragment_0x6_E35C0.o(.text);
        build/src/fragments/0x6/fragment_0x6_E3850.o(.text);
        fragment_0x6_TEXT_END = .;
        fragment_0x6_TEXT_SIZE = ABSOLUTE(fragment_0x6_TEXT_END - fragment_0x6_TEXT_START);
        fragment_0x6_DATA_START = .;
        fragments_0x6_fragment_0x6_header = .;
        build/asm/us/data/fragments/0x6/fragment_0x6_header.o(.data);
        fragments_0x6_fragment_0x6_D7BC0 = .;
        build/src/fragments/0x6/fragment_0x6_D7BC0.o(.data);
        fragments_0x6_fragment_0x6_D9520 = .;
        build/src/fragments/0x6/fragment_0x6_D9520.o(.data);
        fragments_0x6_fragment_0x6_E1E10 = .;
        build/src/fragments/0x6/fragment_0x6_E1E10.o(.data);
        fragments_0x6_fragment_0x6_E35C0 = .;
        build/src/fragments/0x6/fragment_0x6_E35C0.o(.data);
        fragments_0x6_fragment_0x6_E3850 = .;
        build/src/fragments/0x6/fragment_0x6_E3850.o(.data);
        fragments_0x6_fragment_0x6_data_data = .;
        build/asm/us/data/fragments/0x6/fragment_0x6_data.data.o(.data);
        fragment_0x6_DATA_END = .;
        fragment_0x6_DATA_SIZE = ABSOLUTE(fragment_0x6_DATA_END - fragment_0x6_DATA_START);
        fragment_0x6_RODATA_START = .;
        build/asm/us/data/fragments/0x6/fragment_0x6_header.o(.rodata);
        build/src/fragments/0x6/fragment_0x6_D7BC0.o(.rodata);
        build/src/fragments/0x6/fragment_0x6_D9520.o(.rodata);
        build/src/fragments/0x6/fragment_0x6_E1E10.o(.rodata);
        build/src/fragments/0x6/fragment_0x6_E35C0.o(.rodata);
        build/src/fragments/0x6/fragment_0x6_E3850.o(.rodata);
        fragment_0x6_RODATA_END = .;
        fragment_0x6_RODATA_SIZE = ABSOLUTE(fragment_0x6_RODATA_END - fragment_0x6_RODATA_START);
    }
    fragment_0x6_bss_VRAM = ADDR(.fragment_0x6_bss);
    .fragment_0x6_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6_BSS_START = .;
        build/asm/us/data/fragments/0x6/fragment_0x6_header.o(.bss);
        build/src/fragments/0x6/fragment_0x6_D7BC0.o(.bss);
        build/src/fragments/0x6/fragment_0x6_D9520.o(.bss);
        build/src/fragments/0x6/fragment_0x6_E1E10.o(.bss);
        build/src/fragments/0x6/fragment_0x6_E35C0.o(.bss);
        build/src/fragments/0x6/fragment_0x6_E3850.o(.bss);
        fragment_0x6_BSS_END = .;
        fragment_0x6_BSS_SIZE = ABSOLUTE(fragment_0x6_BSS_END - fragment_0x6_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x6);
    fragment_0x6_ROM_END = __romPos;
    fragment_0x6_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x4_ROM_START = __romPos;
    fragment_0x4_VRAM = ADDR(.fragment_0x4);
    .fragment_0x4 0x81400000 : AT(fragment_0x4_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x4_TEXT_START = .;
        build/asm/us/data/fragments/0x4/fragment_0x4_header.o(.text);
        build/src/fragments/0x4/fragment_0x4_E5330.o(.text);
        build/src/fragments/0x4/fragment_0x4_E7C00.o(.text);
        fragment_0x4_TEXT_END = .;
        fragment_0x4_TEXT_SIZE = ABSOLUTE(fragment_0x4_TEXT_END - fragment_0x4_TEXT_START);
        fragment_0x4_DATA_START = .;
        fragments_0x4_fragment_0x4_header = .;
        build/asm/us/data/fragments/0x4/fragment_0x4_header.o(.data);
        fragments_0x4_fragment_0x4_E5330 = .;
        build/src/fragments/0x4/fragment_0x4_E5330.o(.data);
        fragments_0x4_fragment_0x4_E7C00 = .;
        build/src/fragments/0x4/fragment_0x4_E7C00.o(.data);
        fragments_0x4_fragment_0x4_data_data = .;
        build/asm/us/data/fragments/0x4/fragment_0x4_data.data.o(.data);
        fragment_0x4_DATA_END = .;
        fragment_0x4_DATA_SIZE = ABSOLUTE(fragment_0x4_DATA_END - fragment_0x4_DATA_START);
        fragment_0x4_RODATA_START = .;
        build/asm/us/data/fragments/0x4/fragment_0x4_header.o(.rodata);
        build/src/fragments/0x4/fragment_0x4_E5330.o(.rodata);
        build/src/fragments/0x4/fragment_0x4_E7C00.o(.rodata);
        fragment_0x4_RODATA_END = .;
        fragment_0x4_RODATA_SIZE = ABSOLUTE(fragment_0x4_RODATA_END - fragment_0x4_RODATA_START);
    }
    fragment_0x4_bss_VRAM = ADDR(.fragment_0x4_bss);
    .fragment_0x4_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x4_BSS_START = .;
        build/asm/us/data/fragments/0x4/fragment_0x4_header.o(.bss);
        build/src/fragments/0x4/fragment_0x4_E5330.o(.bss);
        build/src/fragments/0x4/fragment_0x4_E7C00.o(.bss);
        fragment_0x4_BSS_END = .;
        fragment_0x4_BSS_SIZE = ABSOLUTE(fragment_0x4_BSS_END - fragment_0x4_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x4);
    fragment_0x4_ROM_END = __romPos;
    fragment_0x4_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x14_ROM_START = __romPos;
    fragment_0x14_VRAM = ADDR(.fragment_0x14);
    .fragment_0x14 0x82400000 : AT(fragment_0x14_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x14_TEXT_START = .;
        build/asm/us/data/fragments/0x14/fragment_0x14_header.o(.text);
        build/src/fragments/0x14/fragment_0x14_EE0A0.o(.text);
        build/src/fragments/0x14/fragment_0x14_EE5B0.o(.text);
        build/src/fragments/0x14/fragment_0x14_EEC50.o(.text);
        fragment_0x14_TEXT_END = .;
        fragment_0x14_TEXT_SIZE = ABSOLUTE(fragment_0x14_TEXT_END - fragment_0x14_TEXT_START);
        fragment_0x14_DATA_START = .;
        fragments_0x14_fragment_0x14_header = .;
        build/asm/us/data/fragments/0x14/fragment_0x14_header.o(.data);
        fragments_0x14_fragment_0x14_EE0A0 = .;
        build/src/fragments/0x14/fragment_0x14_EE0A0.o(.data);
        fragments_0x14_fragment_0x14_EE5B0 = .;
        build/src/fragments/0x14/fragment_0x14_EE5B0.o(.data);
        fragments_0x14_fragment_0x14_EEC50 = .;
        build/src/fragments/0x14/fragment_0x14_EEC50.o(.data);
        fragments_0x14_fragment_0x14_data_data = .;
        build/asm/us/data/fragments/0x14/fragment_0x14_data.data.o(.data);
        fragment_0x14_DATA_END = .;
        fragment_0x14_DATA_SIZE = ABSOLUTE(fragment_0x14_DATA_END - fragment_0x14_DATA_START);
        fragment_0x14_RODATA_START = .;
        build/asm/us/data/fragments/0x14/fragment_0x14_header.o(.rodata);
        build/src/fragments/0x14/fragment_0x14_EE0A0.o(.rodata);
        build/src/fragments/0x14/fragment_0x14_EE5B0.o(.rodata);
        build/src/fragments/0x14/fragment_0x14_EEC50.o(.rodata);
        fragment_0x14_RODATA_END = .;
        fragment_0x14_RODATA_SIZE = ABSOLUTE(fragment_0x14_RODATA_END - fragment_0x14_RODATA_START);
    }
    fragment_0x14_bss_VRAM = ADDR(.fragment_0x14_bss);
    .fragment_0x14_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x14_BSS_START = .;
        build/asm/us/data/fragments/0x14/fragment_0x14_header.o(.bss);
        build/src/fragments/0x14/fragment_0x14_EE0A0.o(.bss);
        build/src/fragments/0x14/fragment_0x14_EE5B0.o(.bss);
        build/src/fragments/0x14/fragment_0x14_EEC50.o(.bss);
        fragment_0x14_BSS_END = .;
        fragment_0x14_BSS_SIZE = ABSOLUTE(fragment_0x14_BSS_END - fragment_0x14_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x14);
    fragment_0x14_ROM_END = __romPos;
    fragment_0x14_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x3_ROM_START = __romPos;
    fragment_0x3_VRAM = ADDR(.fragment_0x3);
    .fragment_0x3 0x81300000 : AT(fragment_0x3_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x3_TEXT_START = .;
        build/asm/us/data/fragments/0x3/fragment_0x3_header.o(.text);
        build/src/fragments/0x3/fragment_0x3_F81B0.o(.text);
        build/src/fragments/0x3/fragment_0x3_FA520.o(.text);
        build/src/fragments/0x3/fragment_0x3_FAD40.o(.text);
        build/src/fragments/0x3/fragment_0x3_FCD40.o(.text);
        build/src/fragments/0x3/fragment_0x3_FD770.o(.text);
        build/src/fragments/0x3/fragment_0x3_FF070.o(.text);
        build/src/fragments/0x3/fragment_0x3_104FC0.o(.text);
        build/src/fragments/0x3/fragment_0x3_1077C0.o(.text);
        build/src/fragments/0x3/fragment_0x3_109280.o(.text);
        fragment_0x3_TEXT_END = .;
        fragment_0x3_TEXT_SIZE = ABSOLUTE(fragment_0x3_TEXT_END - fragment_0x3_TEXT_START);
        fragment_0x3_DATA_START = .;
        fragments_0x3_fragment_0x3_header = .;
        build/asm/us/data/fragments/0x3/fragment_0x3_header.o(.data);
        fragments_0x3_fragment_0x3_F81B0 = .;
        build/src/fragments/0x3/fragment_0x3_F81B0.o(.data);
        fragments_0x3_fragment_0x3_FA520 = .;
        build/src/fragments/0x3/fragment_0x3_FA520.o(.data);
        fragments_0x3_fragment_0x3_FAD40 = .;
        build/src/fragments/0x3/fragment_0x3_FAD40.o(.data);
        fragments_0x3_fragment_0x3_FCD40 = .;
        build/src/fragments/0x3/fragment_0x3_FCD40.o(.data);
        fragments_0x3_fragment_0x3_FD770 = .;
        build/src/fragments/0x3/fragment_0x3_FD770.o(.data);
        fragments_0x3_fragment_0x3_FF070 = .;
        build/src/fragments/0x3/fragment_0x3_FF070.o(.data);
        fragments_0x3_fragment_0x3_104FC0 = .;
        build/src/fragments/0x3/fragment_0x3_104FC0.o(.data);
        fragments_0x3_fragment_0x3_1077C0 = .;
        build/src/fragments/0x3/fragment_0x3_1077C0.o(.data);
        fragments_0x3_fragment_0x3_109280 = .;
        build/src/fragments/0x3/fragment_0x3_109280.o(.data);
        fragments_0x3_fragment_0x3_data_data = .;
        build/asm/us/data/fragments/0x3/fragment_0x3_data.data.o(.data);
        fragment_0x3_DATA_END = .;
        fragment_0x3_DATA_SIZE = ABSOLUTE(fragment_0x3_DATA_END - fragment_0x3_DATA_START);
        fragment_0x3_RODATA_START = .;
        build/asm/us/data/fragments/0x3/fragment_0x3_header.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_F81B0.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_FA520.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_FAD40.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_FCD40.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_FD770.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_FF070.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_104FC0.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_1077C0.o(.rodata);
        build/src/fragments/0x3/fragment_0x3_109280.o(.rodata);
        fragment_0x3_RODATA_END = .;
        fragment_0x3_RODATA_SIZE = ABSOLUTE(fragment_0x3_RODATA_END - fragment_0x3_RODATA_START);
    }
    fragment_0x3_bss_VRAM = ADDR(.fragment_0x3_bss);
    .fragment_0x3_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x3_BSS_START = .;
        build/asm/us/data/fragments/0x3/fragment_0x3_header.o(.bss);
        build/src/fragments/0x3/fragment_0x3_F81B0.o(.bss);
        build/src/fragments/0x3/fragment_0x3_FA520.o(.bss);
        build/src/fragments/0x3/fragment_0x3_FAD40.o(.bss);
        build/src/fragments/0x3/fragment_0x3_FCD40.o(.bss);
        build/src/fragments/0x3/fragment_0x3_FD770.o(.bss);
        build/src/fragments/0x3/fragment_0x3_FF070.o(.bss);
        build/src/fragments/0x3/fragment_0x3_104FC0.o(.bss);
        build/src/fragments/0x3/fragment_0x3_1077C0.o(.bss);
        build/src/fragments/0x3/fragment_0x3_109280.o(.bss);
        fragment_0x3_BSS_END = .;
        fragment_0x3_BSS_SIZE = ABSOLUTE(fragment_0x3_BSS_END - fragment_0x3_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x3);
    fragment_0x3_ROM_END = __romPos;
    fragment_0x3_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x2F_ROM_START = __romPos;
    fragment_0x2F_VRAM = ADDR(.fragment_0x2F);
    .fragment_0x2F 0x83F00000 : AT(fragment_0x2F_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x2F_TEXT_START = .;
        build/asm/us/data/fragments/0x2F/fragment_0x2F_header.o(.text);
        build/src/fragments/0x2F/fragment_0x2F_code.o(.text);
        fragment_0x2F_TEXT_END = .;
        fragment_0x2F_TEXT_SIZE = ABSOLUTE(fragment_0x2F_TEXT_END - fragment_0x2F_TEXT_START);
        fragment_0x2F_DATA_START = .;
        fragments_0x2F_fragment_0x2F_header = .;
        build/asm/us/data/fragments/0x2F/fragment_0x2F_header.o(.data);
        fragments_0x2F_fragment_0x2F_code = .;
        build/src/fragments/0x2F/fragment_0x2F_code.o(.data);
        fragments_0x2F_fragment_0x2F_data_data = .;
        build/asm/us/data/fragments/0x2F/fragment_0x2F_data.data.o(.data);
        fragment_0x2F_DATA_END = .;
        fragment_0x2F_DATA_SIZE = ABSOLUTE(fragment_0x2F_DATA_END - fragment_0x2F_DATA_START);
        fragment_0x2F_RODATA_START = .;
        build/asm/us/data/fragments/0x2F/fragment_0x2F_header.o(.rodata);
        build/src/fragments/0x2F/fragment_0x2F_code.o(.rodata);
        fragment_0x2F_RODATA_END = .;
        fragment_0x2F_RODATA_SIZE = ABSOLUTE(fragment_0x2F_RODATA_END - fragment_0x2F_RODATA_START);
    }
    fragment_0x2F_bss_VRAM = ADDR(.fragment_0x2F_bss);
    .fragment_0x2F_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x2F_BSS_START = .;
        build/asm/us/data/fragments/0x2F/fragment_0x2F_header.o(.bss);
        build/src/fragments/0x2F/fragment_0x2F_code.o(.bss);
        fragment_0x2F_BSS_END = .;
        fragment_0x2F_BSS_SIZE = ABSOLUTE(fragment_0x2F_BSS_END - fragment_0x2F_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x2F);
    fragment_0x2F_ROM_END = __romPos;
    fragment_0x2F_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x10_ROM_START = __romPos;
    fragment_0x10_VRAM = ADDR(.fragment_0x10);
    .fragment_0x10 0x82000000 : AT(fragment_0x10_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x10_TEXT_START = .;
        build/asm/us/data/fragments/0x10/fragment_0x10_header.o(.text);
        build/src/fragments/0x10/fragment_0x10_code.o(.text);
        fragment_0x10_TEXT_END = .;
        fragment_0x10_TEXT_SIZE = ABSOLUTE(fragment_0x10_TEXT_END - fragment_0x10_TEXT_START);
        fragment_0x10_DATA_START = .;
        fragments_0x10_fragment_0x10_header = .;
        build/asm/us/data/fragments/0x10/fragment_0x10_header.o(.data);
        fragments_0x10_fragment_0x10_code = .;
        build/src/fragments/0x10/fragment_0x10_code.o(.data);
        fragments_0x10_fragment_0x10_data_data = .;
        build/asm/us/data/fragments/0x10/fragment_0x10_data.data.o(.data);
        fragment_0x10_DATA_END = .;
        fragment_0x10_DATA_SIZE = ABSOLUTE(fragment_0x10_DATA_END - fragment_0x10_DATA_START);
        fragment_0x10_RODATA_START = .;
        build/asm/us/data/fragments/0x10/fragment_0x10_header.o(.rodata);
        build/src/fragments/0x10/fragment_0x10_code.o(.rodata);
        fragment_0x10_RODATA_END = .;
        fragment_0x10_RODATA_SIZE = ABSOLUTE(fragment_0x10_RODATA_END - fragment_0x10_RODATA_START);
    }
    fragment_0x10_bss_VRAM = ADDR(.fragment_0x10_bss);
    .fragment_0x10_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x10_BSS_START = .;
        build/asm/us/data/fragments/0x10/fragment_0x10_header.o(.bss);
        build/src/fragments/0x10/fragment_0x10_code.o(.bss);
        fragment_0x10_BSS_END = .;
        fragment_0x10_BSS_SIZE = ABSOLUTE(fragment_0x10_BSS_END - fragment_0x10_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x10);
    fragment_0x10_ROM_END = __romPos;
    fragment_0x10_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x12_ROM_START = __romPos;
    fragment_0x12_VRAM = ADDR(.fragment_0x12);
    .fragment_0x12 0x82200000 : AT(fragment_0x12_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x12_TEXT_START = .;
        build/asm/us/data/fragments/0x12/fragment_0x12_header.o(.text);
        build/src/fragments/0x12/fragment_0x12_10F9E0.o(.text);
        build/src/fragments/0x12/fragment_0x12_10FFC0.o(.text);
        build/src/fragments/0x12/fragment_0x12_113A60.o(.text);
        build/src/fragments/0x12/fragment_0x12_11A7F0.o(.text);
        build/src/fragments/0x12/fragment_0x12_11B210.o(.text);
        fragment_0x12_TEXT_END = .;
        fragment_0x12_TEXT_SIZE = ABSOLUTE(fragment_0x12_TEXT_END - fragment_0x12_TEXT_START);
        fragment_0x12_DATA_START = .;
        fragments_0x12_fragment_0x12_header = .;
        build/asm/us/data/fragments/0x12/fragment_0x12_header.o(.data);
        fragments_0x12_fragment_0x12_10F9E0 = .;
        build/src/fragments/0x12/fragment_0x12_10F9E0.o(.data);
        fragments_0x12_fragment_0x12_10FFC0 = .;
        build/src/fragments/0x12/fragment_0x12_10FFC0.o(.data);
        fragments_0x12_fragment_0x12_113A60 = .;
        build/src/fragments/0x12/fragment_0x12_113A60.o(.data);
        fragments_0x12_fragment_0x12_11A7F0 = .;
        build/src/fragments/0x12/fragment_0x12_11A7F0.o(.data);
        fragments_0x12_fragment_0x12_11B210 = .;
        build/src/fragments/0x12/fragment_0x12_11B210.o(.data);
        fragments_0x12_fragment_0x12_data_data = .;
        build/asm/us/data/fragments/0x12/fragment_0x12_data.data.o(.data);
        fragment_0x12_DATA_END = .;
        fragment_0x12_DATA_SIZE = ABSOLUTE(fragment_0x12_DATA_END - fragment_0x12_DATA_START);
        fragment_0x12_RODATA_START = .;
        build/asm/us/data/fragments/0x12/fragment_0x12_header.o(.rodata);
        build/src/fragments/0x12/fragment_0x12_10F9E0.o(.rodata);
        build/src/fragments/0x12/fragment_0x12_10FFC0.o(.rodata);
        build/src/fragments/0x12/fragment_0x12_113A60.o(.rodata);
        build/src/fragments/0x12/fragment_0x12_11A7F0.o(.rodata);
        build/src/fragments/0x12/fragment_0x12_11B210.o(.rodata);
        fragment_0x12_RODATA_END = .;
        fragment_0x12_RODATA_SIZE = ABSOLUTE(fragment_0x12_RODATA_END - fragment_0x12_RODATA_START);
    }
    fragment_0x12_bss_VRAM = ADDR(.fragment_0x12_bss);
    .fragment_0x12_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x12_BSS_START = .;
        build/asm/us/data/fragments/0x12/fragment_0x12_header.o(.bss);
        build/src/fragments/0x12/fragment_0x12_10F9E0.o(.bss);
        build/src/fragments/0x12/fragment_0x12_10FFC0.o(.bss);
        build/src/fragments/0x12/fragment_0x12_113A60.o(.bss);
        build/src/fragments/0x12/fragment_0x12_11A7F0.o(.bss);
        build/src/fragments/0x12/fragment_0x12_11B210.o(.bss);
        fragment_0x12_BSS_END = .;
        fragment_0x12_BSS_SIZE = ABSOLUTE(fragment_0x12_BSS_END - fragment_0x12_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x12);
    fragment_0x12_ROM_END = __romPos;
    fragment_0x12_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x7_ROM_START = __romPos;
    fragment_0x7_VRAM = ADDR(.fragment_0x7);
    .fragment_0x7 0x81700000 : AT(fragment_0x7_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7_TEXT_START = .;
        build/asm/us/data/fragments/0x7/fragment_0x7_header.o(.text);
        build/src/fragments/0x7/fragment_0x7_code.o(.text);
        fragment_0x7_TEXT_END = .;
        fragment_0x7_TEXT_SIZE = ABSOLUTE(fragment_0x7_TEXT_END - fragment_0x7_TEXT_START);
        fragment_0x7_DATA_START = .;
        fragments_0x7_fragment_0x7_header = .;
        build/asm/us/data/fragments/0x7/fragment_0x7_header.o(.data);
        fragments_0x7_fragment_0x7_code = .;
        build/src/fragments/0x7/fragment_0x7_code.o(.data);
        fragments_0x7_fragment_0x7_data_data = .;
        build/asm/us/data/fragments/0x7/fragment_0x7_data.data.o(.data);
        fragment_0x7_DATA_END = .;
        fragment_0x7_DATA_SIZE = ABSOLUTE(fragment_0x7_DATA_END - fragment_0x7_DATA_START);
        fragment_0x7_RODATA_START = .;
        build/asm/us/data/fragments/0x7/fragment_0x7_header.o(.rodata);
        build/src/fragments/0x7/fragment_0x7_code.o(.rodata);
        fragment_0x7_RODATA_END = .;
        fragment_0x7_RODATA_SIZE = ABSOLUTE(fragment_0x7_RODATA_END - fragment_0x7_RODATA_START);
    }
    fragment_0x7_bss_VRAM = ADDR(.fragment_0x7_bss);
    .fragment_0x7_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7_BSS_START = .;
        build/asm/us/data/fragments/0x7/fragment_0x7_header.o(.bss);
        build/src/fragments/0x7/fragment_0x7_code.o(.bss);
        fragment_0x7_BSS_END = .;
        fragment_0x7_BSS_SIZE = ABSOLUTE(fragment_0x7_BSS_END - fragment_0x7_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x7);
    fragment_0x7_ROM_END = __romPos;
    fragment_0x7_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x13_ROM_START = __romPos;
    fragment_0x13_VRAM = ADDR(.fragment_0x13);
    .fragment_0x13 0x82300000 : AT(fragment_0x13_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x13_TEXT_START = .;
        build/asm/us/data/fragments/0x13/fragment_0x13_header.o(.text);
        build/src/fragments/0x13/fragment_0x13_121100.o(.text);
        build/src/fragments/0x13/fragment_0x13_124E40.o(.text);
        fragment_0x13_TEXT_END = .;
        fragment_0x13_TEXT_SIZE = ABSOLUTE(fragment_0x13_TEXT_END - fragment_0x13_TEXT_START);
        fragment_0x13_DATA_START = .;
        fragments_0x13_fragment_0x13_header = .;
        build/asm/us/data/fragments/0x13/fragment_0x13_header.o(.data);
        fragments_0x13_fragment_0x13_121100 = .;
        build/src/fragments/0x13/fragment_0x13_121100.o(.data);
        fragments_0x13_fragment_0x13_124E40 = .;
        build/src/fragments/0x13/fragment_0x13_124E40.o(.data);
        fragments_0x13_fragment_0x13_data_data = .;
        build/asm/us/data/fragments/0x13/fragment_0x13_data.data.o(.data);
        fragment_0x13_DATA_END = .;
        fragment_0x13_DATA_SIZE = ABSOLUTE(fragment_0x13_DATA_END - fragment_0x13_DATA_START);
        fragment_0x13_RODATA_START = .;
        build/asm/us/data/fragments/0x13/fragment_0x13_header.o(.rodata);
        build/src/fragments/0x13/fragment_0x13_121100.o(.rodata);
        build/src/fragments/0x13/fragment_0x13_124E40.o(.rodata);
        fragment_0x13_RODATA_END = .;
        fragment_0x13_RODATA_SIZE = ABSOLUTE(fragment_0x13_RODATA_END - fragment_0x13_RODATA_START);
    }
    fragment_0x13_bss_VRAM = ADDR(.fragment_0x13_bss);
    .fragment_0x13_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x13_BSS_START = .;
        build/asm/us/data/fragments/0x13/fragment_0x13_header.o(.bss);
        build/src/fragments/0x13/fragment_0x13_121100.o(.bss);
        build/src/fragments/0x13/fragment_0x13_124E40.o(.bss);
        fragment_0x13_BSS_END = .;
        fragment_0x13_BSS_SIZE = ABSOLUTE(fragment_0x13_BSS_END - fragment_0x13_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x13);
    fragment_0x13_ROM_END = __romPos;
    fragment_0x13_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x16_ROM_START = __romPos;
    fragment_0x16_VRAM = ADDR(.fragment_0x16);
    .fragment_0x16 0x82600000 : AT(fragment_0x16_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x16_TEXT_START = .;
        build/asm/us/data/fragments/0x16/fragment_0x16_header.o(.text);
        build/src/fragments/0x16/fragment_0x16_1280F0.o(.text);
        build/src/fragments/0x16/fragment_0x16_1286C0.o(.text);
        build/src/fragments/0x16/fragment_0x16_128B10.o(.text);
        build/src/fragments/0x16/fragment_0x16_12BB60.o(.text);
        build/src/fragments/0x16/fragment_0x16_12C460.o(.text);
        fragment_0x16_TEXT_END = .;
        fragment_0x16_TEXT_SIZE = ABSOLUTE(fragment_0x16_TEXT_END - fragment_0x16_TEXT_START);
        fragment_0x16_DATA_START = .;
        fragments_0x16_fragment_0x16_header = .;
        build/asm/us/data/fragments/0x16/fragment_0x16_header.o(.data);
        fragments_0x16_fragment_0x16_1280F0 = .;
        build/src/fragments/0x16/fragment_0x16_1280F0.o(.data);
        fragments_0x16_fragment_0x16_1286C0 = .;
        build/src/fragments/0x16/fragment_0x16_1286C0.o(.data);
        fragments_0x16_fragment_0x16_128B10 = .;
        build/src/fragments/0x16/fragment_0x16_128B10.o(.data);
        fragments_0x16_fragment_0x16_12BB60 = .;
        build/src/fragments/0x16/fragment_0x16_12BB60.o(.data);
        fragments_0x16_fragment_0x16_12C460 = .;
        build/src/fragments/0x16/fragment_0x16_12C460.o(.data);
        fragments_0x16_fragment_0x16_data_data = .;
        build/asm/us/data/fragments/0x16/fragment_0x16_data.data.o(.data);
        fragment_0x16_DATA_END = .;
        fragment_0x16_DATA_SIZE = ABSOLUTE(fragment_0x16_DATA_END - fragment_0x16_DATA_START);
        fragment_0x16_RODATA_START = .;
        build/asm/us/data/fragments/0x16/fragment_0x16_header.o(.rodata);
        build/src/fragments/0x16/fragment_0x16_1280F0.o(.rodata);
        build/src/fragments/0x16/fragment_0x16_1286C0.o(.rodata);
        build/src/fragments/0x16/fragment_0x16_128B10.o(.rodata);
        build/src/fragments/0x16/fragment_0x16_12BB60.o(.rodata);
        build/src/fragments/0x16/fragment_0x16_12C460.o(.rodata);
        fragment_0x16_RODATA_END = .;
        fragment_0x16_RODATA_SIZE = ABSOLUTE(fragment_0x16_RODATA_END - fragment_0x16_RODATA_START);
    }
    fragment_0x16_bss_VRAM = ADDR(.fragment_0x16_bss);
    .fragment_0x16_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x16_BSS_START = .;
        build/asm/us/data/fragments/0x16/fragment_0x16_header.o(.bss);
        build/src/fragments/0x16/fragment_0x16_1280F0.o(.bss);
        build/src/fragments/0x16/fragment_0x16_1286C0.o(.bss);
        build/src/fragments/0x16/fragment_0x16_128B10.o(.bss);
        build/src/fragments/0x16/fragment_0x16_12BB60.o(.bss);
        build/src/fragments/0x16/fragment_0x16_12C460.o(.bss);
        fragment_0x16_BSS_END = .;
        fragment_0x16_BSS_SIZE = ABSOLUTE(fragment_0x16_BSS_END - fragment_0x16_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x16);
    fragment_0x16_ROM_END = __romPos;
    fragment_0x16_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x15_ROM_START = __romPos;
    fragment_0x15_VRAM = ADDR(.fragment_0x15);
    .fragment_0x15 0x82500000 : AT(fragment_0x15_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x15_TEXT_START = .;
        build/asm/us/data/fragments/0x15/fragment_0x15_header.o(.text);
        build/src/fragments/0x15/fragment_0x15_13FFA0.o(.text);
        build/src/fragments/0x15/fragment_0x15_144790.o(.text);
        build/src/fragments/0x15/fragment_0x15_147D10.o(.text);
        fragment_0x15_TEXT_END = .;
        fragment_0x15_TEXT_SIZE = ABSOLUTE(fragment_0x15_TEXT_END - fragment_0x15_TEXT_START);
        fragment_0x15_DATA_START = .;
        fragments_0x15_fragment_0x15_header = .;
        build/asm/us/data/fragments/0x15/fragment_0x15_header.o(.data);
        fragments_0x15_fragment_0x15_13FFA0 = .;
        build/src/fragments/0x15/fragment_0x15_13FFA0.o(.data);
        fragments_0x15_fragment_0x15_144790 = .;
        build/src/fragments/0x15/fragment_0x15_144790.o(.data);
        fragments_0x15_fragment_0x15_147D10 = .;
        build/src/fragments/0x15/fragment_0x15_147D10.o(.data);
        fragments_0x15_fragment_0x15_data_data = .;
        build/asm/us/data/fragments/0x15/fragment_0x15_data.data.o(.data);
        fragment_0x15_DATA_END = .;
        fragment_0x15_DATA_SIZE = ABSOLUTE(fragment_0x15_DATA_END - fragment_0x15_DATA_START);
        fragment_0x15_RODATA_START = .;
        build/asm/us/data/fragments/0x15/fragment_0x15_header.o(.rodata);
        build/src/fragments/0x15/fragment_0x15_13FFA0.o(.rodata);
        build/src/fragments/0x15/fragment_0x15_144790.o(.rodata);
        build/src/fragments/0x15/fragment_0x15_147D10.o(.rodata);
        fragment_0x15_RODATA_END = .;
        fragment_0x15_RODATA_SIZE = ABSOLUTE(fragment_0x15_RODATA_END - fragment_0x15_RODATA_START);
    }
    fragment_0x15_bss_VRAM = ADDR(.fragment_0x15_bss);
    .fragment_0x15_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x15_BSS_START = .;
        build/asm/us/data/fragments/0x15/fragment_0x15_header.o(.bss);
        build/src/fragments/0x15/fragment_0x15_13FFA0.o(.bss);
        build/src/fragments/0x15/fragment_0x15_144790.o(.bss);
        build/src/fragments/0x15/fragment_0x15_147D10.o(.bss);
        fragment_0x15_BSS_END = .;
        fragment_0x15_BSS_SIZE = ABSOLUTE(fragment_0x15_BSS_END - fragment_0x15_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x15);
    fragment_0x15_ROM_END = __romPos;
    fragment_0x15_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x17_ROM_START = __romPos;
    fragment_0x17_VRAM = ADDR(.fragment_0x17);
    .fragment_0x17 0x82700000 : AT(fragment_0x17_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x17_TEXT_START = .;
        build/asm/us/data/fragments/0x17/fragment_0x17_header.o(.text);
        build/src/fragments/0x17/fragment_0x17_14A2E0.o(.text);
        build/src/fragments/0x17/fragment_0x17_14B090.o(.text);
        fragment_0x17_TEXT_END = .;
        fragment_0x17_TEXT_SIZE = ABSOLUTE(fragment_0x17_TEXT_END - fragment_0x17_TEXT_START);
        fragment_0x17_DATA_START = .;
        fragments_0x17_fragment_0x17_header = .;
        build/asm/us/data/fragments/0x17/fragment_0x17_header.o(.data);
        fragments_0x17_fragment_0x17_14A2E0 = .;
        build/src/fragments/0x17/fragment_0x17_14A2E0.o(.data);
        fragments_0x17_fragment_0x17_14B090 = .;
        build/src/fragments/0x17/fragment_0x17_14B090.o(.data);
        fragments_0x17_fragment_0x17_data_data = .;
        build/asm/us/data/fragments/0x17/fragment_0x17_data.data.o(.data);
        fragment_0x17_DATA_END = .;
        fragment_0x17_DATA_SIZE = ABSOLUTE(fragment_0x17_DATA_END - fragment_0x17_DATA_START);
        fragment_0x17_RODATA_START = .;
        build/asm/us/data/fragments/0x17/fragment_0x17_header.o(.rodata);
        build/src/fragments/0x17/fragment_0x17_14A2E0.o(.rodata);
        build/src/fragments/0x17/fragment_0x17_14B090.o(.rodata);
        fragment_0x17_RODATA_END = .;
        fragment_0x17_RODATA_SIZE = ABSOLUTE(fragment_0x17_RODATA_END - fragment_0x17_RODATA_START);
    }
    fragment_0x17_bss_VRAM = ADDR(.fragment_0x17_bss);
    .fragment_0x17_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x17_BSS_START = .;
        build/asm/us/data/fragments/0x17/fragment_0x17_header.o(.bss);
        build/src/fragments/0x17/fragment_0x17_14A2E0.o(.bss);
        build/src/fragments/0x17/fragment_0x17_14B090.o(.bss);
        fragment_0x17_BSS_END = .;
        fragment_0x17_BSS_SIZE = ABSOLUTE(fragment_0x17_BSS_END - fragment_0x17_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x17);
    fragment_0x17_ROM_END = __romPos;
    fragment_0x17_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x1A_ROM_START = __romPos;
    fragment_0x1A_VRAM = ADDR(.fragment_0x1A);
    .fragment_0x1A 0x82A00000 : AT(fragment_0x1A_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1A_TEXT_START = .;
        build/asm/us/data/fragments/0x1A/fragment_0x1A_header.o(.text);
        build/src/fragments/0x1A/fragment_0x1A_code.o(.text);
        fragment_0x1A_TEXT_END = .;
        fragment_0x1A_TEXT_SIZE = ABSOLUTE(fragment_0x1A_TEXT_END - fragment_0x1A_TEXT_START);
        fragment_0x1A_DATA_START = .;
        fragments_0x1A_fragment_0x1A_header = .;
        build/asm/us/data/fragments/0x1A/fragment_0x1A_header.o(.data);
        fragments_0x1A_fragment_0x1A_code = .;
        build/src/fragments/0x1A/fragment_0x1A_code.o(.data);
        fragments_0x1A_fragment_0x1A_data_data = .;
        build/asm/us/data/fragments/0x1A/fragment_0x1A_data.data.o(.data);
        fragment_0x1A_DATA_END = .;
        fragment_0x1A_DATA_SIZE = ABSOLUTE(fragment_0x1A_DATA_END - fragment_0x1A_DATA_START);
        fragment_0x1A_RODATA_START = .;
        build/asm/us/data/fragments/0x1A/fragment_0x1A_header.o(.rodata);
        build/src/fragments/0x1A/fragment_0x1A_code.o(.rodata);
        fragment_0x1A_RODATA_END = .;
        fragment_0x1A_RODATA_SIZE = ABSOLUTE(fragment_0x1A_RODATA_END - fragment_0x1A_RODATA_START);
    }
    fragment_0x1A_bss_VRAM = ADDR(.fragment_0x1A_bss);
    .fragment_0x1A_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1A_BSS_START = .;
        build/asm/us/data/fragments/0x1A/fragment_0x1A_header.o(.bss);
        build/src/fragments/0x1A/fragment_0x1A_code.o(.bss);
        fragment_0x1A_BSS_END = .;
        fragment_0x1A_BSS_SIZE = ABSOLUTE(fragment_0x1A_BSS_END - fragment_0x1A_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x1A);
    fragment_0x1A_ROM_END = __romPos;
    fragment_0x1A_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x1B_ROM_START = __romPos;
    fragment_0x1B_VRAM = ADDR(.fragment_0x1B);
    .fragment_0x1B 0x82B00000 : AT(fragment_0x1B_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1B_TEXT_START = .;
        build/asm/us/data/fragments/0x1B/fragment_0x1B_header.o(.text);
        build/src/fragments/0x1B/fragment_0x1B_14FE20.o(.text);
        build/src/fragments/0x1B/fragment_0x1B_150C10.o(.text);
        fragment_0x1B_TEXT_END = .;
        fragment_0x1B_TEXT_SIZE = ABSOLUTE(fragment_0x1B_TEXT_END - fragment_0x1B_TEXT_START);
        fragment_0x1B_DATA_START = .;
        fragments_0x1B_fragment_0x1B_header = .;
        build/asm/us/data/fragments/0x1B/fragment_0x1B_header.o(.data);
        fragments_0x1B_fragment_0x1B_14FE20 = .;
        build/src/fragments/0x1B/fragment_0x1B_14FE20.o(.data);
        fragments_0x1B_fragment_0x1B_150C10 = .;
        build/src/fragments/0x1B/fragment_0x1B_150C10.o(.data);
        fragments_0x1B_fragment_0x1B_data_data = .;
        build/asm/us/data/fragments/0x1B/fragment_0x1B_data.data.o(.data);
        fragment_0x1B_DATA_END = .;
        fragment_0x1B_DATA_SIZE = ABSOLUTE(fragment_0x1B_DATA_END - fragment_0x1B_DATA_START);
        fragment_0x1B_RODATA_START = .;
        build/asm/us/data/fragments/0x1B/fragment_0x1B_header.o(.rodata);
        build/src/fragments/0x1B/fragment_0x1B_14FE20.o(.rodata);
        build/src/fragments/0x1B/fragment_0x1B_150C10.o(.rodata);
        fragment_0x1B_RODATA_END = .;
        fragment_0x1B_RODATA_SIZE = ABSOLUTE(fragment_0x1B_RODATA_END - fragment_0x1B_RODATA_START);
    }
    fragment_0x1B_bss_VRAM = ADDR(.fragment_0x1B_bss);
    .fragment_0x1B_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1B_BSS_START = .;
        build/asm/us/data/fragments/0x1B/fragment_0x1B_header.o(.bss);
        build/src/fragments/0x1B/fragment_0x1B_14FE20.o(.bss);
        build/src/fragments/0x1B/fragment_0x1B_150C10.o(.bss);
        fragment_0x1B_BSS_END = .;
        fragment_0x1B_BSS_SIZE = ABSOLUTE(fragment_0x1B_BSS_END - fragment_0x1B_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x1B);
    fragment_0x1B_ROM_END = __romPos;
    fragment_0x1B_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x11_ROM_START = __romPos;
    fragment_0x11_VRAM = ADDR(.fragment_0x11);
    .fragment_0x11 0x82100000 : AT(fragment_0x11_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x11_TEXT_START = .;
        build/asm/us/data/fragments/0x11/fragment_0x11_header.o(.text);
        build/src/fragments/0x11/fragment_0x11_15A060.o(.text);
        build/src/fragments/0x11/fragment_0x11_15BBC0.o(.text);
        build/src/fragments/0x11/fragment_0x11_15C920.o(.text);
        build/src/fragments/0x11/fragment_0x11_15CBC0.o(.text);
        fragment_0x11_TEXT_END = .;
        fragment_0x11_TEXT_SIZE = ABSOLUTE(fragment_0x11_TEXT_END - fragment_0x11_TEXT_START);
        fragment_0x11_DATA_START = .;
        fragments_0x11_fragment_0x11_header = .;
        build/asm/us/data/fragments/0x11/fragment_0x11_header.o(.data);
        fragments_0x11_fragment_0x11_15A060 = .;
        build/src/fragments/0x11/fragment_0x11_15A060.o(.data);
        fragments_0x11_fragment_0x11_15BBC0 = .;
        build/src/fragments/0x11/fragment_0x11_15BBC0.o(.data);
        fragments_0x11_fragment_0x11_15C920 = .;
        build/src/fragments/0x11/fragment_0x11_15C920.o(.data);
        fragments_0x11_fragment_0x11_15CBC0 = .;
        build/src/fragments/0x11/fragment_0x11_15CBC0.o(.data);
        fragments_0x11_fragment_0x11_data_data = .;
        build/asm/us/data/fragments/0x11/fragment_0x11_data.data.o(.data);
        fragment_0x11_DATA_END = .;
        fragment_0x11_DATA_SIZE = ABSOLUTE(fragment_0x11_DATA_END - fragment_0x11_DATA_START);
        fragment_0x11_RODATA_START = .;
        build/asm/us/data/fragments/0x11/fragment_0x11_header.o(.rodata);
        build/src/fragments/0x11/fragment_0x11_15A060.o(.rodata);
        build/src/fragments/0x11/fragment_0x11_15BBC0.o(.rodata);
        build/src/fragments/0x11/fragment_0x11_15C920.o(.rodata);
        build/src/fragments/0x11/fragment_0x11_15CBC0.o(.rodata);
        fragment_0x11_RODATA_END = .;
        fragment_0x11_RODATA_SIZE = ABSOLUTE(fragment_0x11_RODATA_END - fragment_0x11_RODATA_START);
    }
    fragment_0x11_bss_VRAM = ADDR(.fragment_0x11_bss);
    .fragment_0x11_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x11_BSS_START = .;
        build/asm/us/data/fragments/0x11/fragment_0x11_header.o(.bss);
        build/src/fragments/0x11/fragment_0x11_15A060.o(.bss);
        build/src/fragments/0x11/fragment_0x11_15BBC0.o(.bss);
        build/src/fragments/0x11/fragment_0x11_15C920.o(.bss);
        build/src/fragments/0x11/fragment_0x11_15CBC0.o(.bss);
        fragment_0x11_BSS_END = .;
        fragment_0x11_BSS_SIZE = ABSOLUTE(fragment_0x11_BSS_END - fragment_0x11_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x11);
    fragment_0x11_ROM_END = __romPos;
    fragment_0x11_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x0_ROM_START = __romPos;
    fragment_0x0_VRAM = ADDR(.fragment_0x0);
    .fragment_0x0 0x81000000 : AT(fragment_0x0_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x0_TEXT_START = .;
        build/asm/us/data/fragments/0x0/fragment_0x0_header.o(.text);
        build/asm/us/data/fragments/0x0/fragment_0x0_unk_table.o(.text);
        build/src/fragments/0x0/fragment_0x0_15EA30.o(.text);
        build/src/fragments/0x0/fragment_0x0_162090.o(.text);
        build/src/fragments/0x0/fragment_0x0_1622D0.o(.text);
        build/src/fragments/0x0/fragment_0x0_162370.o(.text);
        build/src/fragments/0x0/fragment_0x0_1624E0.o(.text);
        build/src/fragments/0x0/fragment_0x0_162710.o(.text);
        build/src/fragments/0x0/fragment_0x0_164280.o(.text);
        build/src/fragments/0x0/fragment_0x0_164400.o(.text);
        build/src/fragments/0x0/fragment_0x0_1646B0.o(.text);
        build/src/fragments/0x0/fragment_0x0_164860.o(.text);
        fragment_0x0_TEXT_END = .;
        fragment_0x0_TEXT_SIZE = ABSOLUTE(fragment_0x0_TEXT_END - fragment_0x0_TEXT_START);
        fragment_0x0_DATA_START = .;
        fragments_0x0_fragment_0x0_header = .;
        build/asm/us/data/fragments/0x0/fragment_0x0_header.o(.data);
        fragments_0x0_fragment_0x0_unk_table = .;
        build/asm/us/data/fragments/0x0/fragment_0x0_unk_table.o(.data);
        fragments_0x0_fragment_0x0_15EA30 = .;
        build/src/fragments/0x0/fragment_0x0_15EA30.o(.data);
        fragments_0x0_fragment_0x0_162090 = .;
        build/src/fragments/0x0/fragment_0x0_162090.o(.data);
        fragments_0x0_fragment_0x0_1622D0 = .;
        build/src/fragments/0x0/fragment_0x0_1622D0.o(.data);
        fragments_0x0_fragment_0x0_162370 = .;
        build/src/fragments/0x0/fragment_0x0_162370.o(.data);
        fragments_0x0_fragment_0x0_1624E0 = .;
        build/src/fragments/0x0/fragment_0x0_1624E0.o(.data);
        fragments_0x0_fragment_0x0_162710 = .;
        build/src/fragments/0x0/fragment_0x0_162710.o(.data);
        fragments_0x0_fragment_0x0_164280 = .;
        build/src/fragments/0x0/fragment_0x0_164280.o(.data);
        fragments_0x0_fragment_0x0_164400 = .;
        build/src/fragments/0x0/fragment_0x0_164400.o(.data);
        fragments_0x0_fragment_0x0_1646B0 = .;
        build/src/fragments/0x0/fragment_0x0_1646B0.o(.data);
        fragments_0x0_fragment_0x0_164860 = .;
        build/src/fragments/0x0/fragment_0x0_164860.o(.data);
        fragments_0x0_fragment_0x0_data_data = .;
        build/asm/us/data/fragments/0x0/fragment_0x0_data.data.o(.data);
        fragment_0x0_DATA_END = .;
        fragment_0x0_DATA_SIZE = ABSOLUTE(fragment_0x0_DATA_END - fragment_0x0_DATA_START);
        fragment_0x0_RODATA_START = .;
        build/asm/us/data/fragments/0x0/fragment_0x0_header.o(.rodata);
        build/asm/us/data/fragments/0x0/fragment_0x0_unk_table.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_15EA30.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_162090.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_1622D0.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_162370.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_1624E0.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_162710.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_164280.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_164400.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_1646B0.o(.rodata);
        build/src/fragments/0x0/fragment_0x0_164860.o(.rodata);
        fragment_0x0_RODATA_END = .;
        fragment_0x0_RODATA_SIZE = ABSOLUTE(fragment_0x0_RODATA_END - fragment_0x0_RODATA_START);
    }
    fragment_0x0_bss_VRAM = ADDR(.fragment_0x0_bss);
    .fragment_0x0_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x0_BSS_START = .;
        build/asm/us/data/fragments/0x0/fragment_0x0_header.o(.bss);
        build/asm/us/data/fragments/0x0/fragment_0x0_unk_table.o(.bss);
        build/src/fragments/0x0/fragment_0x0_15EA30.o(.bss);
        build/src/fragments/0x0/fragment_0x0_162090.o(.bss);
        build/src/fragments/0x0/fragment_0x0_1622D0.o(.bss);
        build/src/fragments/0x0/fragment_0x0_162370.o(.bss);
        build/src/fragments/0x0/fragment_0x0_1624E0.o(.bss);
        build/src/fragments/0x0/fragment_0x0_162710.o(.bss);
        build/src/fragments/0x0/fragment_0x0_164280.o(.bss);
        build/src/fragments/0x0/fragment_0x0_164400.o(.bss);
        build/src/fragments/0x0/fragment_0x0_1646B0.o(.bss);
        build/src/fragments/0x0/fragment_0x0_164860.o(.bss);
        fragment_0x0_BSS_END = .;
        fragment_0x0_BSS_SIZE = ABSOLUTE(fragment_0x0_BSS_END - fragment_0x0_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x0);
    fragment_0x0_ROM_END = __romPos;
    fragment_0x0_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x1_ROM_START = __romPos;
    fragment_0x1_VRAM = ADDR(.fragment_0x1);
    .fragment_0x1 0x81100000 : AT(fragment_0x1_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1_TEXT_START = .;
        build/asm/us/data/fragments/0x1/fragment_0x1_header.o(.text);
        build/src/fragments/0x1/fragment_0x1_code.o(.text);
        fragment_0x1_TEXT_END = .;
        fragment_0x1_TEXT_SIZE = ABSOLUTE(fragment_0x1_TEXT_END - fragment_0x1_TEXT_START);
        fragment_0x1_DATA_START = .;
        fragments_0x1_fragment_0x1_header = .;
        build/asm/us/data/fragments/0x1/fragment_0x1_header.o(.data);
        fragments_0x1_fragment_0x1_code = .;
        build/src/fragments/0x1/fragment_0x1_code.o(.data);
        fragments_0x1_fragment_0x1_data_data = .;
        build/asm/us/data/fragments/0x1/fragment_0x1_data.data.o(.data);
        fragment_0x1_DATA_END = .;
        fragment_0x1_DATA_SIZE = ABSOLUTE(fragment_0x1_DATA_END - fragment_0x1_DATA_START);
        fragment_0x1_RODATA_START = .;
        build/asm/us/data/fragments/0x1/fragment_0x1_header.o(.rodata);
        build/src/fragments/0x1/fragment_0x1_code.o(.rodata);
        fragment_0x1_RODATA_END = .;
        fragment_0x1_RODATA_SIZE = ABSOLUTE(fragment_0x1_RODATA_END - fragment_0x1_RODATA_START);
    }
    fragment_0x1_bss_VRAM = ADDR(.fragment_0x1_bss);
    .fragment_0x1_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1_BSS_START = .;
        build/asm/us/data/fragments/0x1/fragment_0x1_header.o(.bss);
        build/src/fragments/0x1/fragment_0x1_code.o(.bss);
        fragment_0x1_BSS_END = .;
        fragment_0x1_BSS_SIZE = ABSOLUTE(fragment_0x1_BSS_END - fragment_0x1_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x1);
    fragment_0x1_ROM_END = __romPos;
    fragment_0x1_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xEE_ROM_START = __romPos;
    fragment_0xEE_VRAM = ADDR(.fragment_0xEE);
    .fragment_0xEE 0x8FE00000 : AT(fragment_0xEE_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xEE_TEXT_START = .;
        build/asm/us/data/fragments/0xEE/fragment_0xEE_header.o(.text);
        build/src/fragments/0xEE/fragment_0xEE_code.o(.text);
        fragment_0xEE_TEXT_END = .;
        fragment_0xEE_TEXT_SIZE = ABSOLUTE(fragment_0xEE_TEXT_END - fragment_0xEE_TEXT_START);
        fragment_0xEE_DATA_START = .;
        fragments_0xEE_fragment_0xEE_header = .;
        build/asm/us/data/fragments/0xEE/fragment_0xEE_header.o(.data);
        fragments_0xEE_fragment_0xEE_code = .;
        build/src/fragments/0xEE/fragment_0xEE_code.o(.data);
        fragments_0xEE_fragment_0xEE_data_data = .;
        build/asm/us/data/fragments/0xEE/fragment_0xEE_data.data.o(.data);
        fragment_0xEE_DATA_END = .;
        fragment_0xEE_DATA_SIZE = ABSOLUTE(fragment_0xEE_DATA_END - fragment_0xEE_DATA_START);
        fragment_0xEE_RODATA_START = .;
        build/asm/us/data/fragments/0xEE/fragment_0xEE_header.o(.rodata);
        build/src/fragments/0xEE/fragment_0xEE_code.o(.rodata);
        fragment_0xEE_RODATA_END = .;
        fragment_0xEE_RODATA_SIZE = ABSOLUTE(fragment_0xEE_RODATA_END - fragment_0xEE_RODATA_START);
    }
    fragment_0xEE_bss_VRAM = ADDR(.fragment_0xEE_bss);
    .fragment_0xEE_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xEE_BSS_START = .;
        build/asm/us/data/fragments/0xEE/fragment_0xEE_header.o(.bss);
        build/src/fragments/0xEE/fragment_0xEE_code.o(.bss);
        fragment_0xEE_BSS_END = .;
        fragment_0xEE_BSS_SIZE = ABSOLUTE(fragment_0xEE_BSS_END - fragment_0xEE_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xEE);
    fragment_0xEE_ROM_END = __romPos;
    fragment_0xEE_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x70_ROM_START = __romPos;
    fragment_0x70_VRAM = ADDR(.fragment_0x70);
    .fragment_0x70 0x88000000 : AT(fragment_0x70_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x70_TEXT_START = .;
        build/asm/us/data/fragments/0x70/fragment_0x70_header.o(.text);
        build/src/fragments/0x70/fragment_0x70_166060.o(.text);
        build/src/fragments/0x70/fragment_0x70_167940.o(.text);
        build/src/fragments/0x70/fragment_0x70_168330.o(.text);
        build/src/fragments/0x70/fragment_0x70_16AA30.o(.text);
        build/src/fragments/0x70/fragment_0x70_16AEF0.o(.text);
        build/src/fragments/0x70/fragment_0x70_16B030.o(.text);
        build/src/fragments/0x70/fragment_0x70_16BBA0.o(.text);
        fragment_0x70_TEXT_END = .;
        fragment_0x70_TEXT_SIZE = ABSOLUTE(fragment_0x70_TEXT_END - fragment_0x70_TEXT_START);
        fragment_0x70_DATA_START = .;
        fragments_0x70_fragment_0x70_header = .;
        build/asm/us/data/fragments/0x70/fragment_0x70_header.o(.data);
        fragments_0x70_fragment_0x70_166060 = .;
        build/src/fragments/0x70/fragment_0x70_166060.o(.data);
        fragments_0x70_fragment_0x70_167940 = .;
        build/src/fragments/0x70/fragment_0x70_167940.o(.data);
        fragments_0x70_fragment_0x70_168330 = .;
        build/src/fragments/0x70/fragment_0x70_168330.o(.data);
        fragments_0x70_fragment_0x70_16AA30 = .;
        build/src/fragments/0x70/fragment_0x70_16AA30.o(.data);
        fragments_0x70_fragment_0x70_16AEF0 = .;
        build/src/fragments/0x70/fragment_0x70_16AEF0.o(.data);
        fragments_0x70_fragment_0x70_16B030 = .;
        build/src/fragments/0x70/fragment_0x70_16B030.o(.data);
        fragments_0x70_fragment_0x70_16BBA0 = .;
        build/src/fragments/0x70/fragment_0x70_16BBA0.o(.data);
        fragments_0x70_fragment_0x70_data_data = .;
        build/asm/us/data/fragments/0x70/fragment_0x70_data.data.o(.data);
        fragment_0x70_DATA_END = .;
        fragment_0x70_DATA_SIZE = ABSOLUTE(fragment_0x70_DATA_END - fragment_0x70_DATA_START);
        fragment_0x70_RODATA_START = .;
        build/asm/us/data/fragments/0x70/fragment_0x70_header.o(.rodata);
        build/src/fragments/0x70/fragment_0x70_166060.o(.rodata);
        build/src/fragments/0x70/fragment_0x70_167940.o(.rodata);
        build/src/fragments/0x70/fragment_0x70_168330.o(.rodata);
        build/src/fragments/0x70/fragment_0x70_16AA30.o(.rodata);
        build/src/fragments/0x70/fragment_0x70_16AEF0.o(.rodata);
        build/src/fragments/0x70/fragment_0x70_16B030.o(.rodata);
        build/src/fragments/0x70/fragment_0x70_16BBA0.o(.rodata);
        fragment_0x70_RODATA_END = .;
        fragment_0x70_RODATA_SIZE = ABSOLUTE(fragment_0x70_RODATA_END - fragment_0x70_RODATA_START);
    }
    fragment_0x70_bss_VRAM = ADDR(.fragment_0x70_bss);
    .fragment_0x70_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x70_BSS_START = .;
        build/asm/us/data/fragments/0x70/fragment_0x70_header.o(.bss);
        build/src/fragments/0x70/fragment_0x70_166060.o(.bss);
        build/src/fragments/0x70/fragment_0x70_167940.o(.bss);
        build/src/fragments/0x70/fragment_0x70_168330.o(.bss);
        build/src/fragments/0x70/fragment_0x70_16AA30.o(.bss);
        build/src/fragments/0x70/fragment_0x70_16AEF0.o(.bss);
        build/src/fragments/0x70/fragment_0x70_16B030.o(.bss);
        build/src/fragments/0x70/fragment_0x70_16BBA0.o(.bss);
        fragment_0x70_BSS_END = .;
        fragment_0x70_BSS_SIZE = ABSOLUTE(fragment_0x70_BSS_END - fragment_0x70_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x70);
    fragment_0x70_ROM_END = __romPos;
    fragment_0x70_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x71_ROM_START = __romPos;
    fragment_0x71_VRAM = ADDR(.fragment_0x71);
    .fragment_0x71 0x88100000 : AT(fragment_0x71_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x71_TEXT_START = .;
        build/asm/us/data/fragments/0x71/fragment_0x71_header.o(.text);
        build/src/fragments/0x71/fragment_0x71_16D4F0.o(.text);
        build/src/fragments/0x71/fragment_0x71_170430.o(.text);
        build/src/fragments/0x71/fragment_0x71_170D70.o(.text);
        fragment_0x71_TEXT_END = .;
        fragment_0x71_TEXT_SIZE = ABSOLUTE(fragment_0x71_TEXT_END - fragment_0x71_TEXT_START);
        fragment_0x71_DATA_START = .;
        fragments_0x71_fragment_0x71_header = .;
        build/asm/us/data/fragments/0x71/fragment_0x71_header.o(.data);
        fragments_0x71_fragment_0x71_16D4F0 = .;
        build/src/fragments/0x71/fragment_0x71_16D4F0.o(.data);
        fragments_0x71_fragment_0x71_170430 = .;
        build/src/fragments/0x71/fragment_0x71_170430.o(.data);
        fragments_0x71_fragment_0x71_170D70 = .;
        build/src/fragments/0x71/fragment_0x71_170D70.o(.data);
        fragments_0x71_fragment_0x71_data_data = .;
        build/asm/us/data/fragments/0x71/fragment_0x71_data.data.o(.data);
        fragment_0x71_DATA_END = .;
        fragment_0x71_DATA_SIZE = ABSOLUTE(fragment_0x71_DATA_END - fragment_0x71_DATA_START);
        fragment_0x71_RODATA_START = .;
        build/asm/us/data/fragments/0x71/fragment_0x71_header.o(.rodata);
        build/src/fragments/0x71/fragment_0x71_16D4F0.o(.rodata);
        build/src/fragments/0x71/fragment_0x71_170430.o(.rodata);
        build/src/fragments/0x71/fragment_0x71_170D70.o(.rodata);
        fragment_0x71_RODATA_END = .;
        fragment_0x71_RODATA_SIZE = ABSOLUTE(fragment_0x71_RODATA_END - fragment_0x71_RODATA_START);
    }
    fragment_0x71_bss_VRAM = ADDR(.fragment_0x71_bss);
    .fragment_0x71_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x71_BSS_START = .;
        build/asm/us/data/fragments/0x71/fragment_0x71_header.o(.bss);
        build/src/fragments/0x71/fragment_0x71_16D4F0.o(.bss);
        build/src/fragments/0x71/fragment_0x71_170430.o(.bss);
        build/src/fragments/0x71/fragment_0x71_170D70.o(.bss);
        fragment_0x71_BSS_END = .;
        fragment_0x71_BSS_SIZE = ABSOLUTE(fragment_0x71_BSS_END - fragment_0x71_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x71);
    fragment_0x71_ROM_END = __romPos;
    fragment_0x71_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x72_ROM_START = __romPos;
    fragment_0x72_VRAM = ADDR(.fragment_0x72);
    .fragment_0x72 0x88200000 : AT(fragment_0x72_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x72_TEXT_START = .;
        build/asm/us/data/fragments/0x72/fragment_0x72_header.o(.text);
        build/src/fragments/0x72/fragment_0x72_1732A0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1736F0.o(.text);
        build/src/fragments/0x72/fragment_0x72_174460.o(.text);
        build/src/fragments/0x72/fragment_0x72_175260.o(.text);
        build/src/fragments/0x72/fragment_0x72_1768F0.o(.text);
        build/src/fragments/0x72/fragment_0x72_177430.o(.text);
        build/src/fragments/0x72/fragment_0x72_179030.o(.text);
        build/src/fragments/0x72/fragment_0x72_17B150.o(.text);
        build/src/fragments/0x72/fragment_0x72_17F280.o(.text);
        build/src/fragments/0x72/fragment_0x72_183700.o(.text);
        build/src/fragments/0x72/fragment_0x72_186690.o(.text);
        build/src/fragments/0x72/fragment_0x72_18F6D0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1900C0.o(.text);
        build/src/fragments/0x72/fragment_0x72_190BB0.o(.text);
        build/src/fragments/0x72/fragment_0x72_193D50.o(.text);
        build/src/fragments/0x72/fragment_0x72_194450.o(.text);
        build/src/fragments/0x72/fragment_0x72_194C30.o(.text);
        build/src/fragments/0x72/fragment_0x72_195910.o(.text);
        build/src/fragments/0x72/fragment_0x72_1965A0.o(.text);
        build/src/fragments/0x72/fragment_0x72_197640.o(.text);
        build/src/fragments/0x72/fragment_0x72_19BCA0.o(.text);
        build/src/fragments/0x72/fragment_0x72_19C000.o(.text);
        build/src/fragments/0x72/fragment_0x72_19C390.o(.text);
        build/src/fragments/0x72/fragment_0x72_19CD60.o(.text);
        build/src/fragments/0x72/fragment_0x72_19D160.o(.text);
        build/src/fragments/0x72/fragment_0x72_19DCA0.o(.text);
        build/src/fragments/0x72/fragment_0x72_19DFC0.o(.text);
        build/src/fragments/0x72/fragment_0x72_19E800.o(.text);
        build/src/fragments/0x72/fragment_0x72_19F570.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A03C0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A1AF0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A1BD0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A3540.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A3730.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A3960.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A4160.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A43F0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A46B0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A4B70.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A4FF0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A51E0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A53B0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A5AE0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A5E10.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A60F0.o(.text);
        build/src/fragments/0x72/fragment_0x72_1A6360.o(.text);
        fragment_0x72_TEXT_END = .;
        fragment_0x72_TEXT_SIZE = ABSOLUTE(fragment_0x72_TEXT_END - fragment_0x72_TEXT_START);
        fragment_0x72_DATA_START = .;
        fragments_0x72_fragment_0x72_header = .;
        build/asm/us/data/fragments/0x72/fragment_0x72_header.o(.data);
        fragments_0x72_fragment_0x72_1732A0 = .;
        build/src/fragments/0x72/fragment_0x72_1732A0.o(.data);
        fragments_0x72_fragment_0x72_1736F0 = .;
        build/src/fragments/0x72/fragment_0x72_1736F0.o(.data);
        fragments_0x72_fragment_0x72_174460 = .;
        build/src/fragments/0x72/fragment_0x72_174460.o(.data);
        fragments_0x72_fragment_0x72_175260 = .;
        build/src/fragments/0x72/fragment_0x72_175260.o(.data);
        fragments_0x72_fragment_0x72_1768F0 = .;
        build/src/fragments/0x72/fragment_0x72_1768F0.o(.data);
        fragments_0x72_fragment_0x72_177430 = .;
        build/src/fragments/0x72/fragment_0x72_177430.o(.data);
        fragments_0x72_fragment_0x72_179030 = .;
        build/src/fragments/0x72/fragment_0x72_179030.o(.data);
        fragments_0x72_fragment_0x72_17B150 = .;
        build/src/fragments/0x72/fragment_0x72_17B150.o(.data);
        fragments_0x72_fragment_0x72_17F280 = .;
        build/src/fragments/0x72/fragment_0x72_17F280.o(.data);
        fragments_0x72_fragment_0x72_183700 = .;
        build/src/fragments/0x72/fragment_0x72_183700.o(.data);
        fragments_0x72_fragment_0x72_186690 = .;
        build/src/fragments/0x72/fragment_0x72_186690.o(.data);
        fragments_0x72_fragment_0x72_18F6D0 = .;
        build/src/fragments/0x72/fragment_0x72_18F6D0.o(.data);
        fragments_0x72_fragment_0x72_1900C0 = .;
        build/src/fragments/0x72/fragment_0x72_1900C0.o(.data);
        fragments_0x72_fragment_0x72_190BB0 = .;
        build/src/fragments/0x72/fragment_0x72_190BB0.o(.data);
        fragments_0x72_fragment_0x72_193D50 = .;
        build/src/fragments/0x72/fragment_0x72_193D50.o(.data);
        fragments_0x72_fragment_0x72_194450 = .;
        build/src/fragments/0x72/fragment_0x72_194450.o(.data);
        fragments_0x72_fragment_0x72_194C30 = .;
        build/src/fragments/0x72/fragment_0x72_194C30.o(.data);
        fragments_0x72_fragment_0x72_195910 = .;
        build/src/fragments/0x72/fragment_0x72_195910.o(.data);
        fragments_0x72_fragment_0x72_1965A0 = .;
        build/src/fragments/0x72/fragment_0x72_1965A0.o(.data);
        fragments_0x72_fragment_0x72_197640 = .;
        build/src/fragments/0x72/fragment_0x72_197640.o(.data);
        fragments_0x72_fragment_0x72_19BCA0 = .;
        build/src/fragments/0x72/fragment_0x72_19BCA0.o(.data);
        fragments_0x72_fragment_0x72_19C000 = .;
        build/src/fragments/0x72/fragment_0x72_19C000.o(.data);
        fragments_0x72_fragment_0x72_19C390 = .;
        build/src/fragments/0x72/fragment_0x72_19C390.o(.data);
        fragments_0x72_fragment_0x72_19CD60 = .;
        build/src/fragments/0x72/fragment_0x72_19CD60.o(.data);
        fragments_0x72_fragment_0x72_19D160 = .;
        build/src/fragments/0x72/fragment_0x72_19D160.o(.data);
        fragments_0x72_fragment_0x72_19DCA0 = .;
        build/src/fragments/0x72/fragment_0x72_19DCA0.o(.data);
        fragments_0x72_fragment_0x72_19DFC0 = .;
        build/src/fragments/0x72/fragment_0x72_19DFC0.o(.data);
        fragments_0x72_fragment_0x72_19E800 = .;
        build/src/fragments/0x72/fragment_0x72_19E800.o(.data);
        fragments_0x72_fragment_0x72_19F570 = .;
        build/src/fragments/0x72/fragment_0x72_19F570.o(.data);
        fragments_0x72_fragment_0x72_1A03C0 = .;
        build/src/fragments/0x72/fragment_0x72_1A03C0.o(.data);
        fragments_0x72_fragment_0x72_1A1AF0 = .;
        build/src/fragments/0x72/fragment_0x72_1A1AF0.o(.data);
        fragments_0x72_fragment_0x72_1A1BD0 = .;
        build/src/fragments/0x72/fragment_0x72_1A1BD0.o(.data);
        fragments_0x72_fragment_0x72_1A3540 = .;
        build/src/fragments/0x72/fragment_0x72_1A3540.o(.data);
        fragments_0x72_fragment_0x72_1A3730 = .;
        build/src/fragments/0x72/fragment_0x72_1A3730.o(.data);
        fragments_0x72_fragment_0x72_1A3960 = .;
        build/src/fragments/0x72/fragment_0x72_1A3960.o(.data);
        fragments_0x72_fragment_0x72_1A4160 = .;
        build/src/fragments/0x72/fragment_0x72_1A4160.o(.data);
        fragments_0x72_fragment_0x72_1A43F0 = .;
        build/src/fragments/0x72/fragment_0x72_1A43F0.o(.data);
        fragments_0x72_fragment_0x72_1A46B0 = .;
        build/src/fragments/0x72/fragment_0x72_1A46B0.o(.data);
        fragments_0x72_fragment_0x72_1A4B70 = .;
        build/src/fragments/0x72/fragment_0x72_1A4B70.o(.data);
        fragments_0x72_fragment_0x72_1A4FF0 = .;
        build/src/fragments/0x72/fragment_0x72_1A4FF0.o(.data);
        fragments_0x72_fragment_0x72_1A51E0 = .;
        build/src/fragments/0x72/fragment_0x72_1A51E0.o(.data);
        fragments_0x72_fragment_0x72_1A53B0 = .;
        build/src/fragments/0x72/fragment_0x72_1A53B0.o(.data);
        fragments_0x72_fragment_0x72_1A5AE0 = .;
        build/src/fragments/0x72/fragment_0x72_1A5AE0.o(.data);
        fragments_0x72_fragment_0x72_1A5E10 = .;
        build/src/fragments/0x72/fragment_0x72_1A5E10.o(.data);
        fragments_0x72_fragment_0x72_1A60F0 = .;
        build/src/fragments/0x72/fragment_0x72_1A60F0.o(.data);
        fragments_0x72_fragment_0x72_1A6360 = .;
        build/src/fragments/0x72/fragment_0x72_1A6360.o(.data);
        fragments_0x72_fragment_0x72_data_data = .;
        build/asm/us/data/fragments/0x72/fragment_0x72_data.data.o(.data);
        fragment_0x72_DATA_END = .;
        fragment_0x72_DATA_SIZE = ABSOLUTE(fragment_0x72_DATA_END - fragment_0x72_DATA_START);
        fragment_0x72_RODATA_START = .;
        build/asm/us/data/fragments/0x72/fragment_0x72_header.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1732A0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1736F0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_174460.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_175260.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1768F0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_177430.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_179030.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_17B150.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_17F280.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_183700.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_186690.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_18F6D0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1900C0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_190BB0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_193D50.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_194450.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_194C30.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_195910.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1965A0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_197640.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19BCA0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19C000.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19C390.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19CD60.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19D160.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19DCA0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19DFC0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19E800.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_19F570.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A03C0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A1AF0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A1BD0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A3540.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A3730.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A3960.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A4160.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A43F0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A46B0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A4B70.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A4FF0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A51E0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A53B0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A5AE0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A5E10.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A60F0.o(.rodata);
        build/src/fragments/0x72/fragment_0x72_1A6360.o(.rodata);
        fragment_0x72_RODATA_END = .;
        fragment_0x72_RODATA_SIZE = ABSOLUTE(fragment_0x72_RODATA_END - fragment_0x72_RODATA_START);
    }
    fragment_0x72_bss_VRAM = ADDR(.fragment_0x72_bss);
    .fragment_0x72_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x72_BSS_START = .;
        build/asm/us/data/fragments/0x72/fragment_0x72_header.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1732A0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1736F0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_174460.o(.bss);
        build/src/fragments/0x72/fragment_0x72_175260.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1768F0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_177430.o(.bss);
        build/src/fragments/0x72/fragment_0x72_179030.o(.bss);
        build/src/fragments/0x72/fragment_0x72_17B150.o(.bss);
        build/src/fragments/0x72/fragment_0x72_17F280.o(.bss);
        build/src/fragments/0x72/fragment_0x72_183700.o(.bss);
        build/src/fragments/0x72/fragment_0x72_186690.o(.bss);
        build/src/fragments/0x72/fragment_0x72_18F6D0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1900C0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_190BB0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_193D50.o(.bss);
        build/src/fragments/0x72/fragment_0x72_194450.o(.bss);
        build/src/fragments/0x72/fragment_0x72_194C30.o(.bss);
        build/src/fragments/0x72/fragment_0x72_195910.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1965A0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_197640.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19BCA0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19C000.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19C390.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19CD60.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19D160.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19DCA0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19DFC0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19E800.o(.bss);
        build/src/fragments/0x72/fragment_0x72_19F570.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A03C0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A1AF0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A1BD0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A3540.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A3730.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A3960.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A4160.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A43F0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A46B0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A4B70.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A4FF0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A51E0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A53B0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A5AE0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A5E10.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A60F0.o(.bss);
        build/src/fragments/0x72/fragment_0x72_1A6360.o(.bss);
        fragment_0x72_BSS_END = .;
        fragment_0x72_BSS_SIZE = ABSOLUTE(fragment_0x72_BSS_END - fragment_0x72_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x72);
    fragment_0x72_ROM_END = __romPos;
    fragment_0x72_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x73_ROM_START = __romPos;
    fragment_0x73_VRAM = ADDR(.fragment_0x73);
    .fragment_0x73 0x88300000 : AT(fragment_0x73_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x73_TEXT_START = .;
        build/asm/us/data/fragments/0x73/fragment_0x73_header.o(.text);
        build/src/fragments/0x73/fragment_0x73_1B1330.o(.text);
        build/src/fragments/0x73/fragment_0x73_1B6E40.o(.text);
        build/src/fragments/0x73/fragment_0x73_1B8010.o(.text);
        build/src/fragments/0x73/fragment_0x73_1B8DE0.o(.text);
        build/src/fragments/0x73/fragment_0x73_1B92C0.o(.text);
        build/src/fragments/0x73/fragment_0x73_1B9390.o(.text);
        build/src/fragments/0x73/fragment_0x73_1B9840.o(.text);
        fragment_0x73_TEXT_END = .;
        fragment_0x73_TEXT_SIZE = ABSOLUTE(fragment_0x73_TEXT_END - fragment_0x73_TEXT_START);
        fragment_0x73_DATA_START = .;
        fragments_0x73_fragment_0x73_header = .;
        build/asm/us/data/fragments/0x73/fragment_0x73_header.o(.data);
        fragments_0x73_fragment_0x73_1B1330 = .;
        build/src/fragments/0x73/fragment_0x73_1B1330.o(.data);
        fragments_0x73_fragment_0x73_1B6E40 = .;
        build/src/fragments/0x73/fragment_0x73_1B6E40.o(.data);
        fragments_0x73_fragment_0x73_1B8010 = .;
        build/src/fragments/0x73/fragment_0x73_1B8010.o(.data);
        fragments_0x73_fragment_0x73_1B8DE0 = .;
        build/src/fragments/0x73/fragment_0x73_1B8DE0.o(.data);
        fragments_0x73_fragment_0x73_1B92C0 = .;
        build/src/fragments/0x73/fragment_0x73_1B92C0.o(.data);
        fragments_0x73_fragment_0x73_1B9390 = .;
        build/src/fragments/0x73/fragment_0x73_1B9390.o(.data);
        fragments_0x73_fragment_0x73_1B9840 = .;
        build/src/fragments/0x73/fragment_0x73_1B9840.o(.data);
        fragments_0x73_fragment_0x73_data_data = .;
        build/asm/us/data/fragments/0x73/fragment_0x73_data.data.o(.data);
        fragment_0x73_DATA_END = .;
        fragment_0x73_DATA_SIZE = ABSOLUTE(fragment_0x73_DATA_END - fragment_0x73_DATA_START);
        fragment_0x73_RODATA_START = .;
        build/asm/us/data/fragments/0x73/fragment_0x73_header.o(.rodata);
        build/src/fragments/0x73/fragment_0x73_1B1330.o(.rodata);
        build/src/fragments/0x73/fragment_0x73_1B6E40.o(.rodata);
        build/src/fragments/0x73/fragment_0x73_1B8010.o(.rodata);
        build/src/fragments/0x73/fragment_0x73_1B8DE0.o(.rodata);
        build/src/fragments/0x73/fragment_0x73_1B92C0.o(.rodata);
        build/src/fragments/0x73/fragment_0x73_1B9390.o(.rodata);
        build/src/fragments/0x73/fragment_0x73_1B9840.o(.rodata);
        fragment_0x73_RODATA_END = .;
        fragment_0x73_RODATA_SIZE = ABSOLUTE(fragment_0x73_RODATA_END - fragment_0x73_RODATA_START);
    }
    fragment_0x73_bss_VRAM = ADDR(.fragment_0x73_bss);
    .fragment_0x73_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x73_BSS_START = .;
        build/asm/us/data/fragments/0x73/fragment_0x73_header.o(.bss);
        build/src/fragments/0x73/fragment_0x73_1B1330.o(.bss);
        build/src/fragments/0x73/fragment_0x73_1B6E40.o(.bss);
        build/src/fragments/0x73/fragment_0x73_1B8010.o(.bss);
        build/src/fragments/0x73/fragment_0x73_1B8DE0.o(.bss);
        build/src/fragments/0x73/fragment_0x73_1B92C0.o(.bss);
        build/src/fragments/0x73/fragment_0x73_1B9390.o(.bss);
        build/src/fragments/0x73/fragment_0x73_1B9840.o(.bss);
        fragment_0x73_BSS_END = .;
        fragment_0x73_BSS_SIZE = ABSOLUTE(fragment_0x73_BSS_END - fragment_0x73_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x73);
    fragment_0x73_ROM_END = __romPos;
    fragment_0x73_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x74_ROM_START = __romPos;
    fragment_0x74_VRAM = ADDR(.fragment_0x74);
    .fragment_0x74 0x88400000 : AT(fragment_0x74_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x74_TEXT_START = .;
        build/asm/us/data/fragments/0x74/fragment_0x74_header.o(.text);
        build/src/fragments/0x74/fragment_0x74_code.o(.text);
        fragment_0x74_TEXT_END = .;
        fragment_0x74_TEXT_SIZE = ABSOLUTE(fragment_0x74_TEXT_END - fragment_0x74_TEXT_START);
        fragment_0x74_DATA_START = .;
        fragments_0x74_fragment_0x74_header = .;
        build/asm/us/data/fragments/0x74/fragment_0x74_header.o(.data);
        fragments_0x74_fragment_0x74_code = .;
        build/src/fragments/0x74/fragment_0x74_code.o(.data);
        fragments_0x74_fragment_0x74_data_data = .;
        build/asm/us/data/fragments/0x74/fragment_0x74_data.data.o(.data);
        fragment_0x74_DATA_END = .;
        fragment_0x74_DATA_SIZE = ABSOLUTE(fragment_0x74_DATA_END - fragment_0x74_DATA_START);
        fragment_0x74_RODATA_START = .;
        build/asm/us/data/fragments/0x74/fragment_0x74_header.o(.rodata);
        build/src/fragments/0x74/fragment_0x74_code.o(.rodata);
        fragment_0x74_RODATA_END = .;
        fragment_0x74_RODATA_SIZE = ABSOLUTE(fragment_0x74_RODATA_END - fragment_0x74_RODATA_START);
    }
    fragment_0x74_bss_VRAM = ADDR(.fragment_0x74_bss);
    .fragment_0x74_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x74_BSS_START = .;
        build/asm/us/data/fragments/0x74/fragment_0x74_header.o(.bss);
        build/src/fragments/0x74/fragment_0x74_code.o(.bss);
        fragment_0x74_BSS_END = .;
        fragment_0x74_BSS_SIZE = ABSOLUTE(fragment_0x74_BSS_END - fragment_0x74_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x74);
    fragment_0x74_ROM_END = __romPos;
    fragment_0x74_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x75_ROM_START = __romPos;
    fragment_0x75_VRAM = ADDR(.fragment_0x75);
    .fragment_0x75 0x88500000 : AT(fragment_0x75_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x75_TEXT_START = .;
        build/asm/us/data/fragments/0x75/fragment_0x75_header.o(.text);
        build/src/fragments/0x75/fragment_0x75_1BD630.o(.text);
        build/src/fragments/0x75/fragment_0x75_1BE300.o(.text);
        build/src/fragments/0x75/fragment_0x75_1C1BC0.o(.text);
        build/src/fragments/0x75/fragment_0x75_1C3FA0.o(.text);
        build/src/fragments/0x75/fragment_0x75_1C5AA0.o(.text);
        fragment_0x75_TEXT_END = .;
        fragment_0x75_TEXT_SIZE = ABSOLUTE(fragment_0x75_TEXT_END - fragment_0x75_TEXT_START);
        fragment_0x75_DATA_START = .;
        fragments_0x75_fragment_0x75_header = .;
        build/asm/us/data/fragments/0x75/fragment_0x75_header.o(.data);
        fragments_0x75_fragment_0x75_1BD630 = .;
        build/src/fragments/0x75/fragment_0x75_1BD630.o(.data);
        fragments_0x75_fragment_0x75_1BE300 = .;
        build/src/fragments/0x75/fragment_0x75_1BE300.o(.data);
        fragments_0x75_fragment_0x75_1C1BC0 = .;
        build/src/fragments/0x75/fragment_0x75_1C1BC0.o(.data);
        fragments_0x75_fragment_0x75_1C3FA0 = .;
        build/src/fragments/0x75/fragment_0x75_1C3FA0.o(.data);
        fragments_0x75_fragment_0x75_1C5AA0 = .;
        build/src/fragments/0x75/fragment_0x75_1C5AA0.o(.data);
        fragments_0x75_fragment_0x75_data_data = .;
        build/asm/us/data/fragments/0x75/fragment_0x75_data.data.o(.data);
        fragment_0x75_DATA_END = .;
        fragment_0x75_DATA_SIZE = ABSOLUTE(fragment_0x75_DATA_END - fragment_0x75_DATA_START);
        fragment_0x75_RODATA_START = .;
        build/asm/us/data/fragments/0x75/fragment_0x75_header.o(.rodata);
        build/src/fragments/0x75/fragment_0x75_1BD630.o(.rodata);
        build/src/fragments/0x75/fragment_0x75_1BE300.o(.rodata);
        build/src/fragments/0x75/fragment_0x75_1C1BC0.o(.rodata);
        build/src/fragments/0x75/fragment_0x75_1C3FA0.o(.rodata);
        build/src/fragments/0x75/fragment_0x75_1C5AA0.o(.rodata);
        fragment_0x75_RODATA_END = .;
        fragment_0x75_RODATA_SIZE = ABSOLUTE(fragment_0x75_RODATA_END - fragment_0x75_RODATA_START);
    }
    fragment_0x75_bss_VRAM = ADDR(.fragment_0x75_bss);
    .fragment_0x75_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x75_BSS_START = .;
        build/asm/us/data/fragments/0x75/fragment_0x75_header.o(.bss);
        build/src/fragments/0x75/fragment_0x75_1BD630.o(.bss);
        build/src/fragments/0x75/fragment_0x75_1BE300.o(.bss);
        build/src/fragments/0x75/fragment_0x75_1C1BC0.o(.bss);
        build/src/fragments/0x75/fragment_0x75_1C3FA0.o(.bss);
        build/src/fragments/0x75/fragment_0x75_1C5AA0.o(.bss);
        fragment_0x75_BSS_END = .;
        fragment_0x75_BSS_SIZE = ABSOLUTE(fragment_0x75_BSS_END - fragment_0x75_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x75);
    fragment_0x75_ROM_END = __romPos;
    fragment_0x75_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x76_ROM_START = __romPos;
    fragment_0x76_VRAM = ADDR(.fragment_0x76);
    .fragment_0x76 0x88600000 : AT(fragment_0x76_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x76_TEXT_START = .;
        build/asm/us/data/fragments/0x76/fragment_0x76_header.o(.text);
        build/src/fragments/0x76/fragment_0x76_1CCC20.o(.text);
        build/src/fragments/0x76/fragment_0x76_1CCE70.o(.text);
        fragment_0x76_TEXT_END = .;
        fragment_0x76_TEXT_SIZE = ABSOLUTE(fragment_0x76_TEXT_END - fragment_0x76_TEXT_START);
        fragment_0x76_DATA_START = .;
        fragments_0x76_fragment_0x76_header = .;
        build/asm/us/data/fragments/0x76/fragment_0x76_header.o(.data);
        fragments_0x76_fragment_0x76_1CCC20 = .;
        build/src/fragments/0x76/fragment_0x76_1CCC20.o(.data);
        fragments_0x76_fragment_0x76_1CCE70 = .;
        build/src/fragments/0x76/fragment_0x76_1CCE70.o(.data);
        fragments_0x76_fragment_0x76_data_data = .;
        build/asm/us/data/fragments/0x76/fragment_0x76_data.data.o(.data);
        fragment_0x76_DATA_END = .;
        fragment_0x76_DATA_SIZE = ABSOLUTE(fragment_0x76_DATA_END - fragment_0x76_DATA_START);
        fragment_0x76_RODATA_START = .;
        build/asm/us/data/fragments/0x76/fragment_0x76_header.o(.rodata);
        build/src/fragments/0x76/fragment_0x76_1CCC20.o(.rodata);
        build/src/fragments/0x76/fragment_0x76_1CCE70.o(.rodata);
        fragment_0x76_RODATA_END = .;
        fragment_0x76_RODATA_SIZE = ABSOLUTE(fragment_0x76_RODATA_END - fragment_0x76_RODATA_START);
    }
    fragment_0x76_bss_VRAM = ADDR(.fragment_0x76_bss);
    .fragment_0x76_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x76_BSS_START = .;
        build/asm/us/data/fragments/0x76/fragment_0x76_header.o(.bss);
        build/src/fragments/0x76/fragment_0x76_1CCC20.o(.bss);
        build/src/fragments/0x76/fragment_0x76_1CCE70.o(.bss);
        fragment_0x76_BSS_END = .;
        fragment_0x76_BSS_SIZE = ABSOLUTE(fragment_0x76_BSS_END - fragment_0x76_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x76);
    fragment_0x76_ROM_END = __romPos;
    fragment_0x76_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x77_ROM_START = __romPos;
    fragment_0x77_VRAM = ADDR(.fragment_0x77);
    .fragment_0x77 0x88700000 : AT(fragment_0x77_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x77_TEXT_START = .;
        build/asm/us/data/fragments/0x77/fragment_0x77_header.o(.text);
        build/src/fragments/0x77/fragment_0x77_code.o(.text);
        fragment_0x77_TEXT_END = .;
        fragment_0x77_TEXT_SIZE = ABSOLUTE(fragment_0x77_TEXT_END - fragment_0x77_TEXT_START);
        fragment_0x77_DATA_START = .;
        fragments_0x77_fragment_0x77_header = .;
        build/asm/us/data/fragments/0x77/fragment_0x77_header.o(.data);
        fragments_0x77_fragment_0x77_code = .;
        build/src/fragments/0x77/fragment_0x77_code.o(.data);
        fragments_0x77_fragment_0x77_data_data = .;
        build/asm/us/data/fragments/0x77/fragment_0x77_data.data.o(.data);
        fragment_0x77_DATA_END = .;
        fragment_0x77_DATA_SIZE = ABSOLUTE(fragment_0x77_DATA_END - fragment_0x77_DATA_START);
        fragment_0x77_RODATA_START = .;
        build/asm/us/data/fragments/0x77/fragment_0x77_header.o(.rodata);
        build/src/fragments/0x77/fragment_0x77_code.o(.rodata);
        fragment_0x77_RODATA_END = .;
        fragment_0x77_RODATA_SIZE = ABSOLUTE(fragment_0x77_RODATA_END - fragment_0x77_RODATA_START);
    }
    fragment_0x77_bss_VRAM = ADDR(.fragment_0x77_bss);
    .fragment_0x77_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x77_BSS_START = .;
        build/asm/us/data/fragments/0x77/fragment_0x77_header.o(.bss);
        build/src/fragments/0x77/fragment_0x77_code.o(.bss);
        fragment_0x77_BSS_END = .;
        fragment_0x77_BSS_SIZE = ABSOLUTE(fragment_0x77_BSS_END - fragment_0x77_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x77);
    fragment_0x77_ROM_END = __romPos;
    fragment_0x77_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x78_ROM_START = __romPos;
    fragment_0x78_VRAM = ADDR(.fragment_0x78);
    .fragment_0x78 0x88800000 : AT(fragment_0x78_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x78_TEXT_START = .;
        build/asm/us/data/fragments/0x78/fragment_0x78_header.o(.text);
        build/src/fragments/0x78/fragment_0x78_code.o(.text);
        fragment_0x78_TEXT_END = .;
        fragment_0x78_TEXT_SIZE = ABSOLUTE(fragment_0x78_TEXT_END - fragment_0x78_TEXT_START);
        fragment_0x78_DATA_START = .;
        fragments_0x78_fragment_0x78_header = .;
        build/asm/us/data/fragments/0x78/fragment_0x78_header.o(.data);
        fragments_0x78_fragment_0x78_code = .;
        build/src/fragments/0x78/fragment_0x78_code.o(.data);
        fragments_0x78_fragment_0x78_data_data = .;
        build/asm/us/data/fragments/0x78/fragment_0x78_data.data.o(.data);
        fragment_0x78_DATA_END = .;
        fragment_0x78_DATA_SIZE = ABSOLUTE(fragment_0x78_DATA_END - fragment_0x78_DATA_START);
        fragment_0x78_RODATA_START = .;
        build/asm/us/data/fragments/0x78/fragment_0x78_header.o(.rodata);
        build/src/fragments/0x78/fragment_0x78_code.o(.rodata);
        fragment_0x78_RODATA_END = .;
        fragment_0x78_RODATA_SIZE = ABSOLUTE(fragment_0x78_RODATA_END - fragment_0x78_RODATA_START);
    }
    fragment_0x78_bss_VRAM = ADDR(.fragment_0x78_bss);
    .fragment_0x78_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x78_BSS_START = .;
        build/asm/us/data/fragments/0x78/fragment_0x78_header.o(.bss);
        build/src/fragments/0x78/fragment_0x78_code.o(.bss);
        fragment_0x78_BSS_END = .;
        fragment_0x78_BSS_SIZE = ABSOLUTE(fragment_0x78_BSS_END - fragment_0x78_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x78);
    fragment_0x78_ROM_END = __romPos;
    fragment_0x78_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x79_ROM_START = __romPos;
    fragment_0x79_VRAM = ADDR(.fragment_0x79);
    .fragment_0x79 0x88900000 : AT(fragment_0x79_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x79_TEXT_START = .;
        build/asm/us/data/fragments/0x79/fragment_0x79_header.o(.text);
        build/src/fragments/0x79/fragment_0x79_1D5610.o(.text);
        build/src/fragments/0x79/fragment_0x79_1D8160.o(.text);
        build/src/fragments/0x79/fragment_0x79_1D8990.o(.text);
        fragment_0x79_TEXT_END = .;
        fragment_0x79_TEXT_SIZE = ABSOLUTE(fragment_0x79_TEXT_END - fragment_0x79_TEXT_START);
        fragment_0x79_DATA_START = .;
        fragments_0x79_fragment_0x79_header = .;
        build/asm/us/data/fragments/0x79/fragment_0x79_header.o(.data);
        fragments_0x79_fragment_0x79_1D5610 = .;
        build/src/fragments/0x79/fragment_0x79_1D5610.o(.data);
        fragments_0x79_fragment_0x79_1D8160 = .;
        build/src/fragments/0x79/fragment_0x79_1D8160.o(.data);
        fragments_0x79_fragment_0x79_1D8990 = .;
        build/src/fragments/0x79/fragment_0x79_1D8990.o(.data);
        fragments_0x79_fragment_0x79_data_data = .;
        build/asm/us/data/fragments/0x79/fragment_0x79_data.data.o(.data);
        fragment_0x79_DATA_END = .;
        fragment_0x79_DATA_SIZE = ABSOLUTE(fragment_0x79_DATA_END - fragment_0x79_DATA_START);
        fragment_0x79_RODATA_START = .;
        build/asm/us/data/fragments/0x79/fragment_0x79_header.o(.rodata);
        build/src/fragments/0x79/fragment_0x79_1D5610.o(.rodata);
        build/src/fragments/0x79/fragment_0x79_1D8160.o(.rodata);
        build/src/fragments/0x79/fragment_0x79_1D8990.o(.rodata);
        fragment_0x79_RODATA_END = .;
        fragment_0x79_RODATA_SIZE = ABSOLUTE(fragment_0x79_RODATA_END - fragment_0x79_RODATA_START);
    }
    fragment_0x79_bss_VRAM = ADDR(.fragment_0x79_bss);
    .fragment_0x79_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x79_BSS_START = .;
        build/asm/us/data/fragments/0x79/fragment_0x79_header.o(.bss);
        build/src/fragments/0x79/fragment_0x79_1D5610.o(.bss);
        build/src/fragments/0x79/fragment_0x79_1D8160.o(.bss);
        build/src/fragments/0x79/fragment_0x79_1D8990.o(.bss);
        fragment_0x79_BSS_END = .;
        fragment_0x79_BSS_SIZE = ABSOLUTE(fragment_0x79_BSS_END - fragment_0x79_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x79);
    fragment_0x79_ROM_END = __romPos;
    fragment_0x79_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x7A_ROM_START = __romPos;
    fragment_0x7A_VRAM = ADDR(.fragment_0x7A);
    .fragment_0x7A 0x88A00000 : AT(fragment_0x7A_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7A_TEXT_START = .;
        build/asm/us/data/fragments/0x7A/fragment_0x7A_header.o(.text);
        build/src/fragments/0x7A/fragment_0x7A_1DA300.o(.text);
        build/src/fragments/0x7A/fragment_0x7A_1DA9F0.o(.text);
        fragment_0x7A_TEXT_END = .;
        fragment_0x7A_TEXT_SIZE = ABSOLUTE(fragment_0x7A_TEXT_END - fragment_0x7A_TEXT_START);
        fragment_0x7A_DATA_START = .;
        fragments_0x7A_fragment_0x7A_header = .;
        build/asm/us/data/fragments/0x7A/fragment_0x7A_header.o(.data);
        fragments_0x7A_fragment_0x7A_1DA300 = .;
        build/src/fragments/0x7A/fragment_0x7A_1DA300.o(.data);
        fragments_0x7A_fragment_0x7A_1DA9F0 = .;
        build/src/fragments/0x7A/fragment_0x7A_1DA9F0.o(.data);
        fragments_0x7A_fragment_0x7A_data_data = .;
        build/asm/us/data/fragments/0x7A/fragment_0x7A_data.data.o(.data);
        fragment_0x7A_DATA_END = .;
        fragment_0x7A_DATA_SIZE = ABSOLUTE(fragment_0x7A_DATA_END - fragment_0x7A_DATA_START);
        fragment_0x7A_RODATA_START = .;
        build/asm/us/data/fragments/0x7A/fragment_0x7A_header.o(.rodata);
        build/src/fragments/0x7A/fragment_0x7A_1DA300.o(.rodata);
        build/src/fragments/0x7A/fragment_0x7A_1DA9F0.o(.rodata);
        fragment_0x7A_RODATA_END = .;
        fragment_0x7A_RODATA_SIZE = ABSOLUTE(fragment_0x7A_RODATA_END - fragment_0x7A_RODATA_START);
    }
    fragment_0x7A_bss_VRAM = ADDR(.fragment_0x7A_bss);
    .fragment_0x7A_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7A_BSS_START = .;
        build/asm/us/data/fragments/0x7A/fragment_0x7A_header.o(.bss);
        build/src/fragments/0x7A/fragment_0x7A_1DA300.o(.bss);
        build/src/fragments/0x7A/fragment_0x7A_1DA9F0.o(.bss);
        fragment_0x7A_BSS_END = .;
        fragment_0x7A_BSS_SIZE = ABSOLUTE(fragment_0x7A_BSS_END - fragment_0x7A_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x7A);
    fragment_0x7A_ROM_END = __romPos;
    fragment_0x7A_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x7B_ROM_START = __romPos;
    fragment_0x7B_VRAM = ADDR(.fragment_0x7B);
    .fragment_0x7B 0x88B00000 : AT(fragment_0x7B_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7B_TEXT_START = .;
        build/asm/us/data/fragments/0x7B/fragment_0x7B_header.o(.text);
        build/src/fragments/0x7B/fragment_0x7B_1DC1F0.o(.text);
        build/src/fragments/0x7B/fragment_0x7B_1E0550.o(.text);
        fragment_0x7B_TEXT_END = .;
        fragment_0x7B_TEXT_SIZE = ABSOLUTE(fragment_0x7B_TEXT_END - fragment_0x7B_TEXT_START);
        fragment_0x7B_DATA_START = .;
        fragments_0x7B_fragment_0x7B_header = .;
        build/asm/us/data/fragments/0x7B/fragment_0x7B_header.o(.data);
        fragments_0x7B_fragment_0x7B_1DC1F0 = .;
        build/src/fragments/0x7B/fragment_0x7B_1DC1F0.o(.data);
        fragments_0x7B_fragment_0x7B_1E0550 = .;
        build/src/fragments/0x7B/fragment_0x7B_1E0550.o(.data);
        fragments_0x7B_fragment_0x7B_data_data = .;
        build/asm/us/data/fragments/0x7B/fragment_0x7B_data.data.o(.data);
        fragment_0x7B_DATA_END = .;
        fragment_0x7B_DATA_SIZE = ABSOLUTE(fragment_0x7B_DATA_END - fragment_0x7B_DATA_START);
        fragment_0x7B_RODATA_START = .;
        build/asm/us/data/fragments/0x7B/fragment_0x7B_header.o(.rodata);
        build/src/fragments/0x7B/fragment_0x7B_1DC1F0.o(.rodata);
        build/src/fragments/0x7B/fragment_0x7B_1E0550.o(.rodata);
        fragment_0x7B_RODATA_END = .;
        fragment_0x7B_RODATA_SIZE = ABSOLUTE(fragment_0x7B_RODATA_END - fragment_0x7B_RODATA_START);
    }
    fragment_0x7B_bss_VRAM = ADDR(.fragment_0x7B_bss);
    .fragment_0x7B_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7B_BSS_START = .;
        build/asm/us/data/fragments/0x7B/fragment_0x7B_header.o(.bss);
        build/src/fragments/0x7B/fragment_0x7B_1DC1F0.o(.bss);
        build/src/fragments/0x7B/fragment_0x7B_1E0550.o(.bss);
        fragment_0x7B_BSS_END = .;
        fragment_0x7B_BSS_SIZE = ABSOLUTE(fragment_0x7B_BSS_END - fragment_0x7B_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x7B);
    fragment_0x7B_ROM_END = __romPos;
    fragment_0x7B_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x7C_ROM_START = __romPos;
    fragment_0x7C_VRAM = ADDR(.fragment_0x7C);
    .fragment_0x7C 0x88C00000 : AT(fragment_0x7C_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7C_TEXT_START = .;
        build/asm/us/data/fragments/0x7C/fragment_0x7C_header.o(.text);
        build/src/fragments/0x7C/fragment_0x7C_code.o(.text);
        fragment_0x7C_TEXT_END = .;
        fragment_0x7C_TEXT_SIZE = ABSOLUTE(fragment_0x7C_TEXT_END - fragment_0x7C_TEXT_START);
        fragment_0x7C_DATA_START = .;
        fragments_0x7C_fragment_0x7C_header = .;
        build/asm/us/data/fragments/0x7C/fragment_0x7C_header.o(.data);
        fragments_0x7C_fragment_0x7C_code = .;
        build/src/fragments/0x7C/fragment_0x7C_code.o(.data);
        fragments_0x7C_fragment_0x7C_data_data = .;
        build/asm/us/data/fragments/0x7C/fragment_0x7C_data.data.o(.data);
        fragment_0x7C_DATA_END = .;
        fragment_0x7C_DATA_SIZE = ABSOLUTE(fragment_0x7C_DATA_END - fragment_0x7C_DATA_START);
        fragment_0x7C_RODATA_START = .;
        build/asm/us/data/fragments/0x7C/fragment_0x7C_header.o(.rodata);
        build/src/fragments/0x7C/fragment_0x7C_code.o(.rodata);
        fragment_0x7C_RODATA_END = .;
        fragment_0x7C_RODATA_SIZE = ABSOLUTE(fragment_0x7C_RODATA_END - fragment_0x7C_RODATA_START);
    }
    fragment_0x7C_bss_VRAM = ADDR(.fragment_0x7C_bss);
    .fragment_0x7C_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7C_BSS_START = .;
        build/asm/us/data/fragments/0x7C/fragment_0x7C_header.o(.bss);
        build/src/fragments/0x7C/fragment_0x7C_code.o(.bss);
        fragment_0x7C_BSS_END = .;
        fragment_0x7C_BSS_SIZE = ABSOLUTE(fragment_0x7C_BSS_END - fragment_0x7C_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x7C);
    fragment_0x7C_ROM_END = __romPos;
    fragment_0x7C_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x7D_ROM_START = __romPos;
    fragment_0x7D_VRAM = ADDR(.fragment_0x7D);
    .fragment_0x7D 0x88D00000 : AT(fragment_0x7D_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7D_TEXT_START = .;
        build/asm/us/data/fragments/0x7D/fragment_0x7D_header.o(.text);
        build/src/fragments/0x7D/fragment_0x7D_code.o(.text);
        fragment_0x7D_TEXT_END = .;
        fragment_0x7D_TEXT_SIZE = ABSOLUTE(fragment_0x7D_TEXT_END - fragment_0x7D_TEXT_START);
        fragment_0x7D_DATA_START = .;
        fragments_0x7D_fragment_0x7D_header = .;
        build/asm/us/data/fragments/0x7D/fragment_0x7D_header.o(.data);
        fragments_0x7D_fragment_0x7D_code = .;
        build/src/fragments/0x7D/fragment_0x7D_code.o(.data);
        fragments_0x7D_fragment_0x7D_data_data = .;
        build/asm/us/data/fragments/0x7D/fragment_0x7D_data.data.o(.data);
        fragment_0x7D_DATA_END = .;
        fragment_0x7D_DATA_SIZE = ABSOLUTE(fragment_0x7D_DATA_END - fragment_0x7D_DATA_START);
        fragment_0x7D_RODATA_START = .;
        build/asm/us/data/fragments/0x7D/fragment_0x7D_header.o(.rodata);
        build/src/fragments/0x7D/fragment_0x7D_code.o(.rodata);
        fragment_0x7D_RODATA_END = .;
        fragment_0x7D_RODATA_SIZE = ABSOLUTE(fragment_0x7D_RODATA_END - fragment_0x7D_RODATA_START);
    }
    fragment_0x7D_bss_VRAM = ADDR(.fragment_0x7D_bss);
    .fragment_0x7D_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x7D_BSS_START = .;
        build/asm/us/data/fragments/0x7D/fragment_0x7D_header.o(.bss);
        build/src/fragments/0x7D/fragment_0x7D_code.o(.bss);
        fragment_0x7D_BSS_END = .;
        fragment_0x7D_BSS_SIZE = ABSOLUTE(fragment_0x7D_BSS_END - fragment_0x7D_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x7D);
    fragment_0x7D_ROM_END = __romPos;
    fragment_0x7D_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x9C_ROM_START = __romPos;
    fragment_0x9C_VRAM = ADDR(.fragment_0x9C);
    .fragment_0x9C 0x8AC00000 : AT(fragment_0x9C_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9C_TEXT_START = .;
        build/asm/us/data/fragments/0x9C/fragment_0x9C_header.o(.text);
        build/src/fragments/0x9C/fragment_0x9C_1E5A10.o(.text);
        build/src/fragments/0x9C/fragment_0x9C_1EC950.o(.text);
        fragment_0x9C_TEXT_END = .;
        fragment_0x9C_TEXT_SIZE = ABSOLUTE(fragment_0x9C_TEXT_END - fragment_0x9C_TEXT_START);
        fragment_0x9C_DATA_START = .;
        fragments_0x9C_fragment_0x9C_header = .;
        build/asm/us/data/fragments/0x9C/fragment_0x9C_header.o(.data);
        fragments_0x9C_fragment_0x9C_1E5A10 = .;
        build/src/fragments/0x9C/fragment_0x9C_1E5A10.o(.data);
        fragments_0x9C_fragment_0x9C_1EC950 = .;
        build/src/fragments/0x9C/fragment_0x9C_1EC950.o(.data);
        fragments_0x9C_fragment_0x9C_data_data = .;
        build/asm/us/data/fragments/0x9C/fragment_0x9C_data.data.o(.data);
        fragment_0x9C_DATA_END = .;
        fragment_0x9C_DATA_SIZE = ABSOLUTE(fragment_0x9C_DATA_END - fragment_0x9C_DATA_START);
        fragment_0x9C_RODATA_START = .;
        build/asm/us/data/fragments/0x9C/fragment_0x9C_header.o(.rodata);
        build/src/fragments/0x9C/fragment_0x9C_1E5A10.o(.rodata);
        build/src/fragments/0x9C/fragment_0x9C_1EC950.o(.rodata);
        fragment_0x9C_RODATA_END = .;
        fragment_0x9C_RODATA_SIZE = ABSOLUTE(fragment_0x9C_RODATA_END - fragment_0x9C_RODATA_START);
    }
    fragment_0x9C_bss_VRAM = ADDR(.fragment_0x9C_bss);
    .fragment_0x9C_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9C_BSS_START = .;
        build/asm/us/data/fragments/0x9C/fragment_0x9C_header.o(.bss);
        build/src/fragments/0x9C/fragment_0x9C_1E5A10.o(.bss);
        build/src/fragments/0x9C/fragment_0x9C_1EC950.o(.bss);
        fragment_0x9C_BSS_END = .;
        fragment_0x9C_BSS_SIZE = ABSOLUTE(fragment_0x9C_BSS_END - fragment_0x9C_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x9C);
    fragment_0x9C_ROM_END = __romPos;
    fragment_0x9C_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x9F_ROM_START = __romPos;
    fragment_0x9F_VRAM = ADDR(.fragment_0x9F);
    .fragment_0x9F 0x8AF00000 : AT(fragment_0x9F_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9F_TEXT_START = .;
        build/asm/us/data/fragments/0x9F/fragment_0x9F_header.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1EE290.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F0680.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F1850.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F53D0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F5480.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F5BD0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F5F20.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F6BF0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F7DD0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F85B0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1F9DB0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_1FD260.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_201DA0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_2030B0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_204950.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_205C30.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_207AF0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_209BD0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_20A610.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_20BDB0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_20C560.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_20CBF0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_20D3A0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_20EBC0.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_20F140.o(.text);
        build/src/fragments/0x9F/fragment_0x9F_212740.o(.text);
        fragment_0x9F_TEXT_END = .;
        fragment_0x9F_TEXT_SIZE = ABSOLUTE(fragment_0x9F_TEXT_END - fragment_0x9F_TEXT_START);
        fragment_0x9F_DATA_START = .;
        fragments_0x9F_fragment_0x9F_header = .;
        build/asm/us/data/fragments/0x9F/fragment_0x9F_header.o(.data);
        fragments_0x9F_fragment_0x9F_1EE290 = .;
        build/src/fragments/0x9F/fragment_0x9F_1EE290.o(.data);
        fragments_0x9F_fragment_0x9F_1F0680 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F0680.o(.data);
        fragments_0x9F_fragment_0x9F_1F1850 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F1850.o(.data);
        fragments_0x9F_fragment_0x9F_1F53D0 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F53D0.o(.data);
        fragments_0x9F_fragment_0x9F_1F5480 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F5480.o(.data);
        fragments_0x9F_fragment_0x9F_1F5BD0 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F5BD0.o(.data);
        fragments_0x9F_fragment_0x9F_1F5F20 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F5F20.o(.data);
        fragments_0x9F_fragment_0x9F_1F6BF0 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F6BF0.o(.data);
        fragments_0x9F_fragment_0x9F_1F7DD0 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F7DD0.o(.data);
        fragments_0x9F_fragment_0x9F_1F85B0 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F85B0.o(.data);
        fragments_0x9F_fragment_0x9F_1F9DB0 = .;
        build/src/fragments/0x9F/fragment_0x9F_1F9DB0.o(.data);
        fragments_0x9F_fragment_0x9F_1FD260 = .;
        build/src/fragments/0x9F/fragment_0x9F_1FD260.o(.data);
        fragments_0x9F_fragment_0x9F_201DA0 = .;
        build/src/fragments/0x9F/fragment_0x9F_201DA0.o(.data);
        fragments_0x9F_fragment_0x9F_2030B0 = .;
        build/src/fragments/0x9F/fragment_0x9F_2030B0.o(.data);
        fragments_0x9F_fragment_0x9F_204950 = .;
        build/src/fragments/0x9F/fragment_0x9F_204950.o(.data);
        fragments_0x9F_fragment_0x9F_205C30 = .;
        build/src/fragments/0x9F/fragment_0x9F_205C30.o(.data);
        fragments_0x9F_fragment_0x9F_207AF0 = .;
        build/src/fragments/0x9F/fragment_0x9F_207AF0.o(.data);
        fragments_0x9F_fragment_0x9F_209BD0 = .;
        build/src/fragments/0x9F/fragment_0x9F_209BD0.o(.data);
        fragments_0x9F_fragment_0x9F_20A610 = .;
        build/src/fragments/0x9F/fragment_0x9F_20A610.o(.data);
        fragments_0x9F_fragment_0x9F_20BDB0 = .;
        build/src/fragments/0x9F/fragment_0x9F_20BDB0.o(.data);
        fragments_0x9F_fragment_0x9F_20C560 = .;
        build/src/fragments/0x9F/fragment_0x9F_20C560.o(.data);
        fragments_0x9F_fragment_0x9F_20CBF0 = .;
        build/src/fragments/0x9F/fragment_0x9F_20CBF0.o(.data);
        fragments_0x9F_fragment_0x9F_20D3A0 = .;
        build/src/fragments/0x9F/fragment_0x9F_20D3A0.o(.data);
        fragments_0x9F_fragment_0x9F_20EBC0 = .;
        build/src/fragments/0x9F/fragment_0x9F_20EBC0.o(.data);
        fragments_0x9F_fragment_0x9F_20F140 = .;
        build/src/fragments/0x9F/fragment_0x9F_20F140.o(.data);
        fragments_0x9F_fragment_0x9F_212740 = .;
        build/src/fragments/0x9F/fragment_0x9F_212740.o(.data);
        fragments_0x9F_fragment_0x9F_data_data = .;
        build/asm/us/data/fragments/0x9F/fragment_0x9F_data.data.o(.data);
        fragment_0x9F_DATA_END = .;
        fragment_0x9F_DATA_SIZE = ABSOLUTE(fragment_0x9F_DATA_END - fragment_0x9F_DATA_START);
        fragment_0x9F_RODATA_START = .;
        build/asm/us/data/fragments/0x9F/fragment_0x9F_header.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1EE290.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F0680.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F1850.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F53D0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F5480.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F5BD0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F5F20.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F6BF0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F7DD0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F85B0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1F9DB0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_1FD260.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_201DA0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_2030B0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_204950.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_205C30.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_207AF0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_209BD0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_20A610.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_20BDB0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_20C560.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_20CBF0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_20D3A0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_20EBC0.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_20F140.o(.rodata);
        build/src/fragments/0x9F/fragment_0x9F_212740.o(.rodata);
        fragment_0x9F_RODATA_END = .;
        fragment_0x9F_RODATA_SIZE = ABSOLUTE(fragment_0x9F_RODATA_END - fragment_0x9F_RODATA_START);
    }
    fragment_0x9F_bss_VRAM = ADDR(.fragment_0x9F_bss);
    .fragment_0x9F_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9F_BSS_START = .;
        build/asm/us/data/fragments/0x9F/fragment_0x9F_header.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1EE290.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F0680.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F1850.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F53D0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F5480.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F5BD0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F5F20.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F6BF0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F7DD0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F85B0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1F9DB0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_1FD260.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_201DA0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_2030B0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_204950.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_205C30.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_207AF0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_209BD0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_20A610.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_20BDB0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_20C560.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_20CBF0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_20D3A0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_20EBC0.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_20F140.o(.bss);
        build/src/fragments/0x9F/fragment_0x9F_212740.o(.bss);
        fragment_0x9F_BSS_END = .;
        fragment_0x9F_BSS_SIZE = ABSOLUTE(fragment_0x9F_BSS_END - fragment_0x9F_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x9F);
    fragment_0x9F_ROM_END = __romPos;
    fragment_0x9F_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x9B_ROM_START = __romPos;
    fragment_0x9B_VRAM = ADDR(.fragment_0x9B);
    .fragment_0x9B 0x8AB00000 : AT(fragment_0x9B_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9B_TEXT_START = .;
        build/asm/us/data/fragments/0x9B/fragment_0x9B_header.o(.text);
        build/src/fragments/0x9B/fragment_0x9B_2251A0.o(.text);
        build/src/fragments/0x9B/fragment_0x9B_22AB80.o(.text);
        build/src/fragments/0x9B/fragment_0x9B_22FAD0.o(.text);
        build/src/fragments/0x9B/fragment_0x9B_2324B0.o(.text);
        build/src/fragments/0x9B/fragment_0x9B_2348E0.o(.text);
        fragment_0x9B_TEXT_END = .;
        fragment_0x9B_TEXT_SIZE = ABSOLUTE(fragment_0x9B_TEXT_END - fragment_0x9B_TEXT_START);
        fragment_0x9B_DATA_START = .;
        fragments_0x9B_fragment_0x9B_header = .;
        build/asm/us/data/fragments/0x9B/fragment_0x9B_header.o(.data);
        fragments_0x9B_fragment_0x9B_2251A0 = .;
        build/src/fragments/0x9B/fragment_0x9B_2251A0.o(.data);
        fragments_0x9B_fragment_0x9B_22AB80 = .;
        build/src/fragments/0x9B/fragment_0x9B_22AB80.o(.data);
        fragments_0x9B_fragment_0x9B_22FAD0 = .;
        build/src/fragments/0x9B/fragment_0x9B_22FAD0.o(.data);
        fragments_0x9B_fragment_0x9B_2324B0 = .;
        build/src/fragments/0x9B/fragment_0x9B_2324B0.o(.data);
        fragments_0x9B_fragment_0x9B_2348E0 = .;
        build/src/fragments/0x9B/fragment_0x9B_2348E0.o(.data);
        fragments_0x9B_fragment_0x9B_data_data = .;
        build/asm/us/data/fragments/0x9B/fragment_0x9B_data.data.o(.data);
        fragment_0x9B_DATA_END = .;
        fragment_0x9B_DATA_SIZE = ABSOLUTE(fragment_0x9B_DATA_END - fragment_0x9B_DATA_START);
        fragment_0x9B_RODATA_START = .;
        build/asm/us/data/fragments/0x9B/fragment_0x9B_header.o(.rodata);
        build/src/fragments/0x9B/fragment_0x9B_2251A0.o(.rodata);
        build/src/fragments/0x9B/fragment_0x9B_22AB80.o(.rodata);
        build/src/fragments/0x9B/fragment_0x9B_22FAD0.o(.rodata);
        build/src/fragments/0x9B/fragment_0x9B_2324B0.o(.rodata);
        build/src/fragments/0x9B/fragment_0x9B_2348E0.o(.rodata);
        fragment_0x9B_RODATA_END = .;
        fragment_0x9B_RODATA_SIZE = ABSOLUTE(fragment_0x9B_RODATA_END - fragment_0x9B_RODATA_START);
    }
    fragment_0x9B_bss_VRAM = ADDR(.fragment_0x9B_bss);
    .fragment_0x9B_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9B_BSS_START = .;
        build/asm/us/data/fragments/0x9B/fragment_0x9B_header.o(.bss);
        build/src/fragments/0x9B/fragment_0x9B_2251A0.o(.bss);
        build/src/fragments/0x9B/fragment_0x9B_22AB80.o(.bss);
        build/src/fragments/0x9B/fragment_0x9B_22FAD0.o(.bss);
        build/src/fragments/0x9B/fragment_0x9B_2324B0.o(.bss);
        build/src/fragments/0x9B/fragment_0x9B_2348E0.o(.bss);
        fragment_0x9B_BSS_END = .;
        fragment_0x9B_BSS_SIZE = ABSOLUTE(fragment_0x9B_BSS_END - fragment_0x9B_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x9B);
    fragment_0x9B_ROM_END = __romPos;
    fragment_0x9B_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x9E_ROM_START = __romPos;
    fragment_0x9E_VRAM = ADDR(.fragment_0x9E);
    .fragment_0x9E 0x8AE00000 : AT(fragment_0x9E_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9E_TEXT_START = .;
        build/asm/us/data/fragments/0x9E/fragment_0x9E_header.o(.text);
        build/src/fragments/0x9E/fragment_0x9E_code.o(.text);
        fragment_0x9E_TEXT_END = .;
        fragment_0x9E_TEXT_SIZE = ABSOLUTE(fragment_0x9E_TEXT_END - fragment_0x9E_TEXT_START);
        fragment_0x9E_DATA_START = .;
        fragments_0x9E_fragment_0x9E_header = .;
        build/asm/us/data/fragments/0x9E/fragment_0x9E_header.o(.data);
        fragments_0x9E_fragment_0x9E_code = .;
        build/src/fragments/0x9E/fragment_0x9E_code.o(.data);
        fragments_0x9E_fragment_0x9E_data_data = .;
        build/asm/us/data/fragments/0x9E/fragment_0x9E_data.data.o(.data);
        fragment_0x9E_DATA_END = .;
        fragment_0x9E_DATA_SIZE = ABSOLUTE(fragment_0x9E_DATA_END - fragment_0x9E_DATA_START);
        fragment_0x9E_RODATA_START = .;
        build/asm/us/data/fragments/0x9E/fragment_0x9E_header.o(.rodata);
        build/src/fragments/0x9E/fragment_0x9E_code.o(.rodata);
        fragment_0x9E_RODATA_END = .;
        fragment_0x9E_RODATA_SIZE = ABSOLUTE(fragment_0x9E_RODATA_END - fragment_0x9E_RODATA_START);
    }
    fragment_0x9E_bss_VRAM = ADDR(.fragment_0x9E_bss);
    .fragment_0x9E_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x9E_BSS_START = .;
        build/asm/us/data/fragments/0x9E/fragment_0x9E_header.o(.bss);
        build/src/fragments/0x9E/fragment_0x9E_code.o(.bss);
        fragment_0x9E_BSS_END = .;
        fragment_0x9E_BSS_SIZE = ABSOLUTE(fragment_0x9E_BSS_END - fragment_0x9E_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x9E);
    fragment_0x9E_ROM_END = __romPos;
    fragment_0x9E_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x50_ROM_START = __romPos;
    fragment_0x50_VRAM = ADDR(.fragment_0x50);
    .fragment_0x50 0x86000000 : AT(fragment_0x50_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x50_TEXT_START = .;
        build/asm/us/data/fragments/0x50/fragment_0x50_header.o(.text);
        build/src/fragments/0x50/fragment_0x50_246640.o(.text);
        build/src/fragments/0x50/fragment_0x50_24AE60.o(.text);
        build/src/fragments/0x50/fragment_0x50_24E0A0.o(.text);
        build/src/fragments/0x50/fragment_0x50_251C30.o(.text);
        build/src/fragments/0x50/fragment_0x50_2533F0.o(.text);
        fragment_0x50_TEXT_END = .;
        fragment_0x50_TEXT_SIZE = ABSOLUTE(fragment_0x50_TEXT_END - fragment_0x50_TEXT_START);
        fragment_0x50_DATA_START = .;
        fragments_0x50_fragment_0x50_header = .;
        build/asm/us/data/fragments/0x50/fragment_0x50_header.o(.data);
        fragments_0x50_fragment_0x50_246640 = .;
        build/src/fragments/0x50/fragment_0x50_246640.o(.data);
        fragments_0x50_fragment_0x50_24AE60 = .;
        build/src/fragments/0x50/fragment_0x50_24AE60.o(.data);
        fragments_0x50_fragment_0x50_24E0A0 = .;
        build/src/fragments/0x50/fragment_0x50_24E0A0.o(.data);
        fragments_0x50_fragment_0x50_251C30 = .;
        build/src/fragments/0x50/fragment_0x50_251C30.o(.data);
        fragments_0x50_fragment_0x50_2533F0 = .;
        build/src/fragments/0x50/fragment_0x50_2533F0.o(.data);
        fragments_0x50_fragment_0x50_data_data = .;
        build/asm/us/data/fragments/0x50/fragment_0x50_data.data.o(.data);
        fragment_0x50_DATA_END = .;
        fragment_0x50_DATA_SIZE = ABSOLUTE(fragment_0x50_DATA_END - fragment_0x50_DATA_START);
        fragment_0x50_RODATA_START = .;
        build/asm/us/data/fragments/0x50/fragment_0x50_header.o(.rodata);
        build/src/fragments/0x50/fragment_0x50_246640.o(.rodata);
        build/src/fragments/0x50/fragment_0x50_24AE60.o(.rodata);
        build/src/fragments/0x50/fragment_0x50_24E0A0.o(.rodata);
        build/src/fragments/0x50/fragment_0x50_251C30.o(.rodata);
        build/src/fragments/0x50/fragment_0x50_2533F0.o(.rodata);
        fragment_0x50_RODATA_END = .;
        fragment_0x50_RODATA_SIZE = ABSOLUTE(fragment_0x50_RODATA_END - fragment_0x50_RODATA_START);
    }
    fragment_0x50_bss_VRAM = ADDR(.fragment_0x50_bss);
    .fragment_0x50_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x50_BSS_START = .;
        build/asm/us/data/fragments/0x50/fragment_0x50_header.o(.bss);
        build/src/fragments/0x50/fragment_0x50_246640.o(.bss);
        build/src/fragments/0x50/fragment_0x50_24AE60.o(.bss);
        build/src/fragments/0x50/fragment_0x50_24E0A0.o(.bss);
        build/src/fragments/0x50/fragment_0x50_251C30.o(.bss);
        build/src/fragments/0x50/fragment_0x50_2533F0.o(.bss);
        fragment_0x50_BSS_END = .;
        fragment_0x50_BSS_SIZE = ABSOLUTE(fragment_0x50_BSS_END - fragment_0x50_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x50);
    fragment_0x50_ROM_END = __romPos;
    fragment_0x50_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x6C_ROM_START = __romPos;
    fragment_0x6C_VRAM = ADDR(.fragment_0x6C);
    .fragment_0x6C 0x87C00000 : AT(fragment_0x6C_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6C_TEXT_START = .;
        build/asm/us/data/fragments/0x6C/fragment_0x6C_header.o(.text);
        build/src/fragments/0x6C/fragment_0x6C_256020.o(.text);
        build/src/fragments/0x6C/fragment_0x6C_257730.o(.text);
        build/src/fragments/0x6C/fragment_0x6C_258080.o(.text);
        build/src/fragments/0x6C/fragment_0x6C_258D80.o(.text);
        build/src/fragments/0x6C/fragment_0x6C_2597B0.o(.text);
        fragment_0x6C_TEXT_END = .;
        fragment_0x6C_TEXT_SIZE = ABSOLUTE(fragment_0x6C_TEXT_END - fragment_0x6C_TEXT_START);
        fragment_0x6C_DATA_START = .;
        fragments_0x6C_fragment_0x6C_header = .;
        build/asm/us/data/fragments/0x6C/fragment_0x6C_header.o(.data);
        fragments_0x6C_fragment_0x6C_256020 = .;
        build/src/fragments/0x6C/fragment_0x6C_256020.o(.data);
        fragments_0x6C_fragment_0x6C_257730 = .;
        build/src/fragments/0x6C/fragment_0x6C_257730.o(.data);
        fragments_0x6C_fragment_0x6C_258080 = .;
        build/src/fragments/0x6C/fragment_0x6C_258080.o(.data);
        fragments_0x6C_fragment_0x6C_258D80 = .;
        build/src/fragments/0x6C/fragment_0x6C_258D80.o(.data);
        fragments_0x6C_fragment_0x6C_2597B0 = .;
        build/src/fragments/0x6C/fragment_0x6C_2597B0.o(.data);
        fragments_0x6C_fragment_0x6C_data_data = .;
        build/asm/us/data/fragments/0x6C/fragment_0x6C_data.data.o(.data);
        fragment_0x6C_DATA_END = .;
        fragment_0x6C_DATA_SIZE = ABSOLUTE(fragment_0x6C_DATA_END - fragment_0x6C_DATA_START);
        fragment_0x6C_RODATA_START = .;
        build/asm/us/data/fragments/0x6C/fragment_0x6C_header.o(.rodata);
        build/src/fragments/0x6C/fragment_0x6C_256020.o(.rodata);
        build/src/fragments/0x6C/fragment_0x6C_257730.o(.rodata);
        build/src/fragments/0x6C/fragment_0x6C_258080.o(.rodata);
        build/src/fragments/0x6C/fragment_0x6C_258D80.o(.rodata);
        build/src/fragments/0x6C/fragment_0x6C_2597B0.o(.rodata);
        fragment_0x6C_RODATA_END = .;
        fragment_0x6C_RODATA_SIZE = ABSOLUTE(fragment_0x6C_RODATA_END - fragment_0x6C_RODATA_START);
    }
    fragment_0x6C_bss_VRAM = ADDR(.fragment_0x6C_bss);
    .fragment_0x6C_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6C_BSS_START = .;
        build/asm/us/data/fragments/0x6C/fragment_0x6C_header.o(.bss);
        build/src/fragments/0x6C/fragment_0x6C_256020.o(.bss);
        build/src/fragments/0x6C/fragment_0x6C_257730.o(.bss);
        build/src/fragments/0x6C/fragment_0x6C_258080.o(.bss);
        build/src/fragments/0x6C/fragment_0x6C_258D80.o(.bss);
        build/src/fragments/0x6C/fragment_0x6C_2597B0.o(.bss);
        fragment_0x6C_BSS_END = .;
        fragment_0x6C_BSS_SIZE = ABSOLUTE(fragment_0x6C_BSS_END - fragment_0x6C_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x6C);
    fragment_0x6C_ROM_END = __romPos;
    fragment_0x6C_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x51_ROM_START = __romPos;
    fragment_0x51_VRAM = ADDR(.fragment_0x51);
    .fragment_0x51 0x86100000 : AT(fragment_0x51_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x51_TEXT_START = .;
        build/asm/us/data/fragments/0x51/fragment_0x51_header.o(.text);
        build/src/fragments/0x51/fragment_0x51_code.o(.text);
        fragment_0x51_TEXT_END = .;
        fragment_0x51_TEXT_SIZE = ABSOLUTE(fragment_0x51_TEXT_END - fragment_0x51_TEXT_START);
        fragment_0x51_DATA_START = .;
        fragments_0x51_fragment_0x51_header = .;
        build/asm/us/data/fragments/0x51/fragment_0x51_header.o(.data);
        fragments_0x51_fragment_0x51_code = .;
        build/src/fragments/0x51/fragment_0x51_code.o(.data);
        fragments_0x51_fragment_0x51_data_data = .;
        build/asm/us/data/fragments/0x51/fragment_0x51_data.data.o(.data);
        fragment_0x51_DATA_END = .;
        fragment_0x51_DATA_SIZE = ABSOLUTE(fragment_0x51_DATA_END - fragment_0x51_DATA_START);
        fragment_0x51_RODATA_START = .;
        build/asm/us/data/fragments/0x51/fragment_0x51_header.o(.rodata);
        build/src/fragments/0x51/fragment_0x51_code.o(.rodata);
        fragment_0x51_RODATA_END = .;
        fragment_0x51_RODATA_SIZE = ABSOLUTE(fragment_0x51_RODATA_END - fragment_0x51_RODATA_START);
    }
    fragment_0x51_bss_VRAM = ADDR(.fragment_0x51_bss);
    .fragment_0x51_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x51_BSS_START = .;
        build/asm/us/data/fragments/0x51/fragment_0x51_header.o(.bss);
        build/src/fragments/0x51/fragment_0x51_code.o(.bss);
        fragment_0x51_BSS_END = .;
        fragment_0x51_BSS_SIZE = ABSOLUTE(fragment_0x51_BSS_END - fragment_0x51_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x51);
    fragment_0x51_ROM_END = __romPos;
    fragment_0x51_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x52_ROM_START = __romPos;
    fragment_0x52_VRAM = ADDR(.fragment_0x52);
    .fragment_0x52 0x86200000 : AT(fragment_0x52_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x52_TEXT_START = .;
        build/asm/us/data/fragments/0x52/fragment_0x52_header.o(.text);
        build/src/fragments/0x52/fragment_0x52_266A60.o(.text);
        build/src/fragments/0x52/fragment_0x52_26BF40.o(.text);
        build/src/fragments/0x52/fragment_0x52_26D1D0.o(.text);
        build/src/fragments/0x52/fragment_0x52_26DCC0.o(.text);
        build/src/fragments/0x52/fragment_0x52_26E090.o(.text);
        build/src/fragments/0x52/fragment_0x52_26E4C0.o(.text);
        fragment_0x52_TEXT_END = .;
        fragment_0x52_TEXT_SIZE = ABSOLUTE(fragment_0x52_TEXT_END - fragment_0x52_TEXT_START);
        fragment_0x52_DATA_START = .;
        fragments_0x52_fragment_0x52_header = .;
        build/asm/us/data/fragments/0x52/fragment_0x52_header.o(.data);
        fragments_0x52_fragment_0x52_266A60 = .;
        build/src/fragments/0x52/fragment_0x52_266A60.o(.data);
        fragments_0x52_fragment_0x52_26BF40 = .;
        build/src/fragments/0x52/fragment_0x52_26BF40.o(.data);
        fragments_0x52_fragment_0x52_26D1D0 = .;
        build/src/fragments/0x52/fragment_0x52_26D1D0.o(.data);
        fragments_0x52_fragment_0x52_26DCC0 = .;
        build/src/fragments/0x52/fragment_0x52_26DCC0.o(.data);
        fragments_0x52_fragment_0x52_26E090 = .;
        build/src/fragments/0x52/fragment_0x52_26E090.o(.data);
        fragments_0x52_fragment_0x52_26E4C0 = .;
        build/src/fragments/0x52/fragment_0x52_26E4C0.o(.data);
        fragments_0x52_fragment_0x52_data_data = .;
        build/asm/us/data/fragments/0x52/fragment_0x52_data.data.o(.data);
        fragment_0x52_DATA_END = .;
        fragment_0x52_DATA_SIZE = ABSOLUTE(fragment_0x52_DATA_END - fragment_0x52_DATA_START);
        fragment_0x52_RODATA_START = .;
        build/asm/us/data/fragments/0x52/fragment_0x52_header.o(.rodata);
        build/src/fragments/0x52/fragment_0x52_266A60.o(.rodata);
        build/src/fragments/0x52/fragment_0x52_26BF40.o(.rodata);
        build/src/fragments/0x52/fragment_0x52_26D1D0.o(.rodata);
        build/src/fragments/0x52/fragment_0x52_26DCC0.o(.rodata);
        build/src/fragments/0x52/fragment_0x52_26E090.o(.rodata);
        build/src/fragments/0x52/fragment_0x52_26E4C0.o(.rodata);
        fragment_0x52_RODATA_END = .;
        fragment_0x52_RODATA_SIZE = ABSOLUTE(fragment_0x52_RODATA_END - fragment_0x52_RODATA_START);
    }
    fragment_0x52_bss_VRAM = ADDR(.fragment_0x52_bss);
    .fragment_0x52_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x52_BSS_START = .;
        build/asm/us/data/fragments/0x52/fragment_0x52_header.o(.bss);
        build/src/fragments/0x52/fragment_0x52_266A60.o(.bss);
        build/src/fragments/0x52/fragment_0x52_26BF40.o(.bss);
        build/src/fragments/0x52/fragment_0x52_26D1D0.o(.bss);
        build/src/fragments/0x52/fragment_0x52_26DCC0.o(.bss);
        build/src/fragments/0x52/fragment_0x52_26E090.o(.bss);
        build/src/fragments/0x52/fragment_0x52_26E4C0.o(.bss);
        fragment_0x52_BSS_END = .;
        fragment_0x52_BSS_SIZE = ABSOLUTE(fragment_0x52_BSS_END - fragment_0x52_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x52);
    fragment_0x52_ROM_END = __romPos;
    fragment_0x52_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x53_ROM_START = __romPos;
    fragment_0x53_VRAM = ADDR(.fragment_0x53);
    .fragment_0x53 0x86300000 : AT(fragment_0x53_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x53_TEXT_START = .;
        build/asm/us/data/fragments/0x53/fragment_0x53_header.o(.text);
        build/src/fragments/0x53/fragment_0x53_275E40.o(.text);
        build/src/fragments/0x53/fragment_0x53_279A20.o(.text);
        build/src/fragments/0x53/fragment_0x53_279D70.o(.text);
        build/src/fragments/0x53/fragment_0x53_27A440.o(.text);
        build/src/fragments/0x53/fragment_0x53_27A740.o(.text);
        build/src/fragments/0x53/fragment_0x53_27AC10.o(.text);
        build/src/fragments/0x53/fragment_0x53_27B9E0.o(.text);
        fragment_0x53_TEXT_END = .;
        fragment_0x53_TEXT_SIZE = ABSOLUTE(fragment_0x53_TEXT_END - fragment_0x53_TEXT_START);
        fragment_0x53_DATA_START = .;
        fragments_0x53_fragment_0x53_header = .;
        build/asm/us/data/fragments/0x53/fragment_0x53_header.o(.data);
        fragments_0x53_fragment_0x53_275E40 = .;
        build/src/fragments/0x53/fragment_0x53_275E40.o(.data);
        fragments_0x53_fragment_0x53_279A20 = .;
        build/src/fragments/0x53/fragment_0x53_279A20.o(.data);
        fragments_0x53_fragment_0x53_279D70 = .;
        build/src/fragments/0x53/fragment_0x53_279D70.o(.data);
        fragments_0x53_fragment_0x53_27A440 = .;
        build/src/fragments/0x53/fragment_0x53_27A440.o(.data);
        fragments_0x53_fragment_0x53_27A740 = .;
        build/src/fragments/0x53/fragment_0x53_27A740.o(.data);
        fragments_0x53_fragment_0x53_27AC10 = .;
        build/src/fragments/0x53/fragment_0x53_27AC10.o(.data);
        fragments_0x53_fragment_0x53_27B9E0 = .;
        build/src/fragments/0x53/fragment_0x53_27B9E0.o(.data);
        fragments_0x53_fragment_0x53_data_data = .;
        build/asm/us/data/fragments/0x53/fragment_0x53_data.data.o(.data);
        fragment_0x53_DATA_END = .;
        fragment_0x53_DATA_SIZE = ABSOLUTE(fragment_0x53_DATA_END - fragment_0x53_DATA_START);
        fragment_0x53_RODATA_START = .;
        build/asm/us/data/fragments/0x53/fragment_0x53_header.o(.rodata);
        build/src/fragments/0x53/fragment_0x53_275E40.o(.rodata);
        build/src/fragments/0x53/fragment_0x53_279A20.o(.rodata);
        build/src/fragments/0x53/fragment_0x53_279D70.o(.rodata);
        build/src/fragments/0x53/fragment_0x53_27A440.o(.rodata);
        build/src/fragments/0x53/fragment_0x53_27A740.o(.rodata);
        build/src/fragments/0x53/fragment_0x53_27AC10.o(.rodata);
        build/src/fragments/0x53/fragment_0x53_27B9E0.o(.rodata);
        fragment_0x53_RODATA_END = .;
        fragment_0x53_RODATA_SIZE = ABSOLUTE(fragment_0x53_RODATA_END - fragment_0x53_RODATA_START);
    }
    fragment_0x53_bss_VRAM = ADDR(.fragment_0x53_bss);
    .fragment_0x53_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x53_BSS_START = .;
        build/asm/us/data/fragments/0x53/fragment_0x53_header.o(.bss);
        build/src/fragments/0x53/fragment_0x53_275E40.o(.bss);
        build/src/fragments/0x53/fragment_0x53_279A20.o(.bss);
        build/src/fragments/0x53/fragment_0x53_279D70.o(.bss);
        build/src/fragments/0x53/fragment_0x53_27A440.o(.bss);
        build/src/fragments/0x53/fragment_0x53_27A740.o(.bss);
        build/src/fragments/0x53/fragment_0x53_27AC10.o(.bss);
        build/src/fragments/0x53/fragment_0x53_27B9E0.o(.bss);
        fragment_0x53_BSS_END = .;
        fragment_0x53_BSS_SIZE = ABSOLUTE(fragment_0x53_BSS_END - fragment_0x53_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x53);
    fragment_0x53_ROM_END = __romPos;
    fragment_0x53_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x54_ROM_START = __romPos;
    fragment_0x54_VRAM = ADDR(.fragment_0x54);
    .fragment_0x54 0x86400000 : AT(fragment_0x54_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x54_TEXT_START = .;
        build/asm/us/data/fragments/0x54/fragment_0x54_header.o(.text);
        build/src/fragments/0x54/fragment_0x54_27E4E0.o(.text);
        build/src/fragments/0x54/fragment_0x54_2853B0.o(.text);
        build/src/fragments/0x54/fragment_0x54_285750.o(.text);
        build/src/fragments/0x54/fragment_0x54_285F60.o(.text);
        build/src/fragments/0x54/fragment_0x54_2862C0.o(.text);
        build/src/fragments/0x54/fragment_0x54_2870A0.o(.text);
        build/src/fragments/0x54/fragment_0x54_2871C0.o(.text);
        fragment_0x54_TEXT_END = .;
        fragment_0x54_TEXT_SIZE = ABSOLUTE(fragment_0x54_TEXT_END - fragment_0x54_TEXT_START);
        fragment_0x54_DATA_START = .;
        fragments_0x54_fragment_0x54_header = .;
        build/asm/us/data/fragments/0x54/fragment_0x54_header.o(.data);
        fragments_0x54_fragment_0x54_27E4E0 = .;
        build/src/fragments/0x54/fragment_0x54_27E4E0.o(.data);
        fragments_0x54_fragment_0x54_2853B0 = .;
        build/src/fragments/0x54/fragment_0x54_2853B0.o(.data);
        fragments_0x54_fragment_0x54_285750 = .;
        build/src/fragments/0x54/fragment_0x54_285750.o(.data);
        fragments_0x54_fragment_0x54_285F60 = .;
        build/src/fragments/0x54/fragment_0x54_285F60.o(.data);
        fragments_0x54_fragment_0x54_2862C0 = .;
        build/src/fragments/0x54/fragment_0x54_2862C0.o(.data);
        fragments_0x54_fragment_0x54_2870A0 = .;
        build/src/fragments/0x54/fragment_0x54_2870A0.o(.data);
        fragments_0x54_fragment_0x54_2871C0 = .;
        build/src/fragments/0x54/fragment_0x54_2871C0.o(.data);
        fragments_0x54_fragment_0x54_data_data = .;
        build/asm/us/data/fragments/0x54/fragment_0x54_data.data.o(.data);
        fragment_0x54_DATA_END = .;
        fragment_0x54_DATA_SIZE = ABSOLUTE(fragment_0x54_DATA_END - fragment_0x54_DATA_START);
        fragment_0x54_RODATA_START = .;
        build/asm/us/data/fragments/0x54/fragment_0x54_header.o(.rodata);
        build/src/fragments/0x54/fragment_0x54_27E4E0.o(.rodata);
        build/src/fragments/0x54/fragment_0x54_2853B0.o(.rodata);
        build/src/fragments/0x54/fragment_0x54_285750.o(.rodata);
        build/src/fragments/0x54/fragment_0x54_285F60.o(.rodata);
        build/src/fragments/0x54/fragment_0x54_2862C0.o(.rodata);
        build/src/fragments/0x54/fragment_0x54_2870A0.o(.rodata);
        build/src/fragments/0x54/fragment_0x54_2871C0.o(.rodata);
        fragment_0x54_RODATA_END = .;
        fragment_0x54_RODATA_SIZE = ABSOLUTE(fragment_0x54_RODATA_END - fragment_0x54_RODATA_START);
    }
    fragment_0x54_bss_VRAM = ADDR(.fragment_0x54_bss);
    .fragment_0x54_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x54_BSS_START = .;
        build/asm/us/data/fragments/0x54/fragment_0x54_header.o(.bss);
        build/src/fragments/0x54/fragment_0x54_27E4E0.o(.bss);
        build/src/fragments/0x54/fragment_0x54_2853B0.o(.bss);
        build/src/fragments/0x54/fragment_0x54_285750.o(.bss);
        build/src/fragments/0x54/fragment_0x54_285F60.o(.bss);
        build/src/fragments/0x54/fragment_0x54_2862C0.o(.bss);
        build/src/fragments/0x54/fragment_0x54_2870A0.o(.bss);
        build/src/fragments/0x54/fragment_0x54_2871C0.o(.bss);
        fragment_0x54_BSS_END = .;
        fragment_0x54_BSS_SIZE = ABSOLUTE(fragment_0x54_BSS_END - fragment_0x54_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x54);
    fragment_0x54_ROM_END = __romPos;
    fragment_0x54_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x55_ROM_START = __romPos;
    fragment_0x55_VRAM = ADDR(.fragment_0x55);
    .fragment_0x55 0x86500000 : AT(fragment_0x55_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x55_TEXT_START = .;
        build/asm/us/data/fragments/0x55/fragment_0x55_header.o(.text);
        build/src/fragments/0x55/fragment_0x55_code.o(.text);
        fragment_0x55_TEXT_END = .;
        fragment_0x55_TEXT_SIZE = ABSOLUTE(fragment_0x55_TEXT_END - fragment_0x55_TEXT_START);
        fragment_0x55_DATA_START = .;
        fragments_0x55_fragment_0x55_header = .;
        build/asm/us/data/fragments/0x55/fragment_0x55_header.o(.data);
        fragments_0x55_fragment_0x55_code = .;
        build/src/fragments/0x55/fragment_0x55_code.o(.data);
        fragments_0x55_fragment_0x55_data_data = .;
        build/asm/us/data/fragments/0x55/fragment_0x55_data.data.o(.data);
        fragment_0x55_DATA_END = .;
        fragment_0x55_DATA_SIZE = ABSOLUTE(fragment_0x55_DATA_END - fragment_0x55_DATA_START);
        fragment_0x55_RODATA_START = .;
        build/asm/us/data/fragments/0x55/fragment_0x55_header.o(.rodata);
        build/src/fragments/0x55/fragment_0x55_code.o(.rodata);
        fragment_0x55_RODATA_END = .;
        fragment_0x55_RODATA_SIZE = ABSOLUTE(fragment_0x55_RODATA_END - fragment_0x55_RODATA_START);
    }
    fragment_0x55_bss_VRAM = ADDR(.fragment_0x55_bss);
    .fragment_0x55_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x55_BSS_START = .;
        build/asm/us/data/fragments/0x55/fragment_0x55_header.o(.bss);
        build/src/fragments/0x55/fragment_0x55_code.o(.bss);
        fragment_0x55_BSS_END = .;
        fragment_0x55_BSS_SIZE = ABSOLUTE(fragment_0x55_BSS_END - fragment_0x55_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x55);
    fragment_0x55_ROM_END = __romPos;
    fragment_0x55_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x56_ROM_START = __romPos;
    fragment_0x56_VRAM = ADDR(.fragment_0x56);
    .fragment_0x56 0x86600000 : AT(fragment_0x56_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x56_TEXT_START = .;
        build/asm/us/data/fragments/0x56/fragment_0x56_header.o(.text);
        build/src/fragments/0x56/fragment_0x56_code.o(.text);
        fragment_0x56_TEXT_END = .;
        fragment_0x56_TEXT_SIZE = ABSOLUTE(fragment_0x56_TEXT_END - fragment_0x56_TEXT_START);
        fragment_0x56_DATA_START = .;
        fragments_0x56_fragment_0x56_header = .;
        build/asm/us/data/fragments/0x56/fragment_0x56_header.o(.data);
        fragments_0x56_fragment_0x56_code = .;
        build/src/fragments/0x56/fragment_0x56_code.o(.data);
        fragments_0x56_fragment_0x56_data_data = .;
        build/asm/us/data/fragments/0x56/fragment_0x56_data.data.o(.data);
        fragment_0x56_DATA_END = .;
        fragment_0x56_DATA_SIZE = ABSOLUTE(fragment_0x56_DATA_END - fragment_0x56_DATA_START);
        fragment_0x56_RODATA_START = .;
        build/asm/us/data/fragments/0x56/fragment_0x56_header.o(.rodata);
        build/src/fragments/0x56/fragment_0x56_code.o(.rodata);
        fragment_0x56_RODATA_END = .;
        fragment_0x56_RODATA_SIZE = ABSOLUTE(fragment_0x56_RODATA_END - fragment_0x56_RODATA_START);
    }
    fragment_0x56_bss_VRAM = ADDR(.fragment_0x56_bss);
    .fragment_0x56_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x56_BSS_START = .;
        build/asm/us/data/fragments/0x56/fragment_0x56_header.o(.bss);
        build/src/fragments/0x56/fragment_0x56_code.o(.bss);
        fragment_0x56_BSS_END = .;
        fragment_0x56_BSS_SIZE = ABSOLUTE(fragment_0x56_BSS_END - fragment_0x56_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x56);
    fragment_0x56_ROM_END = __romPos;
    fragment_0x56_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x57_ROM_START = __romPos;
    fragment_0x57_VRAM = ADDR(.fragment_0x57);
    .fragment_0x57 0x86700000 : AT(fragment_0x57_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x57_TEXT_START = .;
        build/asm/us/data/fragments/0x57/fragment_0x57_header.o(.text);
        build/src/fragments/0x57/fragment_0x57_code.o(.text);
        fragment_0x57_TEXT_END = .;
        fragment_0x57_TEXT_SIZE = ABSOLUTE(fragment_0x57_TEXT_END - fragment_0x57_TEXT_START);
        fragment_0x57_DATA_START = .;
        fragments_0x57_fragment_0x57_header = .;
        build/asm/us/data/fragments/0x57/fragment_0x57_header.o(.data);
        fragments_0x57_fragment_0x57_code = .;
        build/src/fragments/0x57/fragment_0x57_code.o(.data);
        fragments_0x57_fragment_0x57_data_data = .;
        build/asm/us/data/fragments/0x57/fragment_0x57_data.data.o(.data);
        fragment_0x57_DATA_END = .;
        fragment_0x57_DATA_SIZE = ABSOLUTE(fragment_0x57_DATA_END - fragment_0x57_DATA_START);
        fragment_0x57_RODATA_START = .;
        build/asm/us/data/fragments/0x57/fragment_0x57_header.o(.rodata);
        build/src/fragments/0x57/fragment_0x57_code.o(.rodata);
        fragment_0x57_RODATA_END = .;
        fragment_0x57_RODATA_SIZE = ABSOLUTE(fragment_0x57_RODATA_END - fragment_0x57_RODATA_START);
    }
    fragment_0x57_bss_VRAM = ADDR(.fragment_0x57_bss);
    .fragment_0x57_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x57_BSS_START = .;
        build/asm/us/data/fragments/0x57/fragment_0x57_header.o(.bss);
        build/src/fragments/0x57/fragment_0x57_code.o(.bss);
        fragment_0x57_BSS_END = .;
        fragment_0x57_BSS_SIZE = ABSOLUTE(fragment_0x57_BSS_END - fragment_0x57_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x57);
    fragment_0x57_ROM_END = __romPos;
    fragment_0x57_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x58_ROM_START = __romPos;
    fragment_0x58_VRAM = ADDR(.fragment_0x58);
    .fragment_0x58 0x86800000 : AT(fragment_0x58_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x58_TEXT_START = .;
        build/asm/us/data/fragments/0x58/fragment_0x58_header.o(.text);
        build/src/fragments/0x58/fragment_0x58_code.o(.text);
        fragment_0x58_TEXT_END = .;
        fragment_0x58_TEXT_SIZE = ABSOLUTE(fragment_0x58_TEXT_END - fragment_0x58_TEXT_START);
        fragment_0x58_DATA_START = .;
        fragments_0x58_fragment_0x58_header = .;
        build/asm/us/data/fragments/0x58/fragment_0x58_header.o(.data);
        fragments_0x58_fragment_0x58_code = .;
        build/src/fragments/0x58/fragment_0x58_code.o(.data);
        fragments_0x58_fragment_0x58_data_data = .;
        build/asm/us/data/fragments/0x58/fragment_0x58_data.data.o(.data);
        fragment_0x58_DATA_END = .;
        fragment_0x58_DATA_SIZE = ABSOLUTE(fragment_0x58_DATA_END - fragment_0x58_DATA_START);
        fragment_0x58_RODATA_START = .;
        build/asm/us/data/fragments/0x58/fragment_0x58_header.o(.rodata);
        build/src/fragments/0x58/fragment_0x58_code.o(.rodata);
        fragment_0x58_RODATA_END = .;
        fragment_0x58_RODATA_SIZE = ABSOLUTE(fragment_0x58_RODATA_END - fragment_0x58_RODATA_START);
    }
    fragment_0x58_bss_VRAM = ADDR(.fragment_0x58_bss);
    .fragment_0x58_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x58_BSS_START = .;
        build/asm/us/data/fragments/0x58/fragment_0x58_header.o(.bss);
        build/src/fragments/0x58/fragment_0x58_code.o(.bss);
        fragment_0x58_BSS_END = .;
        fragment_0x58_BSS_SIZE = ABSOLUTE(fragment_0x58_BSS_END - fragment_0x58_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x58);
    fragment_0x58_ROM_END = __romPos;
    fragment_0x58_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x23_ROM_START = __romPos;
    fragment_0x23_VRAM = ADDR(.fragment_0x23);
    .fragment_0x23 0x83300000 : AT(fragment_0x23_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x23_TEXT_START = .;
        build/asm/us/data/fragments/0x23/fragment_0x23_header.o(.text);
        build/src/fragments/0x23/fragment_0x23_code.o(.text);
        fragment_0x23_TEXT_END = .;
        fragment_0x23_TEXT_SIZE = ABSOLUTE(fragment_0x23_TEXT_END - fragment_0x23_TEXT_START);
        fragment_0x23_DATA_START = .;
        fragments_0x23_fragment_0x23_header = .;
        build/asm/us/data/fragments/0x23/fragment_0x23_header.o(.data);
        fragments_0x23_fragment_0x23_code = .;
        build/src/fragments/0x23/fragment_0x23_code.o(.data);
        fragments_0x23_fragment_0x23_data_data = .;
        build/asm/us/data/fragments/0x23/fragment_0x23_data.data.o(.data);
        fragment_0x23_DATA_END = .;
        fragment_0x23_DATA_SIZE = ABSOLUTE(fragment_0x23_DATA_END - fragment_0x23_DATA_START);
        fragment_0x23_RODATA_START = .;
        build/asm/us/data/fragments/0x23/fragment_0x23_header.o(.rodata);
        build/src/fragments/0x23/fragment_0x23_code.o(.rodata);
        fragment_0x23_RODATA_END = .;
        fragment_0x23_RODATA_SIZE = ABSOLUTE(fragment_0x23_RODATA_END - fragment_0x23_RODATA_START);
    }
    fragment_0x23_bss_VRAM = ADDR(.fragment_0x23_bss);
    .fragment_0x23_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x23_BSS_START = .;
        build/asm/us/data/fragments/0x23/fragment_0x23_header.o(.bss);
        build/src/fragments/0x23/fragment_0x23_code.o(.bss);
        fragment_0x23_BSS_END = .;
        fragment_0x23_BSS_SIZE = ABSOLUTE(fragment_0x23_BSS_END - fragment_0x23_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x23);
    fragment_0x23_ROM_END = __romPos;
    fragment_0x23_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x24_ROM_START = __romPos;
    fragment_0x24_VRAM = ADDR(.fragment_0x24);
    .fragment_0x24 0x83400000 : AT(fragment_0x24_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x24_TEXT_START = .;
        build/asm/us/data/fragments/0x24/fragment_0x24_header.o(.text);
        build/src/fragments/0x24/fragment_0x24_code.o(.text);
        fragment_0x24_TEXT_END = .;
        fragment_0x24_TEXT_SIZE = ABSOLUTE(fragment_0x24_TEXT_END - fragment_0x24_TEXT_START);
        fragment_0x24_DATA_START = .;
        fragments_0x24_fragment_0x24_header = .;
        build/asm/us/data/fragments/0x24/fragment_0x24_header.o(.data);
        fragments_0x24_fragment_0x24_code = .;
        build/src/fragments/0x24/fragment_0x24_code.o(.data);
        fragments_0x24_fragment_0x24_data_data = .;
        build/asm/us/data/fragments/0x24/fragment_0x24_data.data.o(.data);
        fragment_0x24_DATA_END = .;
        fragment_0x24_DATA_SIZE = ABSOLUTE(fragment_0x24_DATA_END - fragment_0x24_DATA_START);
        fragment_0x24_RODATA_START = .;
        build/asm/us/data/fragments/0x24/fragment_0x24_header.o(.rodata);
        build/src/fragments/0x24/fragment_0x24_code.o(.rodata);
        fragment_0x24_RODATA_END = .;
        fragment_0x24_RODATA_SIZE = ABSOLUTE(fragment_0x24_RODATA_END - fragment_0x24_RODATA_START);
    }
    fragment_0x24_bss_VRAM = ADDR(.fragment_0x24_bss);
    .fragment_0x24_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x24_BSS_START = .;
        build/asm/us/data/fragments/0x24/fragment_0x24_header.o(.bss);
        build/src/fragments/0x24/fragment_0x24_code.o(.bss);
        fragment_0x24_BSS_END = .;
        fragment_0x24_BSS_SIZE = ABSOLUTE(fragment_0x24_BSS_END - fragment_0x24_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x24);
    fragment_0x24_ROM_END = __romPos;
    fragment_0x24_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x59_ROM_START = __romPos;
    fragment_0x59_VRAM = ADDR(.fragment_0x59);
    .fragment_0x59 0x86900000 : AT(fragment_0x59_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x59_TEXT_START = .;
        build/asm/us/data/fragments/0x59/fragment_0x59_header.o(.text);
        build/src/fragments/0x59/fragment_0x59_code.o(.text);
        fragment_0x59_TEXT_END = .;
        fragment_0x59_TEXT_SIZE = ABSOLUTE(fragment_0x59_TEXT_END - fragment_0x59_TEXT_START);
        fragment_0x59_DATA_START = .;
        fragments_0x59_fragment_0x59_header = .;
        build/asm/us/data/fragments/0x59/fragment_0x59_header.o(.data);
        fragments_0x59_fragment_0x59_code = .;
        build/src/fragments/0x59/fragment_0x59_code.o(.data);
        fragments_0x59_fragment_0x59_data_data = .;
        build/asm/us/data/fragments/0x59/fragment_0x59_data.data.o(.data);
        fragment_0x59_DATA_END = .;
        fragment_0x59_DATA_SIZE = ABSOLUTE(fragment_0x59_DATA_END - fragment_0x59_DATA_START);
        fragment_0x59_RODATA_START = .;
        build/asm/us/data/fragments/0x59/fragment_0x59_header.o(.rodata);
        build/src/fragments/0x59/fragment_0x59_code.o(.rodata);
        fragment_0x59_RODATA_END = .;
        fragment_0x59_RODATA_SIZE = ABSOLUTE(fragment_0x59_RODATA_END - fragment_0x59_RODATA_START);
    }
    fragment_0x59_bss_VRAM = ADDR(.fragment_0x59_bss);
    .fragment_0x59_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x59_BSS_START = .;
        build/asm/us/data/fragments/0x59/fragment_0x59_header.o(.bss);
        build/src/fragments/0x59/fragment_0x59_code.o(.bss);
        fragment_0x59_BSS_END = .;
        fragment_0x59_BSS_SIZE = ABSOLUTE(fragment_0x59_BSS_END - fragment_0x59_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x59);
    fragment_0x59_ROM_END = __romPos;
    fragment_0x59_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x5A_ROM_START = __romPos;
    fragment_0x5A_VRAM = ADDR(.fragment_0x5A);
    .fragment_0x5A 0x86A00000 : AT(fragment_0x5A_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x5A_TEXT_START = .;
        build/asm/us/data/fragments/0x5A/fragment_0x5A_header.o(.text);
        build/src/fragments/0x5A/fragment_0x5A_code.o(.text);
        fragment_0x5A_TEXT_END = .;
        fragment_0x5A_TEXT_SIZE = ABSOLUTE(fragment_0x5A_TEXT_END - fragment_0x5A_TEXT_START);
        fragment_0x5A_DATA_START = .;
        fragments_0x5A_fragment_0x5A_header = .;
        build/asm/us/data/fragments/0x5A/fragment_0x5A_header.o(.data);
        fragments_0x5A_fragment_0x5A_code = .;
        build/src/fragments/0x5A/fragment_0x5A_code.o(.data);
        fragments_0x5A_fragment_0x5A_data_data = .;
        build/asm/us/data/fragments/0x5A/fragment_0x5A_data.data.o(.data);
        fragment_0x5A_DATA_END = .;
        fragment_0x5A_DATA_SIZE = ABSOLUTE(fragment_0x5A_DATA_END - fragment_0x5A_DATA_START);
        fragment_0x5A_RODATA_START = .;
        build/asm/us/data/fragments/0x5A/fragment_0x5A_header.o(.rodata);
        build/src/fragments/0x5A/fragment_0x5A_code.o(.rodata);
        fragment_0x5A_RODATA_END = .;
        fragment_0x5A_RODATA_SIZE = ABSOLUTE(fragment_0x5A_RODATA_END - fragment_0x5A_RODATA_START);
    }
    fragment_0x5A_bss_VRAM = ADDR(.fragment_0x5A_bss);
    .fragment_0x5A_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x5A_BSS_START = .;
        build/asm/us/data/fragments/0x5A/fragment_0x5A_header.o(.bss);
        build/src/fragments/0x5A/fragment_0x5A_code.o(.bss);
        fragment_0x5A_BSS_END = .;
        fragment_0x5A_BSS_SIZE = ABSOLUTE(fragment_0x5A_BSS_END - fragment_0x5A_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x5A);
    fragment_0x5A_ROM_END = __romPos;
    fragment_0x5A_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x5B_ROM_START = __romPos;
    fragment_0x5B_VRAM = ADDR(.fragment_0x5B);
    .fragment_0x5B 0x86B00000 : AT(fragment_0x5B_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x5B_TEXT_START = .;
        build/asm/us/data/fragments/0x5B/fragment_0x5B_header.o(.text);
        build/src/fragments/0x5B/fragment_0x5B_code.o(.text);
        fragment_0x5B_TEXT_END = .;
        fragment_0x5B_TEXT_SIZE = ABSOLUTE(fragment_0x5B_TEXT_END - fragment_0x5B_TEXT_START);
        fragment_0x5B_DATA_START = .;
        fragments_0x5B_fragment_0x5B_header = .;
        build/asm/us/data/fragments/0x5B/fragment_0x5B_header.o(.data);
        fragments_0x5B_fragment_0x5B_code = .;
        build/src/fragments/0x5B/fragment_0x5B_code.o(.data);
        fragments_0x5B_fragment_0x5B_data_data = .;
        build/asm/us/data/fragments/0x5B/fragment_0x5B_data.data.o(.data);
        fragment_0x5B_DATA_END = .;
        fragment_0x5B_DATA_SIZE = ABSOLUTE(fragment_0x5B_DATA_END - fragment_0x5B_DATA_START);
        fragment_0x5B_RODATA_START = .;
        build/asm/us/data/fragments/0x5B/fragment_0x5B_header.o(.rodata);
        build/src/fragments/0x5B/fragment_0x5B_code.o(.rodata);
        fragment_0x5B_RODATA_END = .;
        fragment_0x5B_RODATA_SIZE = ABSOLUTE(fragment_0x5B_RODATA_END - fragment_0x5B_RODATA_START);
    }
    fragment_0x5B_bss_VRAM = ADDR(.fragment_0x5B_bss);
    .fragment_0x5B_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x5B_BSS_START = .;
        build/asm/us/data/fragments/0x5B/fragment_0x5B_header.o(.bss);
        build/src/fragments/0x5B/fragment_0x5B_code.o(.bss);
        fragment_0x5B_BSS_END = .;
        fragment_0x5B_BSS_SIZE = ABSOLUTE(fragment_0x5B_BSS_END - fragment_0x5B_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x5B);
    fragment_0x5B_ROM_END = __romPos;
    fragment_0x5B_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x5C_ROM_START = __romPos;
    fragment_0x5C_VRAM = ADDR(.fragment_0x5C);
    .fragment_0x5C 0x86C00000 : AT(fragment_0x5C_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x5C_TEXT_START = .;
        build/asm/us/data/fragments/0x5C/fragment_0x5C_header.o(.text);
        build/src/fragments/0x5C/fragment_0x5C_code.o(.text);
        fragment_0x5C_TEXT_END = .;
        fragment_0x5C_TEXT_SIZE = ABSOLUTE(fragment_0x5C_TEXT_END - fragment_0x5C_TEXT_START);
        fragment_0x5C_DATA_START = .;
        fragments_0x5C_fragment_0x5C_header = .;
        build/asm/us/data/fragments/0x5C/fragment_0x5C_header.o(.data);
        fragments_0x5C_fragment_0x5C_code = .;
        build/src/fragments/0x5C/fragment_0x5C_code.o(.data);
        fragments_0x5C_fragment_0x5C_data_data = .;
        build/asm/us/data/fragments/0x5C/fragment_0x5C_data.data.o(.data);
        fragment_0x5C_DATA_END = .;
        fragment_0x5C_DATA_SIZE = ABSOLUTE(fragment_0x5C_DATA_END - fragment_0x5C_DATA_START);
        fragment_0x5C_RODATA_START = .;
        build/asm/us/data/fragments/0x5C/fragment_0x5C_header.o(.rodata);
        build/src/fragments/0x5C/fragment_0x5C_code.o(.rodata);
        fragment_0x5C_RODATA_END = .;
        fragment_0x5C_RODATA_SIZE = ABSOLUTE(fragment_0x5C_RODATA_END - fragment_0x5C_RODATA_START);
    }
    fragment_0x5C_bss_VRAM = ADDR(.fragment_0x5C_bss);
    .fragment_0x5C_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x5C_BSS_START = .;
        build/asm/us/data/fragments/0x5C/fragment_0x5C_header.o(.bss);
        build/src/fragments/0x5C/fragment_0x5C_code.o(.bss);
        fragment_0x5C_BSS_END = .;
        fragment_0x5C_BSS_SIZE = ABSOLUTE(fragment_0x5C_BSS_END - fragment_0x5C_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x5C);
    fragment_0x5C_ROM_END = __romPos;
    fragment_0x5C_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x6E_ROM_START = __romPos;
    fragment_0x6E_VRAM = ADDR(.fragment_0x6E);
    .fragment_0x6E 0x87E00000 : AT(fragment_0x6E_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6E_TEXT_START = .;
        build/asm/us/data/fragments/0x6E/fragment_0x6E_header.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_303990.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_305090.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_306150.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_307D60.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_308D70.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_30B540.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_30E370.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_30F070.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_310270.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_312AE0.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_315A90.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_317060.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_31BD80.o(.text);
        build/src/fragments/0x6E/fragment_0x6E_31CB20.o(.text);
        fragment_0x6E_TEXT_END = .;
        fragment_0x6E_TEXT_SIZE = ABSOLUTE(fragment_0x6E_TEXT_END - fragment_0x6E_TEXT_START);
        fragment_0x6E_DATA_START = .;
        fragments_0x6E_fragment_0x6E_header = .;
        build/asm/us/data/fragments/0x6E/fragment_0x6E_header.o(.data);
        fragments_0x6E_fragment_0x6E_303990 = .;
        build/src/fragments/0x6E/fragment_0x6E_303990.o(.data);
        fragments_0x6E_fragment_0x6E_305090 = .;
        build/src/fragments/0x6E/fragment_0x6E_305090.o(.data);
        fragments_0x6E_fragment_0x6E_306150 = .;
        build/src/fragments/0x6E/fragment_0x6E_306150.o(.data);
        fragments_0x6E_fragment_0x6E_307D60 = .;
        build/src/fragments/0x6E/fragment_0x6E_307D60.o(.data);
        fragments_0x6E_fragment_0x6E_308D70 = .;
        build/src/fragments/0x6E/fragment_0x6E_308D70.o(.data);
        fragments_0x6E_fragment_0x6E_30B540 = .;
        build/src/fragments/0x6E/fragment_0x6E_30B540.o(.data);
        fragments_0x6E_fragment_0x6E_30E370 = .;
        build/src/fragments/0x6E/fragment_0x6E_30E370.o(.data);
        fragments_0x6E_fragment_0x6E_30F070 = .;
        build/src/fragments/0x6E/fragment_0x6E_30F070.o(.data);
        fragments_0x6E_fragment_0x6E_310270 = .;
        build/src/fragments/0x6E/fragment_0x6E_310270.o(.data);
        fragments_0x6E_fragment_0x6E_312AE0 = .;
        build/src/fragments/0x6E/fragment_0x6E_312AE0.o(.data);
        fragments_0x6E_fragment_0x6E_315A90 = .;
        build/src/fragments/0x6E/fragment_0x6E_315A90.o(.data);
        fragments_0x6E_fragment_0x6E_317060 = .;
        build/src/fragments/0x6E/fragment_0x6E_317060.o(.data);
        fragments_0x6E_fragment_0x6E_31BD80 = .;
        build/src/fragments/0x6E/fragment_0x6E_31BD80.o(.data);
        fragments_0x6E_fragment_0x6E_31CB20 = .;
        build/src/fragments/0x6E/fragment_0x6E_31CB20.o(.data);
        fragments_0x6E_fragment_0x6E_data_data = .;
        build/asm/us/data/fragments/0x6E/fragment_0x6E_data.data.o(.data);
        fragment_0x6E_DATA_END = .;
        fragment_0x6E_DATA_SIZE = ABSOLUTE(fragment_0x6E_DATA_END - fragment_0x6E_DATA_START);
        fragment_0x6E_RODATA_START = .;
        build/asm/us/data/fragments/0x6E/fragment_0x6E_header.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_303990.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_305090.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_306150.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_307D60.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_308D70.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_30B540.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_30E370.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_30F070.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_310270.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_312AE0.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_315A90.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_317060.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_31BD80.o(.rodata);
        build/src/fragments/0x6E/fragment_0x6E_31CB20.o(.rodata);
        fragment_0x6E_RODATA_END = .;
        fragment_0x6E_RODATA_SIZE = ABSOLUTE(fragment_0x6E_RODATA_END - fragment_0x6E_RODATA_START);
    }
    fragment_0x6E_bss_VRAM = ADDR(.fragment_0x6E_bss);
    .fragment_0x6E_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6E_BSS_START = .;
        build/asm/us/data/fragments/0x6E/fragment_0x6E_header.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_303990.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_305090.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_306150.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_307D60.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_308D70.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_30B540.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_30E370.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_30F070.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_310270.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_312AE0.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_315A90.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_317060.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_31BD80.o(.bss);
        build/src/fragments/0x6E/fragment_0x6E_31CB20.o(.bss);
        fragment_0x6E_BSS_END = .;
        fragment_0x6E_BSS_SIZE = ABSOLUTE(fragment_0x6E_BSS_END - fragment_0x6E_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x6E);
    fragment_0x6E_ROM_END = __romPos;
    fragment_0x6E_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x6F_ROM_START = __romPos;
    fragment_0x6F_VRAM = ADDR(.fragment_0x6F);
    .fragment_0x6F 0x87F00000 : AT(fragment_0x6F_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6F_TEXT_START = .;
        build/asm/us/data/fragments/0x6F/fragment_0x6F_header.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_322C90.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_3235A0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_324A10.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_324FB0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_325920.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_326160.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_326820.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_326ED0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_328C20.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_328E40.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_3290A0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32AEF0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32BC10.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32C420.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32D260.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32D7D0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32DC40.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32EC70.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32F2C0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32F5F0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_32FE10.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_330850.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_331000.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_3312D0.o(.text);
        build/src/fragments/0x6F/fragment_0x6F_3320F0.o(.text);
        fragment_0x6F_TEXT_END = .;
        fragment_0x6F_TEXT_SIZE = ABSOLUTE(fragment_0x6F_TEXT_END - fragment_0x6F_TEXT_START);
        fragment_0x6F_DATA_START = .;
        fragments_0x6F_fragment_0x6F_header = .;
        build/asm/us/data/fragments/0x6F/fragment_0x6F_header.o(.data);
        fragments_0x6F_fragment_0x6F_322C90 = .;
        build/src/fragments/0x6F/fragment_0x6F_322C90.o(.data);
        fragments_0x6F_fragment_0x6F_3235A0 = .;
        build/src/fragments/0x6F/fragment_0x6F_3235A0.o(.data);
        fragments_0x6F_fragment_0x6F_324A10 = .;
        build/src/fragments/0x6F/fragment_0x6F_324A10.o(.data);
        fragments_0x6F_fragment_0x6F_324FB0 = .;
        build/src/fragments/0x6F/fragment_0x6F_324FB0.o(.data);
        fragments_0x6F_fragment_0x6F_325920 = .;
        build/src/fragments/0x6F/fragment_0x6F_325920.o(.data);
        fragments_0x6F_fragment_0x6F_326160 = .;
        build/src/fragments/0x6F/fragment_0x6F_326160.o(.data);
        fragments_0x6F_fragment_0x6F_326820 = .;
        build/src/fragments/0x6F/fragment_0x6F_326820.o(.data);
        fragments_0x6F_fragment_0x6F_326ED0 = .;
        build/src/fragments/0x6F/fragment_0x6F_326ED0.o(.data);
        fragments_0x6F_fragment_0x6F_328C20 = .;
        build/src/fragments/0x6F/fragment_0x6F_328C20.o(.data);
        fragments_0x6F_fragment_0x6F_328E40 = .;
        build/src/fragments/0x6F/fragment_0x6F_328E40.o(.data);
        fragments_0x6F_fragment_0x6F_3290A0 = .;
        build/src/fragments/0x6F/fragment_0x6F_3290A0.o(.data);
        fragments_0x6F_fragment_0x6F_32AEF0 = .;
        build/src/fragments/0x6F/fragment_0x6F_32AEF0.o(.data);
        fragments_0x6F_fragment_0x6F_32BC10 = .;
        build/src/fragments/0x6F/fragment_0x6F_32BC10.o(.data);
        fragments_0x6F_fragment_0x6F_32C420 = .;
        build/src/fragments/0x6F/fragment_0x6F_32C420.o(.data);
        fragments_0x6F_fragment_0x6F_32D260 = .;
        build/src/fragments/0x6F/fragment_0x6F_32D260.o(.data);
        fragments_0x6F_fragment_0x6F_32D7D0 = .;
        build/src/fragments/0x6F/fragment_0x6F_32D7D0.o(.data);
        fragments_0x6F_fragment_0x6F_32DC40 = .;
        build/src/fragments/0x6F/fragment_0x6F_32DC40.o(.data);
        fragments_0x6F_fragment_0x6F_32EC70 = .;
        build/src/fragments/0x6F/fragment_0x6F_32EC70.o(.data);
        fragments_0x6F_fragment_0x6F_32F2C0 = .;
        build/src/fragments/0x6F/fragment_0x6F_32F2C0.o(.data);
        fragments_0x6F_fragment_0x6F_32F5F0 = .;
        build/src/fragments/0x6F/fragment_0x6F_32F5F0.o(.data);
        fragments_0x6F_fragment_0x6F_32FE10 = .;
        build/src/fragments/0x6F/fragment_0x6F_32FE10.o(.data);
        fragments_0x6F_fragment_0x6F_330850 = .;
        build/src/fragments/0x6F/fragment_0x6F_330850.o(.data);
        fragments_0x6F_fragment_0x6F_331000 = .;
        build/src/fragments/0x6F/fragment_0x6F_331000.o(.data);
        fragments_0x6F_fragment_0x6F_3312D0 = .;
        build/src/fragments/0x6F/fragment_0x6F_3312D0.o(.data);
        fragments_0x6F_fragment_0x6F_3320F0 = .;
        build/src/fragments/0x6F/fragment_0x6F_3320F0.o(.data);
        fragments_0x6F_fragment_0x6F_data_data = .;
        build/asm/us/data/fragments/0x6F/fragment_0x6F_data.data.o(.data);
        fragment_0x6F_DATA_END = .;
        fragment_0x6F_DATA_SIZE = ABSOLUTE(fragment_0x6F_DATA_END - fragment_0x6F_DATA_START);
        fragment_0x6F_RODATA_START = .;
        build/asm/us/data/fragments/0x6F/fragment_0x6F_header.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_322C90.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_3235A0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_324A10.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_324FB0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_325920.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_326160.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_326820.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_326ED0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_328C20.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_328E40.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_3290A0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32AEF0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32BC10.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32C420.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32D260.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32D7D0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32DC40.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32EC70.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32F2C0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32F5F0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_32FE10.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_330850.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_331000.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_3312D0.o(.rodata);
        build/src/fragments/0x6F/fragment_0x6F_3320F0.o(.rodata);
        fragment_0x6F_RODATA_END = .;
        fragment_0x6F_RODATA_SIZE = ABSOLUTE(fragment_0x6F_RODATA_END - fragment_0x6F_RODATA_START);
    }
    fragment_0x6F_bss_VRAM = ADDR(.fragment_0x6F_bss);
    .fragment_0x6F_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6F_BSS_START = .;
        build/asm/us/data/fragments/0x6F/fragment_0x6F_header.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_322C90.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_3235A0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_324A10.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_324FB0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_325920.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_326160.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_326820.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_326ED0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_328C20.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_328E40.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_3290A0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32AEF0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32BC10.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32C420.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32D260.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32D7D0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32DC40.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32EC70.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32F2C0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32F5F0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_32FE10.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_330850.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_331000.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_3312D0.o(.bss);
        build/src/fragments/0x6F/fragment_0x6F_3320F0.o(.bss);
        fragment_0x6F_BSS_END = .;
        fragment_0x6F_BSS_SIZE = ABSOLUTE(fragment_0x6F_BSS_END - fragment_0x6F_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x6F);
    fragment_0x6F_ROM_END = __romPos;
    fragment_0x6F_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x6D_ROM_START = __romPos;
    fragment_0x6D_VRAM = ADDR(.fragment_0x6D);
    .fragment_0x6D 0x87D00000 : AT(fragment_0x6D_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6D_TEXT_START = .;
        build/asm/us/data/fragments/0x6D/fragment_0x6D_header.o(.text);
        build/src/fragments/0x6D/fragment_0x6D_code.o(.text);
        fragment_0x6D_TEXT_END = .;
        fragment_0x6D_TEXT_SIZE = ABSOLUTE(fragment_0x6D_TEXT_END - fragment_0x6D_TEXT_START);
        fragment_0x6D_DATA_START = .;
        fragments_0x6D_fragment_0x6D_header = .;
        build/asm/us/data/fragments/0x6D/fragment_0x6D_header.o(.data);
        fragments_0x6D_fragment_0x6D_code = .;
        build/src/fragments/0x6D/fragment_0x6D_code.o(.data);
        fragments_0x6D_fragment_0x6D_data_data = .;
        build/asm/us/data/fragments/0x6D/fragment_0x6D_data.data.o(.data);
        fragment_0x6D_DATA_END = .;
        fragment_0x6D_DATA_SIZE = ABSOLUTE(fragment_0x6D_DATA_END - fragment_0x6D_DATA_START);
        fragment_0x6D_RODATA_START = .;
        build/asm/us/data/fragments/0x6D/fragment_0x6D_header.o(.rodata);
        build/src/fragments/0x6D/fragment_0x6D_code.o(.rodata);
        fragment_0x6D_RODATA_END = .;
        fragment_0x6D_RODATA_SIZE = ABSOLUTE(fragment_0x6D_RODATA_END - fragment_0x6D_RODATA_START);
    }
    fragment_0x6D_bss_VRAM = ADDR(.fragment_0x6D_bss);
    .fragment_0x6D_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x6D_BSS_START = .;
        build/asm/us/data/fragments/0x6D/fragment_0x6D_header.o(.bss);
        build/src/fragments/0x6D/fragment_0x6D_code.o(.bss);
        fragment_0x6D_BSS_END = .;
        fragment_0x6D_BSS_SIZE = ABSOLUTE(fragment_0x6D_BSS_END - fragment_0x6D_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x6D);
    fragment_0x6D_ROM_END = __romPos;
    fragment_0x6D_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x1E_ROM_START = __romPos;
    fragment_0x1E_VRAM = ADDR(.fragment_0x1E);
    .fragment_0x1E 0x82E00000 : AT(fragment_0x1E_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1E_TEXT_START = .;
        build/asm/us/data/fragments/0x1E/fragment_0x1E_header.o(.text);
        build/src/fragments/0x1E/fragment_0x1E_code.o(.text);
        fragment_0x1E_TEXT_END = .;
        fragment_0x1E_TEXT_SIZE = ABSOLUTE(fragment_0x1E_TEXT_END - fragment_0x1E_TEXT_START);
        fragment_0x1E_DATA_START = .;
        fragments_0x1E_fragment_0x1E_header = .;
        build/asm/us/data/fragments/0x1E/fragment_0x1E_header.o(.data);
        fragments_0x1E_fragment_0x1E_code = .;
        build/src/fragments/0x1E/fragment_0x1E_code.o(.data);
        fragments_0x1E_fragment_0x1E_data_data = .;
        build/asm/us/data/fragments/0x1E/fragment_0x1E_data.data.o(.data);
        fragment_0x1E_DATA_END = .;
        fragment_0x1E_DATA_SIZE = ABSOLUTE(fragment_0x1E_DATA_END - fragment_0x1E_DATA_START);
        fragment_0x1E_RODATA_START = .;
        build/asm/us/data/fragments/0x1E/fragment_0x1E_header.o(.rodata);
        build/src/fragments/0x1E/fragment_0x1E_code.o(.rodata);
        fragment_0x1E_RODATA_END = .;
        fragment_0x1E_RODATA_SIZE = ABSOLUTE(fragment_0x1E_RODATA_END - fragment_0x1E_RODATA_START);
    }
    fragment_0x1E_bss_VRAM = ADDR(.fragment_0x1E_bss);
    .fragment_0x1E_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1E_BSS_START = .;
        build/asm/us/data/fragments/0x1E/fragment_0x1E_header.o(.bss);
        build/src/fragments/0x1E/fragment_0x1E_code.o(.bss);
        fragment_0x1E_BSS_END = .;
        fragment_0x1E_BSS_SIZE = ABSOLUTE(fragment_0x1E_BSS_END - fragment_0x1E_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x1E);
    fragment_0x1E_ROM_END = __romPos;
    fragment_0x1E_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x19_ROM_START = __romPos;
    fragment_0x19_VRAM = ADDR(.fragment_0x19);
    .fragment_0x19 0x82900000 : AT(fragment_0x19_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x19_TEXT_START = .;
        build/asm/us/data/fragments/0x19/fragment_0x19_header.o(.text);
        build/src/fragments/0x19/fragment_0x19_33CB20.o(.text);
        build/src/fragments/0x19/fragment_0x19_33D6A0.o(.text);
        build/src/fragments/0x19/fragment_0x19_33F420.o(.text);
        build/src/fragments/0x19/fragment_0x19_33FAE0.o(.text);
        build/src/fragments/0x19/fragment_0x19_3422F0.o(.text);
        build/src/fragments/0x19/fragment_0x19_342DB0.o(.text);
        build/src/fragments/0x19/fragment_0x19_343510.o(.text);
        build/src/fragments/0x19/fragment_0x19_344D70.o(.text);
        build/src/fragments/0x19/fragment_0x19_34AB40.o(.text);
        build/src/fragments/0x19/fragment_0x19_34B0F0.o(.text);
        build/src/fragments/0x19/fragment_0x19_34C8B0.o(.text);
        fragment_0x19_TEXT_END = .;
        fragment_0x19_TEXT_SIZE = ABSOLUTE(fragment_0x19_TEXT_END - fragment_0x19_TEXT_START);
        fragment_0x19_DATA_START = .;
        fragments_0x19_fragment_0x19_header = .;
        build/asm/us/data/fragments/0x19/fragment_0x19_header.o(.data);
        fragments_0x19_fragment_0x19_33CB20 = .;
        build/src/fragments/0x19/fragment_0x19_33CB20.o(.data);
        fragments_0x19_fragment_0x19_33D6A0 = .;
        build/src/fragments/0x19/fragment_0x19_33D6A0.o(.data);
        fragments_0x19_fragment_0x19_33F420 = .;
        build/src/fragments/0x19/fragment_0x19_33F420.o(.data);
        fragments_0x19_fragment_0x19_33FAE0 = .;
        build/src/fragments/0x19/fragment_0x19_33FAE0.o(.data);
        fragments_0x19_fragment_0x19_3422F0 = .;
        build/src/fragments/0x19/fragment_0x19_3422F0.o(.data);
        fragments_0x19_fragment_0x19_342DB0 = .;
        build/src/fragments/0x19/fragment_0x19_342DB0.o(.data);
        fragments_0x19_fragment_0x19_343510 = .;
        build/src/fragments/0x19/fragment_0x19_343510.o(.data);
        fragments_0x19_fragment_0x19_344D70 = .;
        build/src/fragments/0x19/fragment_0x19_344D70.o(.data);
        fragments_0x19_fragment_0x19_34AB40 = .;
        build/src/fragments/0x19/fragment_0x19_34AB40.o(.data);
        fragments_0x19_fragment_0x19_34B0F0 = .;
        build/src/fragments/0x19/fragment_0x19_34B0F0.o(.data);
        fragments_0x19_fragment_0x19_34C8B0 = .;
        build/src/fragments/0x19/fragment_0x19_34C8B0.o(.data);
        fragments_0x19_fragment_0x19_data_data = .;
        build/asm/us/data/fragments/0x19/fragment_0x19_data.data.o(.data);
        fragment_0x19_DATA_END = .;
        fragment_0x19_DATA_SIZE = ABSOLUTE(fragment_0x19_DATA_END - fragment_0x19_DATA_START);
        fragment_0x19_RODATA_START = .;
        build/asm/us/data/fragments/0x19/fragment_0x19_header.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_33CB20.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_33D6A0.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_33F420.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_33FAE0.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_3422F0.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_342DB0.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_343510.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_344D70.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_34AB40.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_34B0F0.o(.rodata);
        build/src/fragments/0x19/fragment_0x19_34C8B0.o(.rodata);
        fragment_0x19_RODATA_END = .;
        fragment_0x19_RODATA_SIZE = ABSOLUTE(fragment_0x19_RODATA_END - fragment_0x19_RODATA_START);
    }
    fragment_0x19_bss_VRAM = ADDR(.fragment_0x19_bss);
    .fragment_0x19_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x19_BSS_START = .;
        build/asm/us/data/fragments/0x19/fragment_0x19_header.o(.bss);
        build/src/fragments/0x19/fragment_0x19_33CB20.o(.bss);
        build/src/fragments/0x19/fragment_0x19_33D6A0.o(.bss);
        build/src/fragments/0x19/fragment_0x19_33F420.o(.bss);
        build/src/fragments/0x19/fragment_0x19_33FAE0.o(.bss);
        build/src/fragments/0x19/fragment_0x19_3422F0.o(.bss);
        build/src/fragments/0x19/fragment_0x19_342DB0.o(.bss);
        build/src/fragments/0x19/fragment_0x19_343510.o(.bss);
        build/src/fragments/0x19/fragment_0x19_344D70.o(.bss);
        build/src/fragments/0x19/fragment_0x19_34AB40.o(.bss);
        build/src/fragments/0x19/fragment_0x19_34B0F0.o(.bss);
        build/src/fragments/0x19/fragment_0x19_34C8B0.o(.bss);
        fragment_0x19_BSS_END = .;
        fragment_0x19_BSS_SIZE = ABSOLUTE(fragment_0x19_BSS_END - fragment_0x19_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x19);
    fragment_0x19_ROM_END = __romPos;
    fragment_0x19_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE0_ROM_START = __romPos;
    fragment_0xE0_VRAM = ADDR(.fragment_0xE0);
    .fragment_0xE0 0x8F000000 : AT(fragment_0xE0_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE0_TEXT_START = .;
        build/asm/us/data/fragments/0xE0/fragment_0xE0_header.o(.text);
        build/src/fragments/0xE0/fragment_0xE0_code.o(.text);
        fragment_0xE0_TEXT_END = .;
        fragment_0xE0_TEXT_SIZE = ABSOLUTE(fragment_0xE0_TEXT_END - fragment_0xE0_TEXT_START);
        fragment_0xE0_DATA_START = .;
        fragments_0xE0_fragment_0xE0_header = .;
        build/asm/us/data/fragments/0xE0/fragment_0xE0_header.o(.data);
        fragments_0xE0_fragment_0xE0_code = .;
        build/src/fragments/0xE0/fragment_0xE0_code.o(.data);
        fragments_0xE0_fragment_0xE0_data_data = .;
        build/asm/us/data/fragments/0xE0/fragment_0xE0_data.data.o(.data);
        fragment_0xE0_DATA_END = .;
        fragment_0xE0_DATA_SIZE = ABSOLUTE(fragment_0xE0_DATA_END - fragment_0xE0_DATA_START);
        fragment_0xE0_RODATA_START = .;
        build/asm/us/data/fragments/0xE0/fragment_0xE0_header.o(.rodata);
        build/src/fragments/0xE0/fragment_0xE0_code.o(.rodata);
        fragment_0xE0_RODATA_END = .;
        fragment_0xE0_RODATA_SIZE = ABSOLUTE(fragment_0xE0_RODATA_END - fragment_0xE0_RODATA_START);
    }
    fragment_0xE0_bss_VRAM = ADDR(.fragment_0xE0_bss);
    .fragment_0xE0_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE0_BSS_START = .;
        build/asm/us/data/fragments/0xE0/fragment_0xE0_header.o(.bss);
        build/src/fragments/0xE0/fragment_0xE0_code.o(.bss);
        fragment_0xE0_BSS_END = .;
        fragment_0xE0_BSS_SIZE = ABSOLUTE(fragment_0xE0_BSS_END - fragment_0xE0_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE0);
    fragment_0xE0_ROM_END = __romPos;
    fragment_0xE0_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE1_ROM_START = __romPos;
    fragment_0xE1_VRAM = ADDR(.fragment_0xE1);
    .fragment_0xE1 0x8F100000 : AT(fragment_0xE1_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE1_TEXT_START = .;
        build/asm/us/data/fragments/0xE1/fragment_0xE1_header.o(.text);
        build/src/fragments/0xE1/fragment_0xE1_code.o(.text);
        fragment_0xE1_TEXT_END = .;
        fragment_0xE1_TEXT_SIZE = ABSOLUTE(fragment_0xE1_TEXT_END - fragment_0xE1_TEXT_START);
        fragment_0xE1_DATA_START = .;
        fragments_0xE1_fragment_0xE1_header = .;
        build/asm/us/data/fragments/0xE1/fragment_0xE1_header.o(.data);
        fragments_0xE1_fragment_0xE1_code = .;
        build/src/fragments/0xE1/fragment_0xE1_code.o(.data);
        fragments_0xE1_fragment_0xE1_data_data = .;
        build/asm/us/data/fragments/0xE1/fragment_0xE1_data.data.o(.data);
        fragment_0xE1_DATA_END = .;
        fragment_0xE1_DATA_SIZE = ABSOLUTE(fragment_0xE1_DATA_END - fragment_0xE1_DATA_START);
        fragment_0xE1_RODATA_START = .;
        build/asm/us/data/fragments/0xE1/fragment_0xE1_header.o(.rodata);
        build/src/fragments/0xE1/fragment_0xE1_code.o(.rodata);
        fragment_0xE1_RODATA_END = .;
        fragment_0xE1_RODATA_SIZE = ABSOLUTE(fragment_0xE1_RODATA_END - fragment_0xE1_RODATA_START);
    }
    fragment_0xE1_bss_VRAM = ADDR(.fragment_0xE1_bss);
    .fragment_0xE1_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE1_BSS_START = .;
        build/asm/us/data/fragments/0xE1/fragment_0xE1_header.o(.bss);
        build/src/fragments/0xE1/fragment_0xE1_code.o(.bss);
        fragment_0xE1_BSS_END = .;
        fragment_0xE1_BSS_SIZE = ABSOLUTE(fragment_0xE1_BSS_END - fragment_0xE1_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE1);
    fragment_0xE1_ROM_END = __romPos;
    fragment_0xE1_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE2_ROM_START = __romPos;
    fragment_0xE2_VRAM = ADDR(.fragment_0xE2);
    .fragment_0xE2 0x8F200000 : AT(fragment_0xE2_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE2_TEXT_START = .;
        build/asm/us/data/fragments/0xE2/fragment_0xE2_header.o(.text);
        build/src/fragments/0xE2/fragment_0xE2_code.o(.text);
        fragment_0xE2_TEXT_END = .;
        fragment_0xE2_TEXT_SIZE = ABSOLUTE(fragment_0xE2_TEXT_END - fragment_0xE2_TEXT_START);
        fragment_0xE2_DATA_START = .;
        fragments_0xE2_fragment_0xE2_header = .;
        build/asm/us/data/fragments/0xE2/fragment_0xE2_header.o(.data);
        fragments_0xE2_fragment_0xE2_code = .;
        build/src/fragments/0xE2/fragment_0xE2_code.o(.data);
        fragments_0xE2_fragment_0xE2_data_data = .;
        build/asm/us/data/fragments/0xE2/fragment_0xE2_data.data.o(.data);
        fragment_0xE2_DATA_END = .;
        fragment_0xE2_DATA_SIZE = ABSOLUTE(fragment_0xE2_DATA_END - fragment_0xE2_DATA_START);
        fragment_0xE2_RODATA_START = .;
        build/asm/us/data/fragments/0xE2/fragment_0xE2_header.o(.rodata);
        build/src/fragments/0xE2/fragment_0xE2_code.o(.rodata);
        fragment_0xE2_RODATA_END = .;
        fragment_0xE2_RODATA_SIZE = ABSOLUTE(fragment_0xE2_RODATA_END - fragment_0xE2_RODATA_START);
    }
    fragment_0xE2_bss_VRAM = ADDR(.fragment_0xE2_bss);
    .fragment_0xE2_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE2_BSS_START = .;
        build/asm/us/data/fragments/0xE2/fragment_0xE2_header.o(.bss);
        build/src/fragments/0xE2/fragment_0xE2_code.o(.bss);
        fragment_0xE2_BSS_END = .;
        fragment_0xE2_BSS_SIZE = ABSOLUTE(fragment_0xE2_BSS_END - fragment_0xE2_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE2);
    fragment_0xE2_ROM_END = __romPos;
    fragment_0xE2_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE3_ROM_START = __romPos;
    fragment_0xE3_VRAM = ADDR(.fragment_0xE3);
    .fragment_0xE3 0x8F300000 : AT(fragment_0xE3_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE3_TEXT_START = .;
        build/asm/us/data/fragments/0xE3/fragment_0xE3_header.o(.text);
        build/src/fragments/0xE3/fragment_0xE3_code.o(.text);
        fragment_0xE3_TEXT_END = .;
        fragment_0xE3_TEXT_SIZE = ABSOLUTE(fragment_0xE3_TEXT_END - fragment_0xE3_TEXT_START);
        fragment_0xE3_DATA_START = .;
        fragments_0xE3_fragment_0xE3_header = .;
        build/asm/us/data/fragments/0xE3/fragment_0xE3_header.o(.data);
        fragments_0xE3_fragment_0xE3_code = .;
        build/src/fragments/0xE3/fragment_0xE3_code.o(.data);
        fragments_0xE3_fragment_0xE3_data_data = .;
        build/asm/us/data/fragments/0xE3/fragment_0xE3_data.data.o(.data);
        fragment_0xE3_DATA_END = .;
        fragment_0xE3_DATA_SIZE = ABSOLUTE(fragment_0xE3_DATA_END - fragment_0xE3_DATA_START);
        fragment_0xE3_RODATA_START = .;
        build/asm/us/data/fragments/0xE3/fragment_0xE3_header.o(.rodata);
        build/src/fragments/0xE3/fragment_0xE3_code.o(.rodata);
        fragment_0xE3_RODATA_END = .;
        fragment_0xE3_RODATA_SIZE = ABSOLUTE(fragment_0xE3_RODATA_END - fragment_0xE3_RODATA_START);
    }
    fragment_0xE3_bss_VRAM = ADDR(.fragment_0xE3_bss);
    .fragment_0xE3_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE3_BSS_START = .;
        build/asm/us/data/fragments/0xE3/fragment_0xE3_header.o(.bss);
        build/src/fragments/0xE3/fragment_0xE3_code.o(.bss);
        fragment_0xE3_BSS_END = .;
        fragment_0xE3_BSS_SIZE = ABSOLUTE(fragment_0xE3_BSS_END - fragment_0xE3_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE3);
    fragment_0xE3_ROM_END = __romPos;
    fragment_0xE3_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE4_ROM_START = __romPos;
    fragment_0xE4_VRAM = ADDR(.fragment_0xE4);
    .fragment_0xE4 0x8F400000 : AT(fragment_0xE4_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE4_TEXT_START = .;
        build/asm/us/data/fragments/0xE4/fragment_0xE4_header.o(.text);
        build/src/fragments/0xE4/fragment_0xE4_code.o(.text);
        fragment_0xE4_TEXT_END = .;
        fragment_0xE4_TEXT_SIZE = ABSOLUTE(fragment_0xE4_TEXT_END - fragment_0xE4_TEXT_START);
        fragment_0xE4_DATA_START = .;
        fragments_0xE4_fragment_0xE4_header = .;
        build/asm/us/data/fragments/0xE4/fragment_0xE4_header.o(.data);
        fragments_0xE4_fragment_0xE4_code = .;
        build/src/fragments/0xE4/fragment_0xE4_code.o(.data);
        fragments_0xE4_fragment_0xE4_data_data = .;
        build/asm/us/data/fragments/0xE4/fragment_0xE4_data.data.o(.data);
        fragment_0xE4_DATA_END = .;
        fragment_0xE4_DATA_SIZE = ABSOLUTE(fragment_0xE4_DATA_END - fragment_0xE4_DATA_START);
        fragment_0xE4_RODATA_START = .;
        build/asm/us/data/fragments/0xE4/fragment_0xE4_header.o(.rodata);
        build/src/fragments/0xE4/fragment_0xE4_code.o(.rodata);
        fragment_0xE4_RODATA_END = .;
        fragment_0xE4_RODATA_SIZE = ABSOLUTE(fragment_0xE4_RODATA_END - fragment_0xE4_RODATA_START);
    }
    fragment_0xE4_bss_VRAM = ADDR(.fragment_0xE4_bss);
    .fragment_0xE4_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE4_BSS_START = .;
        build/asm/us/data/fragments/0xE4/fragment_0xE4_header.o(.bss);
        build/src/fragments/0xE4/fragment_0xE4_code.o(.bss);
        fragment_0xE4_BSS_END = .;
        fragment_0xE4_BSS_SIZE = ABSOLUTE(fragment_0xE4_BSS_END - fragment_0xE4_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE4);
    fragment_0xE4_ROM_END = __romPos;
    fragment_0xE4_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE5_ROM_START = __romPos;
    fragment_0xE5_VRAM = ADDR(.fragment_0xE5);
    .fragment_0xE5 0x8F500000 : AT(fragment_0xE5_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE5_TEXT_START = .;
        build/asm/us/data/fragments/0xE5/fragment_0xE5_header.o(.text);
        build/src/fragments/0xE5/fragment_0xE5_code.o(.text);
        fragment_0xE5_TEXT_END = .;
        fragment_0xE5_TEXT_SIZE = ABSOLUTE(fragment_0xE5_TEXT_END - fragment_0xE5_TEXT_START);
        fragment_0xE5_DATA_START = .;
        fragments_0xE5_fragment_0xE5_header = .;
        build/asm/us/data/fragments/0xE5/fragment_0xE5_header.o(.data);
        fragments_0xE5_fragment_0xE5_code = .;
        build/src/fragments/0xE5/fragment_0xE5_code.o(.data);
        fragments_0xE5_fragment_0xE5_data_data = .;
        build/asm/us/data/fragments/0xE5/fragment_0xE5_data.data.o(.data);
        fragment_0xE5_DATA_END = .;
        fragment_0xE5_DATA_SIZE = ABSOLUTE(fragment_0xE5_DATA_END - fragment_0xE5_DATA_START);
        fragment_0xE5_RODATA_START = .;
        build/asm/us/data/fragments/0xE5/fragment_0xE5_header.o(.rodata);
        build/src/fragments/0xE5/fragment_0xE5_code.o(.rodata);
        fragment_0xE5_RODATA_END = .;
        fragment_0xE5_RODATA_SIZE = ABSOLUTE(fragment_0xE5_RODATA_END - fragment_0xE5_RODATA_START);
    }
    fragment_0xE5_bss_VRAM = ADDR(.fragment_0xE5_bss);
    .fragment_0xE5_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE5_BSS_START = .;
        build/asm/us/data/fragments/0xE5/fragment_0xE5_header.o(.bss);
        build/src/fragments/0xE5/fragment_0xE5_code.o(.bss);
        fragment_0xE5_BSS_END = .;
        fragment_0xE5_BSS_SIZE = ABSOLUTE(fragment_0xE5_BSS_END - fragment_0xE5_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE5);
    fragment_0xE5_ROM_END = __romPos;
    fragment_0xE5_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE6_ROM_START = __romPos;
    fragment_0xE6_VRAM = ADDR(.fragment_0xE6);
    .fragment_0xE6 0x8F600000 : AT(fragment_0xE6_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE6_TEXT_START = .;
        build/asm/us/data/fragments/0xE6/fragment_0xE6_header.o(.text);
        build/src/fragments/0xE6/fragment_0xE6_code.o(.text);
        fragment_0xE6_TEXT_END = .;
        fragment_0xE6_TEXT_SIZE = ABSOLUTE(fragment_0xE6_TEXT_END - fragment_0xE6_TEXT_START);
        fragment_0xE6_DATA_START = .;
        fragments_0xE6_fragment_0xE6_header = .;
        build/asm/us/data/fragments/0xE6/fragment_0xE6_header.o(.data);
        fragments_0xE6_fragment_0xE6_code = .;
        build/src/fragments/0xE6/fragment_0xE6_code.o(.data);
        fragments_0xE6_fragment_0xE6_data_data = .;
        build/asm/us/data/fragments/0xE6/fragment_0xE6_data.data.o(.data);
        fragment_0xE6_DATA_END = .;
        fragment_0xE6_DATA_SIZE = ABSOLUTE(fragment_0xE6_DATA_END - fragment_0xE6_DATA_START);
        fragment_0xE6_RODATA_START = .;
        build/asm/us/data/fragments/0xE6/fragment_0xE6_header.o(.rodata);
        build/src/fragments/0xE6/fragment_0xE6_code.o(.rodata);
        fragment_0xE6_RODATA_END = .;
        fragment_0xE6_RODATA_SIZE = ABSOLUTE(fragment_0xE6_RODATA_END - fragment_0xE6_RODATA_START);
    }
    fragment_0xE6_bss_VRAM = ADDR(.fragment_0xE6_bss);
    .fragment_0xE6_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE6_BSS_START = .;
        build/asm/us/data/fragments/0xE6/fragment_0xE6_header.o(.bss);
        build/src/fragments/0xE6/fragment_0xE6_code.o(.bss);
        fragment_0xE6_BSS_END = .;
        fragment_0xE6_BSS_SIZE = ABSOLUTE(fragment_0xE6_BSS_END - fragment_0xE6_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE6);
    fragment_0xE6_ROM_END = __romPos;
    fragment_0xE6_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xEA_ROM_START = __romPos;
    fragment_0xEA_VRAM = ADDR(.fragment_0xEA);
    .fragment_0xEA 0x8FA00000 : AT(fragment_0xEA_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xEA_TEXT_START = .;
        build/asm/us/data/fragments/0xEA/fragment_0xEA_header.o(.text);
        build/src/fragments/0xEA/fragment_0xEA_code.o(.text);
        fragment_0xEA_TEXT_END = .;
        fragment_0xEA_TEXT_SIZE = ABSOLUTE(fragment_0xEA_TEXT_END - fragment_0xEA_TEXT_START);
        fragment_0xEA_DATA_START = .;
        fragments_0xEA_fragment_0xEA_header = .;
        build/asm/us/data/fragments/0xEA/fragment_0xEA_header.o(.data);
        fragments_0xEA_fragment_0xEA_code = .;
        build/src/fragments/0xEA/fragment_0xEA_code.o(.data);
        fragments_0xEA_fragment_0xEA_data_data = .;
        build/asm/us/data/fragments/0xEA/fragment_0xEA_data.data.o(.data);
        fragment_0xEA_DATA_END = .;
        fragment_0xEA_DATA_SIZE = ABSOLUTE(fragment_0xEA_DATA_END - fragment_0xEA_DATA_START);
        fragment_0xEA_RODATA_START = .;
        build/asm/us/data/fragments/0xEA/fragment_0xEA_header.o(.rodata);
        build/src/fragments/0xEA/fragment_0xEA_code.o(.rodata);
        fragment_0xEA_RODATA_END = .;
        fragment_0xEA_RODATA_SIZE = ABSOLUTE(fragment_0xEA_RODATA_END - fragment_0xEA_RODATA_START);
    }
    fragment_0xEA_bss_VRAM = ADDR(.fragment_0xEA_bss);
    .fragment_0xEA_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xEA_BSS_START = .;
        build/asm/us/data/fragments/0xEA/fragment_0xEA_header.o(.bss);
        build/src/fragments/0xEA/fragment_0xEA_code.o(.bss);
        fragment_0xEA_BSS_END = .;
        fragment_0xEA_BSS_SIZE = ABSOLUTE(fragment_0xEA_BSS_END - fragment_0xEA_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xEA);
    fragment_0xEA_ROM_END = __romPos;
    fragment_0xEA_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE7_ROM_START = __romPos;
    fragment_0xE7_VRAM = ADDR(.fragment_0xE7);
    .fragment_0xE7 0x8F700000 : AT(fragment_0xE7_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE7_TEXT_START = .;
        build/asm/us/data/fragments/0xE7/fragment_0xE7_header.o(.text);
        build/src/fragments/0xE7/fragment_0xE7_code.o(.text);
        fragment_0xE7_TEXT_END = .;
        fragment_0xE7_TEXT_SIZE = ABSOLUTE(fragment_0xE7_TEXT_END - fragment_0xE7_TEXT_START);
        fragment_0xE7_DATA_START = .;
        fragments_0xE7_fragment_0xE7_header = .;
        build/asm/us/data/fragments/0xE7/fragment_0xE7_header.o(.data);
        fragments_0xE7_fragment_0xE7_code = .;
        build/src/fragments/0xE7/fragment_0xE7_code.o(.data);
        fragments_0xE7_fragment_0xE7_data_data = .;
        build/asm/us/data/fragments/0xE7/fragment_0xE7_data.data.o(.data);
        fragment_0xE7_DATA_END = .;
        fragment_0xE7_DATA_SIZE = ABSOLUTE(fragment_0xE7_DATA_END - fragment_0xE7_DATA_START);
        fragment_0xE7_RODATA_START = .;
        build/asm/us/data/fragments/0xE7/fragment_0xE7_header.o(.rodata);
        build/src/fragments/0xE7/fragment_0xE7_code.o(.rodata);
        fragment_0xE7_RODATA_END = .;
        fragment_0xE7_RODATA_SIZE = ABSOLUTE(fragment_0xE7_RODATA_END - fragment_0xE7_RODATA_START);
    }
    fragment_0xE7_bss_VRAM = ADDR(.fragment_0xE7_bss);
    .fragment_0xE7_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE7_BSS_START = .;
        build/asm/us/data/fragments/0xE7/fragment_0xE7_header.o(.bss);
        build/src/fragments/0xE7/fragment_0xE7_code.o(.bss);
        fragment_0xE7_BSS_END = .;
        fragment_0xE7_BSS_SIZE = ABSOLUTE(fragment_0xE7_BSS_END - fragment_0xE7_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE7);
    fragment_0xE7_ROM_END = __romPos;
    fragment_0xE7_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE8_ROM_START = __romPos;
    fragment_0xE8_VRAM = ADDR(.fragment_0xE8);
    .fragment_0xE8 0x8F800000 : AT(fragment_0xE8_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE8_TEXT_START = .;
        build/asm/us/data/fragments/0xE8/fragment_0xE8_header.o(.text);
        build/src/fragments/0xE8/fragment_0xE8_code.o(.text);
        fragment_0xE8_TEXT_END = .;
        fragment_0xE8_TEXT_SIZE = ABSOLUTE(fragment_0xE8_TEXT_END - fragment_0xE8_TEXT_START);
        fragment_0xE8_DATA_START = .;
        fragments_0xE8_fragment_0xE8_header = .;
        build/asm/us/data/fragments/0xE8/fragment_0xE8_header.o(.data);
        fragments_0xE8_fragment_0xE8_code = .;
        build/src/fragments/0xE8/fragment_0xE8_code.o(.data);
        fragments_0xE8_fragment_0xE8_data_data = .;
        build/asm/us/data/fragments/0xE8/fragment_0xE8_data.data.o(.data);
        fragment_0xE8_DATA_END = .;
        fragment_0xE8_DATA_SIZE = ABSOLUTE(fragment_0xE8_DATA_END - fragment_0xE8_DATA_START);
        fragment_0xE8_RODATA_START = .;
        build/asm/us/data/fragments/0xE8/fragment_0xE8_header.o(.rodata);
        build/src/fragments/0xE8/fragment_0xE8_code.o(.rodata);
        fragment_0xE8_RODATA_END = .;
        fragment_0xE8_RODATA_SIZE = ABSOLUTE(fragment_0xE8_RODATA_END - fragment_0xE8_RODATA_START);
    }
    fragment_0xE8_bss_VRAM = ADDR(.fragment_0xE8_bss);
    .fragment_0xE8_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE8_BSS_START = .;
        build/asm/us/data/fragments/0xE8/fragment_0xE8_header.o(.bss);
        build/src/fragments/0xE8/fragment_0xE8_code.o(.bss);
        fragment_0xE8_BSS_END = .;
        fragment_0xE8_BSS_SIZE = ABSOLUTE(fragment_0xE8_BSS_END - fragment_0xE8_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE8);
    fragment_0xE8_ROM_END = __romPos;
    fragment_0xE8_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xE9_ROM_START = __romPos;
    fragment_0xE9_VRAM = ADDR(.fragment_0xE9);
    .fragment_0xE9 0x8F900000 : AT(fragment_0xE9_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE9_TEXT_START = .;
        build/asm/us/data/fragments/0xE9/fragment_0xE9_header.o(.text);
        build/src/fragments/0xE9/fragment_0xE9_code.o(.text);
        fragment_0xE9_TEXT_END = .;
        fragment_0xE9_TEXT_SIZE = ABSOLUTE(fragment_0xE9_TEXT_END - fragment_0xE9_TEXT_START);
        fragment_0xE9_DATA_START = .;
        fragments_0xE9_fragment_0xE9_header = .;
        build/asm/us/data/fragments/0xE9/fragment_0xE9_header.o(.data);
        fragments_0xE9_fragment_0xE9_code = .;
        build/src/fragments/0xE9/fragment_0xE9_code.o(.data);
        fragments_0xE9_fragment_0xE9_data_data = .;
        build/asm/us/data/fragments/0xE9/fragment_0xE9_data.data.o(.data);
        fragment_0xE9_DATA_END = .;
        fragment_0xE9_DATA_SIZE = ABSOLUTE(fragment_0xE9_DATA_END - fragment_0xE9_DATA_START);
        fragment_0xE9_RODATA_START = .;
        build/asm/us/data/fragments/0xE9/fragment_0xE9_header.o(.rodata);
        build/src/fragments/0xE9/fragment_0xE9_code.o(.rodata);
        fragment_0xE9_RODATA_END = .;
        fragment_0xE9_RODATA_SIZE = ABSOLUTE(fragment_0xE9_RODATA_END - fragment_0xE9_RODATA_START);
    }
    fragment_0xE9_bss_VRAM = ADDR(.fragment_0xE9_bss);
    .fragment_0xE9_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xE9_BSS_START = .;
        build/asm/us/data/fragments/0xE9/fragment_0xE9_header.o(.bss);
        build/src/fragments/0xE9/fragment_0xE9_code.o(.bss);
        fragment_0xE9_BSS_END = .;
        fragment_0xE9_BSS_SIZE = ABSOLUTE(fragment_0xE9_BSS_END - fragment_0xE9_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xE9);
    fragment_0xE9_ROM_END = __romPos;
    fragment_0xE9_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x31_ROM_START = __romPos;
    fragment_0x31_VRAM = ADDR(.fragment_0x31);
    .fragment_0x31 0x84100000 : AT(fragment_0x31_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x31_TEXT_START = .;
        build/asm/us/data/fragments/0x31/fragment_0x31_header.o(.text);
        build/src/fragments/0x31/fragment_0x31_36F8B0.o(.text);
        build/src/fragments/0x31/fragment_0x31_372DE0.o(.text);
        build/src/fragments/0x31/fragment_0x31_373F70.o(.text);
        build/src/fragments/0x31/fragment_0x31_374840.o(.text);
        build/src/fragments/0x31/fragment_0x31_3749B0.o(.text);
        build/src/fragments/0x31/fragment_0x31_375110.o(.text);
        build/src/fragments/0x31/fragment_0x31_375530.o(.text);
        build/src/fragments/0x31/fragment_0x31_377570.o(.text);
        build/src/fragments/0x31/fragment_0x31_377F80.o(.text);
        build/src/fragments/0x31/fragment_0x31_379450.o(.text);
        build/src/fragments/0x31/fragment_0x31_379E90.o(.text);
        build/src/fragments/0x31/fragment_0x31_37A6E0.o(.text);
        build/src/fragments/0x31/fragment_0x31_38D510.o(.text);
        build/src/fragments/0x31/fragment_0x31_38EBD0.o(.text);
        build/src/fragments/0x31/fragment_0x31_38EFA0.o(.text);
        build/src/fragments/0x31/fragment_0x31_38EFE0.o(.text);
        build/src/fragments/0x31/fragment_0x31_393B40.o(.text);
        build/src/fragments/0x31/fragment_0x31_393BF0.o(.text);
        build/src/fragments/0x31/fragment_0x31_393CA0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3ADCA0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3B7DB0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3B7EA0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3B9B80.o(.text);
        build/src/fragments/0x31/fragment_0x31_3BC290.o(.text);
        build/src/fragments/0x31/fragment_0x31_3BE6B0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3BEAF0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3BF4C0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3C40B0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3C50B0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3C60B0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3CB430.o(.text);
        build/src/fragments/0x31/fragment_0x31_3CE960.o(.text);
        build/src/fragments/0x31/fragment_0x31_3CFAE0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3D0D70.o(.text);
        build/src/fragments/0x31/fragment_0x31_3D2C10.o(.text);
        build/src/fragments/0x31/fragment_0x31_3D3260.o(.text);
        build/src/fragments/0x31/fragment_0x31_3D4060.o(.text);
        build/src/fragments/0x31/fragment_0x31_3D4DA0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3D7DD0.o(.text);
        build/src/fragments/0x31/fragment_0x31_3D99F0.o(.text);
        fragment_0x31_TEXT_END = .;
        fragment_0x31_TEXT_SIZE = ABSOLUTE(fragment_0x31_TEXT_END - fragment_0x31_TEXT_START);
        fragment_0x31_DATA_START = .;
        fragments_0x31_fragment_0x31_header = .;
        build/asm/us/data/fragments/0x31/fragment_0x31_header.o(.data);
        fragments_0x31_fragment_0x31_36F8B0 = .;
        build/src/fragments/0x31/fragment_0x31_36F8B0.o(.data);
        fragments_0x31_fragment_0x31_372DE0 = .;
        build/src/fragments/0x31/fragment_0x31_372DE0.o(.data);
        fragments_0x31_fragment_0x31_373F70 = .;
        build/src/fragments/0x31/fragment_0x31_373F70.o(.data);
        fragments_0x31_fragment_0x31_374840 = .;
        build/src/fragments/0x31/fragment_0x31_374840.o(.data);
        fragments_0x31_fragment_0x31_3749B0 = .;
        build/src/fragments/0x31/fragment_0x31_3749B0.o(.data);
        fragments_0x31_fragment_0x31_375110 = .;
        build/src/fragments/0x31/fragment_0x31_375110.o(.data);
        fragments_0x31_fragment_0x31_375530 = .;
        build/src/fragments/0x31/fragment_0x31_375530.o(.data);
        fragments_0x31_fragment_0x31_377570 = .;
        build/src/fragments/0x31/fragment_0x31_377570.o(.data);
        fragments_0x31_fragment_0x31_377F80 = .;
        build/src/fragments/0x31/fragment_0x31_377F80.o(.data);
        fragments_0x31_fragment_0x31_379450 = .;
        build/src/fragments/0x31/fragment_0x31_379450.o(.data);
        fragments_0x31_fragment_0x31_379E90 = .;
        build/src/fragments/0x31/fragment_0x31_379E90.o(.data);
        fragments_0x31_fragment_0x31_37A6E0 = .;
        build/src/fragments/0x31/fragment_0x31_37A6E0.o(.data);
        fragments_0x31_fragment_0x31_38D510 = .;
        build/src/fragments/0x31/fragment_0x31_38D510.o(.data);
        fragments_0x31_fragment_0x31_38EBD0 = .;
        build/src/fragments/0x31/fragment_0x31_38EBD0.o(.data);
        fragments_0x31_fragment_0x31_38EFA0 = .;
        build/src/fragments/0x31/fragment_0x31_38EFA0.o(.data);
        fragments_0x31_fragment_0x31_38EFE0 = .;
        build/src/fragments/0x31/fragment_0x31_38EFE0.o(.data);
        fragments_0x31_fragment_0x31_393B40 = .;
        build/src/fragments/0x31/fragment_0x31_393B40.o(.data);
        fragments_0x31_fragment_0x31_393BF0 = .;
        build/src/fragments/0x31/fragment_0x31_393BF0.o(.data);
        fragments_0x31_fragment_0x31_393CA0 = .;
        build/src/fragments/0x31/fragment_0x31_393CA0.o(.data);
        fragments_0x31_fragment_0x31_3ADCA0 = .;
        build/src/fragments/0x31/fragment_0x31_3ADCA0.o(.data);
        fragments_0x31_fragment_0x31_3B7DB0 = .;
        build/src/fragments/0x31/fragment_0x31_3B7DB0.o(.data);
        fragments_0x31_fragment_0x31_3B7EA0 = .;
        build/src/fragments/0x31/fragment_0x31_3B7EA0.o(.data);
        fragments_0x31_fragment_0x31_3B9B80 = .;
        build/src/fragments/0x31/fragment_0x31_3B9B80.o(.data);
        fragments_0x31_fragment_0x31_3BC290 = .;
        build/src/fragments/0x31/fragment_0x31_3BC290.o(.data);
        fragments_0x31_fragment_0x31_3BE6B0 = .;
        build/src/fragments/0x31/fragment_0x31_3BE6B0.o(.data);
        fragments_0x31_fragment_0x31_3BEAF0 = .;
        build/src/fragments/0x31/fragment_0x31_3BEAF0.o(.data);
        fragments_0x31_fragment_0x31_3BF4C0 = .;
        build/src/fragments/0x31/fragment_0x31_3BF4C0.o(.data);
        fragments_0x31_fragment_0x31_3C40B0 = .;
        build/src/fragments/0x31/fragment_0x31_3C40B0.o(.data);
        fragments_0x31_fragment_0x31_3C50B0 = .;
        build/src/fragments/0x31/fragment_0x31_3C50B0.o(.data);
        fragments_0x31_fragment_0x31_3C60B0 = .;
        build/src/fragments/0x31/fragment_0x31_3C60B0.o(.data);
        fragments_0x31_fragment_0x31_3CB430 = .;
        build/src/fragments/0x31/fragment_0x31_3CB430.o(.data);
        fragments_0x31_fragment_0x31_3CE960 = .;
        build/src/fragments/0x31/fragment_0x31_3CE960.o(.data);
        fragments_0x31_fragment_0x31_3CFAE0 = .;
        build/src/fragments/0x31/fragment_0x31_3CFAE0.o(.data);
        fragments_0x31_fragment_0x31_3D0D70 = .;
        build/src/fragments/0x31/fragment_0x31_3D0D70.o(.data);
        fragments_0x31_fragment_0x31_3D2C10 = .;
        build/src/fragments/0x31/fragment_0x31_3D2C10.o(.data);
        fragments_0x31_fragment_0x31_3D3260 = .;
        build/src/fragments/0x31/fragment_0x31_3D3260.o(.data);
        fragments_0x31_fragment_0x31_3D4060 = .;
        build/src/fragments/0x31/fragment_0x31_3D4060.o(.data);
        fragments_0x31_fragment_0x31_3D4DA0 = .;
        build/src/fragments/0x31/fragment_0x31_3D4DA0.o(.data);
        fragments_0x31_fragment_0x31_3D7DD0 = .;
        build/src/fragments/0x31/fragment_0x31_3D7DD0.o(.data);
        fragments_0x31_fragment_0x31_3D99F0 = .;
        build/src/fragments/0x31/fragment_0x31_3D99F0.o(.data);
        fragments_0x31_fragment_0x31_data_data = .;
        build/asm/us/data/fragments/0x31/fragment_0x31_data.data.o(.data);
        fragment_0x31_DATA_END = .;
        fragment_0x31_DATA_SIZE = ABSOLUTE(fragment_0x31_DATA_END - fragment_0x31_DATA_START);
        fragment_0x31_RODATA_START = .;
        build/asm/us/data/fragments/0x31/fragment_0x31_header.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_36F8B0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_372DE0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_373F70.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_374840.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3749B0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_375110.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_375530.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_377570.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_377F80.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_379450.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_379E90.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_37A6E0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_38D510.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_38EBD0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_38EFA0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_38EFE0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_393B40.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_393BF0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_393CA0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3ADCA0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3B7DB0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3B7EA0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3B9B80.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3BC290.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3BE6B0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3BEAF0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3BF4C0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3C40B0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3C50B0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3C60B0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3CB430.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3CE960.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3CFAE0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3D0D70.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3D2C10.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3D3260.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3D4060.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3D4DA0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3D7DD0.o(.rodata);
        build/src/fragments/0x31/fragment_0x31_3D99F0.o(.rodata);
        fragment_0x31_RODATA_END = .;
        fragment_0x31_RODATA_SIZE = ABSOLUTE(fragment_0x31_RODATA_END - fragment_0x31_RODATA_START);
    }
    fragment_0x31_bss_VRAM = ADDR(.fragment_0x31_bss);
    .fragment_0x31_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x31_BSS_START = .;
        build/asm/us/data/fragments/0x31/fragment_0x31_header.o(.bss);
        build/src/fragments/0x31/fragment_0x31_36F8B0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_372DE0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_373F70.o(.bss);
        build/src/fragments/0x31/fragment_0x31_374840.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3749B0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_375110.o(.bss);
        build/src/fragments/0x31/fragment_0x31_375530.o(.bss);
        build/src/fragments/0x31/fragment_0x31_377570.o(.bss);
        build/src/fragments/0x31/fragment_0x31_377F80.o(.bss);
        build/src/fragments/0x31/fragment_0x31_379450.o(.bss);
        build/src/fragments/0x31/fragment_0x31_379E90.o(.bss);
        build/src/fragments/0x31/fragment_0x31_37A6E0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_38D510.o(.bss);
        build/src/fragments/0x31/fragment_0x31_38EBD0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_38EFA0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_38EFE0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_393B40.o(.bss);
        build/src/fragments/0x31/fragment_0x31_393BF0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_393CA0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3ADCA0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3B7DB0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3B7EA0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3B9B80.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3BC290.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3BE6B0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3BEAF0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3BF4C0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3C40B0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3C50B0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3C60B0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3CB430.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3CE960.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3CFAE0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3D0D70.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3D2C10.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3D3260.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3D4060.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3D4DA0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3D7DD0.o(.bss);
        build/src/fragments/0x31/fragment_0x31_3D99F0.o(.bss);
        fragment_0x31_BSS_END = .;
        fragment_0x31_BSS_SIZE = ABSOLUTE(fragment_0x31_BSS_END - fragment_0x31_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x31);
    fragment_0x31_ROM_END = __romPos;
    fragment_0x31_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x32_ROM_START = __romPos;
    fragment_0x32_VRAM = ADDR(.fragment_0x32);
    .fragment_0x32 0x84200000 : AT(fragment_0x32_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x32_TEXT_START = .;
        build/asm/us/data/fragments/0x32/fragment_0x32_header.o(.text);
        build/src/fragments/0x32/fragment_0x32_4194A0.o(.text);
        build/src/fragments/0x32/fragment_0x32_41A5F0.o(.text);
        build/src/fragments/0x32/fragment_0x32_41AC50.o(.text);
        build/src/fragments/0x32/fragment_0x32_41C930.o(.text);
        fragment_0x32_TEXT_END = .;
        fragment_0x32_TEXT_SIZE = ABSOLUTE(fragment_0x32_TEXT_END - fragment_0x32_TEXT_START);
        fragment_0x32_DATA_START = .;
        fragments_0x32_fragment_0x32_header = .;
        build/asm/us/data/fragments/0x32/fragment_0x32_header.o(.data);
        fragments_0x32_fragment_0x32_4194A0 = .;
        build/src/fragments/0x32/fragment_0x32_4194A0.o(.data);
        fragments_0x32_fragment_0x32_41A5F0 = .;
        build/src/fragments/0x32/fragment_0x32_41A5F0.o(.data);
        fragments_0x32_fragment_0x32_41AC50 = .;
        build/src/fragments/0x32/fragment_0x32_41AC50.o(.data);
        fragments_0x32_fragment_0x32_41C930 = .;
        build/src/fragments/0x32/fragment_0x32_41C930.o(.data);
        fragments_0x32_fragment_0x32_data_data = .;
        build/asm/us/data/fragments/0x32/fragment_0x32_data.data.o(.data);
        fragment_0x32_DATA_END = .;
        fragment_0x32_DATA_SIZE = ABSOLUTE(fragment_0x32_DATA_END - fragment_0x32_DATA_START);
        fragment_0x32_RODATA_START = .;
        build/asm/us/data/fragments/0x32/fragment_0x32_header.o(.rodata);
        build/src/fragments/0x32/fragment_0x32_4194A0.o(.rodata);
        build/src/fragments/0x32/fragment_0x32_41A5F0.o(.rodata);
        build/src/fragments/0x32/fragment_0x32_41AC50.o(.rodata);
        build/src/fragments/0x32/fragment_0x32_41C930.o(.rodata);
        fragment_0x32_RODATA_END = .;
        fragment_0x32_RODATA_SIZE = ABSOLUTE(fragment_0x32_RODATA_END - fragment_0x32_RODATA_START);
    }
    fragment_0x32_bss_VRAM = ADDR(.fragment_0x32_bss);
    .fragment_0x32_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x32_BSS_START = .;
        build/asm/us/data/fragments/0x32/fragment_0x32_header.o(.bss);
        build/src/fragments/0x32/fragment_0x32_4194A0.o(.bss);
        build/src/fragments/0x32/fragment_0x32_41A5F0.o(.bss);
        build/src/fragments/0x32/fragment_0x32_41AC50.o(.bss);
        build/src/fragments/0x32/fragment_0x32_41C930.o(.bss);
        fragment_0x32_BSS_END = .;
        fragment_0x32_BSS_SIZE = ABSOLUTE(fragment_0x32_BSS_END - fragment_0x32_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x32);
    fragment_0x32_ROM_END = __romPos;
    fragment_0x32_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x33_ROM_START = __romPos;
    fragment_0x33_VRAM = ADDR(.fragment_0x33);
    .fragment_0x33 0x84300000 : AT(fragment_0x33_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x33_TEXT_START = .;
        build/asm/us/data/fragments/0x33/fragment_0x33_header.o(.text);
        build/src/fragments/0x33/fragment_0x33_code.o(.text);
        fragment_0x33_TEXT_END = .;
        fragment_0x33_TEXT_SIZE = ABSOLUTE(fragment_0x33_TEXT_END - fragment_0x33_TEXT_START);
        fragment_0x33_DATA_START = .;
        fragments_0x33_fragment_0x33_header = .;
        build/asm/us/data/fragments/0x33/fragment_0x33_header.o(.data);
        fragments_0x33_fragment_0x33_code = .;
        build/src/fragments/0x33/fragment_0x33_code.o(.data);
        fragments_0x33_fragment_0x33_data_data = .;
        build/asm/us/data/fragments/0x33/fragment_0x33_data.data.o(.data);
        fragment_0x33_DATA_END = .;
        fragment_0x33_DATA_SIZE = ABSOLUTE(fragment_0x33_DATA_END - fragment_0x33_DATA_START);
        fragment_0x33_RODATA_START = .;
        build/asm/us/data/fragments/0x33/fragment_0x33_header.o(.rodata);
        build/src/fragments/0x33/fragment_0x33_code.o(.rodata);
        fragment_0x33_RODATA_END = .;
        fragment_0x33_RODATA_SIZE = ABSOLUTE(fragment_0x33_RODATA_END - fragment_0x33_RODATA_START);
    }
    fragment_0x33_bss_VRAM = ADDR(.fragment_0x33_bss);
    .fragment_0x33_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x33_BSS_START = .;
        build/asm/us/data/fragments/0x33/fragment_0x33_header.o(.bss);
        build/src/fragments/0x33/fragment_0x33_code.o(.bss);
        fragment_0x33_BSS_END = .;
        fragment_0x33_BSS_SIZE = ABSOLUTE(fragment_0x33_BSS_END - fragment_0x33_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x33);
    fragment_0x33_ROM_END = __romPos;
    fragment_0x33_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x1D_ROM_START = __romPos;
    fragment_0x1D_VRAM = ADDR(.fragment_0x1D);
    .fragment_0x1D 0x82D00000 : AT(fragment_0x1D_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1D_TEXT_START = .;
        build/asm/us/data/fragments/0x1D/fragment_0x1D_header.o(.text);
        build/src/fragments/0x1D/fragment_0x1D_420EA0.o(.text);
        build/src/fragments/0x1D/fragment_0x1D_4238F0.o(.text);
        fragment_0x1D_TEXT_END = .;
        fragment_0x1D_TEXT_SIZE = ABSOLUTE(fragment_0x1D_TEXT_END - fragment_0x1D_TEXT_START);
        fragment_0x1D_DATA_START = .;
        fragments_0x1D_fragment_0x1D_header = .;
        build/asm/us/data/fragments/0x1D/fragment_0x1D_header.o(.data);
        fragments_0x1D_fragment_0x1D_420EA0 = .;
        build/src/fragments/0x1D/fragment_0x1D_420EA0.o(.data);
        fragments_0x1D_fragment_0x1D_4238F0 = .;
        build/src/fragments/0x1D/fragment_0x1D_4238F0.o(.data);
        fragments_0x1D_fragment_0x1D_data_data = .;
        build/asm/us/data/fragments/0x1D/fragment_0x1D_data.data.o(.data);
        fragment_0x1D_DATA_END = .;
        fragment_0x1D_DATA_SIZE = ABSOLUTE(fragment_0x1D_DATA_END - fragment_0x1D_DATA_START);
        fragment_0x1D_RODATA_START = .;
        build/asm/us/data/fragments/0x1D/fragment_0x1D_header.o(.rodata);
        build/src/fragments/0x1D/fragment_0x1D_420EA0.o(.rodata);
        build/src/fragments/0x1D/fragment_0x1D_4238F0.o(.rodata);
        fragment_0x1D_RODATA_END = .;
        fragment_0x1D_RODATA_SIZE = ABSOLUTE(fragment_0x1D_RODATA_END - fragment_0x1D_RODATA_START);
    }
    fragment_0x1D_bss_VRAM = ADDR(.fragment_0x1D_bss);
    .fragment_0x1D_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1D_BSS_START = .;
        build/asm/us/data/fragments/0x1D/fragment_0x1D_header.o(.bss);
        build/src/fragments/0x1D/fragment_0x1D_420EA0.o(.bss);
        build/src/fragments/0x1D/fragment_0x1D_4238F0.o(.bss);
        fragment_0x1D_BSS_END = .;
        fragment_0x1D_BSS_SIZE = ABSOLUTE(fragment_0x1D_BSS_END - fragment_0x1D_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x1D);
    fragment_0x1D_ROM_END = __romPos;
    fragment_0x1D_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x1C_ROM_START = __romPos;
    fragment_0x1C_VRAM = ADDR(.fragment_0x1C);
    .fragment_0x1C 0x82C00000 : AT(fragment_0x1C_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1C_TEXT_START = .;
        build/asm/us/data/fragments/0x1C/fragment_0x1C_header.o(.text);
        build/src/fragments/0x1C/fragment_0x1C_code.o(.text);
        fragment_0x1C_TEXT_END = .;
        fragment_0x1C_TEXT_SIZE = ABSOLUTE(fragment_0x1C_TEXT_END - fragment_0x1C_TEXT_START);
        fragment_0x1C_DATA_START = .;
        fragments_0x1C_fragment_0x1C_header = .;
        build/asm/us/data/fragments/0x1C/fragment_0x1C_header.o(.data);
        fragments_0x1C_fragment_0x1C_code = .;
        build/src/fragments/0x1C/fragment_0x1C_code.o(.data);
        fragments_0x1C_fragment_0x1C_data_data = .;
        build/asm/us/data/fragments/0x1C/fragment_0x1C_data.data.o(.data);
        fragment_0x1C_DATA_END = .;
        fragment_0x1C_DATA_SIZE = ABSOLUTE(fragment_0x1C_DATA_END - fragment_0x1C_DATA_START);
        fragment_0x1C_RODATA_START = .;
        build/asm/us/data/fragments/0x1C/fragment_0x1C_header.o(.rodata);
        build/src/fragments/0x1C/fragment_0x1C_code.o(.rodata);
        fragment_0x1C_RODATA_END = .;
        fragment_0x1C_RODATA_SIZE = ABSOLUTE(fragment_0x1C_RODATA_END - fragment_0x1C_RODATA_START);
    }
    fragment_0x1C_bss_VRAM = ADDR(.fragment_0x1C_bss);
    .fragment_0x1C_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x1C_BSS_START = .;
        build/asm/us/data/fragments/0x1C/fragment_0x1C_header.o(.bss);
        build/src/fragments/0x1C/fragment_0x1C_code.o(.bss);
        fragment_0x1C_BSS_END = .;
        fragment_0x1C_BSS_SIZE = ABSOLUTE(fragment_0x1C_BSS_END - fragment_0x1C_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x1C);
    fragment_0x1C_ROM_END = __romPos;
    fragment_0x1C_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xEC_ROM_START = __romPos;
    fragment_0xEC_VRAM = ADDR(.fragment_0xEC);
    .fragment_0xEC 0x8FC00000 : AT(fragment_0xEC_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xEC_TEXT_START = .;
        build/asm/us/data/fragments/0xEC/fragment_0xEC_header.o(.text);
        build/src/fragments/0xEC/fragment_0xEC_code.o(.text);
        fragment_0xEC_TEXT_END = .;
        fragment_0xEC_TEXT_SIZE = ABSOLUTE(fragment_0xEC_TEXT_END - fragment_0xEC_TEXT_START);
        fragment_0xEC_DATA_START = .;
        fragments_0xEC_fragment_0xEC_header = .;
        build/asm/us/data/fragments/0xEC/fragment_0xEC_header.o(.data);
        fragments_0xEC_fragment_0xEC_code = .;
        build/src/fragments/0xEC/fragment_0xEC_code.o(.data);
        fragments_0xEC_fragment_0xEC_data_data = .;
        build/asm/us/data/fragments/0xEC/fragment_0xEC_data.data.o(.data);
        fragment_0xEC_DATA_END = .;
        fragment_0xEC_DATA_SIZE = ABSOLUTE(fragment_0xEC_DATA_END - fragment_0xEC_DATA_START);
        fragment_0xEC_RODATA_START = .;
        build/asm/us/data/fragments/0xEC/fragment_0xEC_header.o(.rodata);
        build/src/fragments/0xEC/fragment_0xEC_code.o(.rodata);
        fragment_0xEC_RODATA_END = .;
        fragment_0xEC_RODATA_SIZE = ABSOLUTE(fragment_0xEC_RODATA_END - fragment_0xEC_RODATA_START);
    }
    fragment_0xEC_bss_VRAM = ADDR(.fragment_0xEC_bss);
    .fragment_0xEC_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xEC_BSS_START = .;
        build/asm/us/data/fragments/0xEC/fragment_0xEC_header.o(.bss);
        build/src/fragments/0xEC/fragment_0xEC_code.o(.bss);
        fragment_0xEC_BSS_END = .;
        fragment_0xEC_BSS_SIZE = ABSOLUTE(fragment_0xEC_BSS_END - fragment_0xEC_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xEC);
    fragment_0xEC_ROM_END = __romPos;
    fragment_0xEC_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xED_ROM_START = __romPos;
    fragment_0xED_VRAM = ADDR(.fragment_0xED);
    .fragment_0xED 0x8FD00000 : AT(fragment_0xED_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xED_TEXT_START = .;
        build/asm/us/data/fragments/0xED/fragment_0xED_header.o(.text);
        build/src/fragments/0xED/fragment_0xED_code.o(.text);
        fragment_0xED_TEXT_END = .;
        fragment_0xED_TEXT_SIZE = ABSOLUTE(fragment_0xED_TEXT_END - fragment_0xED_TEXT_START);
        fragment_0xED_DATA_START = .;
        fragments_0xED_fragment_0xED_header = .;
        build/asm/us/data/fragments/0xED/fragment_0xED_header.o(.data);
        fragments_0xED_fragment_0xED_code = .;
        build/src/fragments/0xED/fragment_0xED_code.o(.data);
        fragments_0xED_fragment_0xED_data_data = .;
        build/asm/us/data/fragments/0xED/fragment_0xED_data.data.o(.data);
        fragment_0xED_DATA_END = .;
        fragment_0xED_DATA_SIZE = ABSOLUTE(fragment_0xED_DATA_END - fragment_0xED_DATA_START);
        fragment_0xED_RODATA_START = .;
        build/asm/us/data/fragments/0xED/fragment_0xED_header.o(.rodata);
        build/src/fragments/0xED/fragment_0xED_code.o(.rodata);
        fragment_0xED_RODATA_END = .;
        fragment_0xED_RODATA_SIZE = ABSOLUTE(fragment_0xED_RODATA_END - fragment_0xED_RODATA_START);
    }
    fragment_0xED_bss_VRAM = ADDR(.fragment_0xED_bss);
    .fragment_0xED_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xED_BSS_START = .;
        build/asm/us/data/fragments/0xED/fragment_0xED_header.o(.bss);
        build/src/fragments/0xED/fragment_0xED_code.o(.bss);
        fragment_0xED_BSS_END = .;
        fragment_0xED_BSS_SIZE = ABSOLUTE(fragment_0xED_BSS_END - fragment_0xED_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xED);
    fragment_0xED_ROM_END = __romPos;
    fragment_0xED_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0x34_ROM_START = __romPos;
    fragment_0x34_VRAM = ADDR(.fragment_0x34);
    .fragment_0x34 0x84400000 : AT(fragment_0x34_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x34_TEXT_START = .;
        build/asm/us/data/fragments/0x34/fragment_0x34_header.o(.text);
        build/src/fragments/0x34/fragment_0x34_code.o(.text);
        fragment_0x34_TEXT_END = .;
        fragment_0x34_TEXT_SIZE = ABSOLUTE(fragment_0x34_TEXT_END - fragment_0x34_TEXT_START);
        fragment_0x34_DATA_START = .;
        fragments_0x34_fragment_0x34_header = .;
        build/asm/us/data/fragments/0x34/fragment_0x34_header.o(.data);
        fragments_0x34_fragment_0x34_code = .;
        build/src/fragments/0x34/fragment_0x34_code.o(.data);
        fragments_0x34_fragment_0x34_data_data = .;
        build/asm/us/data/fragments/0x34/fragment_0x34_data.data.o(.data);
        fragment_0x34_DATA_END = .;
        fragment_0x34_DATA_SIZE = ABSOLUTE(fragment_0x34_DATA_END - fragment_0x34_DATA_START);
        fragment_0x34_RODATA_START = .;
        build/asm/us/data/fragments/0x34/fragment_0x34_header.o(.rodata);
        build/src/fragments/0x34/fragment_0x34_code.o(.rodata);
        fragment_0x34_RODATA_END = .;
        fragment_0x34_RODATA_SIZE = ABSOLUTE(fragment_0x34_RODATA_END - fragment_0x34_RODATA_START);
    }
    fragment_0x34_bss_VRAM = ADDR(.fragment_0x34_bss);
    .fragment_0x34_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0x34_BSS_START = .;
        build/asm/us/data/fragments/0x34/fragment_0x34_header.o(.bss);
        build/src/fragments/0x34/fragment_0x34_code.o(.bss);
        fragment_0x34_BSS_END = .;
        fragment_0x34_BSS_SIZE = ABSOLUTE(fragment_0x34_BSS_END - fragment_0x34_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0x34);
    fragment_0x34_ROM_END = __romPos;
    fragment_0x34_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xB_ROM_START = __romPos;
    fragment_0xB_VRAM = ADDR(.fragment_0xB);
    .fragment_0xB 0x81B00000 : AT(fragment_0xB_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xB_TEXT_START = .;
        build/asm/us/data/fragments/0xB/fragment_0xB_header.o(.text);
        build/src/fragments/0xB/fragment_0xB_code.o(.text);
        fragment_0xB_TEXT_END = .;
        fragment_0xB_TEXT_SIZE = ABSOLUTE(fragment_0xB_TEXT_END - fragment_0xB_TEXT_START);
        fragment_0xB_DATA_START = .;
        fragments_0xB_fragment_0xB_header = .;
        build/asm/us/data/fragments/0xB/fragment_0xB_header.o(.data);
        fragments_0xB_fragment_0xB_code = .;
        build/src/fragments/0xB/fragment_0xB_code.o(.data);
        fragments_0xB_fragment_0xB_data_data = .;
        build/asm/us/data/fragments/0xB/fragment_0xB_data.data.o(.data);
        fragment_0xB_DATA_END = .;
        fragment_0xB_DATA_SIZE = ABSOLUTE(fragment_0xB_DATA_END - fragment_0xB_DATA_START);
        fragment_0xB_RODATA_START = .;
        build/asm/us/data/fragments/0xB/fragment_0xB_header.o(.rodata);
        build/src/fragments/0xB/fragment_0xB_code.o(.rodata);
        fragment_0xB_RODATA_END = .;
        fragment_0xB_RODATA_SIZE = ABSOLUTE(fragment_0xB_RODATA_END - fragment_0xB_RODATA_START);
    }
    fragment_0xB_bss_VRAM = ADDR(.fragment_0xB_bss);
    .fragment_0xB_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xB_BSS_START = .;
        build/asm/us/data/fragments/0xB/fragment_0xB_header.o(.bss);
        build/src/fragments/0xB/fragment_0xB_code.o(.bss);
        fragment_0xB_BSS_END = .;
        fragment_0xB_BSS_SIZE = ABSOLUTE(fragment_0xB_BSS_END - fragment_0xB_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xB);
    fragment_0xB_ROM_END = __romPos;
    fragment_0xB_VRAM_END = .;
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);

    fragment_0xC_ROM_START = __romPos;
    fragment_0xC_VRAM = ADDR(.fragment_0xC);
    .fragment_0xC 0x81C00000 : AT(fragment_0xC_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xC_TEXT_START = .;
        build/asm/us/data/fragments/0xC/fragment_0xC_header.o(.text);
        build/src/fragments/0xC/fragment_0xC_code.o(.text);
        fragment_0xC_TEXT_END = .;
        fragment_0xC_TEXT_SIZE = ABSOLUTE(fragment_0xC_TEXT_END - fragment_0xC_TEXT_START);
        fragment_0xC_DATA_START = .;
        fragments_0xC_fragment_0xC_header = .;
        build/asm/us/data/fragments/0xC/fragment_0xC_header.o(.data);
        fragments_0xC_fragment_0xC_code = .;
        build/src/fragments/0xC/fragment_0xC_code.o(.data);
        fragments_0xC_fragment_0xC_data_data = .;
        build/asm/us/data/fragments/0xC/fragment_0xC_data.data.o(.data);
        fragment_0xC_DATA_END = .;
        fragment_0xC_DATA_SIZE = ABSOLUTE(fragment_0xC_DATA_END - fragment_0xC_DATA_START);
        fragment_0xC_RODATA_START = .;
        build/asm/us/data/fragments/0xC/fragment_0xC_header.o(.rodata);
        build/src/fragments/0xC/fragment_0xC_code.o(.rodata);
        fragment_0xC_RODATA_END = .;
        fragment_0xC_RODATA_SIZE = ABSOLUTE(fragment_0xC_RODATA_END - fragment_0xC_RODATA_START);
    }
    fragment_0xC_bss_VRAM = ADDR(.fragment_0xC_bss);
    .fragment_0xC_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        fragment_0xC_BSS_START = .;
        build/asm/us/data/fragments/0xC/fragment_0xC_header.o(.bss);
        build/src/fragments/0xC/fragment_0xC_code.o(.bss);
        fragment_0xC_BSS_END = .;
        fragment_0xC_BSS_SIZE = ABSOLUTE(fragment_0xC_BSS_END - fragment_0xC_BSS_START);
    }
    __romPos += SIZEOF(.fragment_0xC);
    fragment_0xC_ROM_END = __romPos;
    fragment_0xC_VRAM_END = .;
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
