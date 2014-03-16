# Run with quartus_sh -t <x_cons.tcl>
set_global_assignment -section_id tlc -name EDA_DESIGN_ENTRY_SYNTHESIS_TOOL SYNPLIFY
set_global_assignment -section_id eda_design_synthesis -name EDA_INPUT_DATA_FORMAT EDIF
set_global_assignment -section_id eda_design_synthesis -name EDA_INPUT_VCC_NAME VCC
set_global_assignment -section_id eda_design_synthesis -name EDA_INPUT_GND_NAME GND
set_global_assignment -section_id eda_design_synthesis -name EDA_LMF_FILE synplcty.lmf
import_assignments_from_maxplus2 tlc.acf
