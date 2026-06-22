ENTRY(loader)
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(I386:I386)
SECTIONS{
	. = 0X00100000;
	.text :
	{
		*(.multiboot)
		*(.text*)
		*(.rodata)
	}
	.data :
	{
		start_ctors = .;
		KEEP(*(.init_array ));
		KEEP(*(SORT_BY_INIT_PRIORITY(.init_array)));
		end_ctors = .;
		*(.data)
	}

	.bss : {
		*(.bss)
		}

	/DISCARD/ :{
		*(.fini_array*)
		*(.comment)
		}
}