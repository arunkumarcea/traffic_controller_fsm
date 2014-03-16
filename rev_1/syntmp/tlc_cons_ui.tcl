
proc syn_dump_io {} {
	execute_module -tool cdb -args "--back_annotate=pin_device"
}

source "/tools/synp-2011.03-sp1/lib/altera/quartus_max_cons.tcl"
syn_create_and_open_prj tlc
source $::quartus(binpath)/prj_asd_import.tcl
syn_create_and_open_csf tlc
syn_handle_cons tlc
syn_dump_io
