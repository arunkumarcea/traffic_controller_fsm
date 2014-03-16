##--##--## Neptune Project Wide BlackBoxes ##--##--##

## RULE SEVERITY OVERRIDE
-overloadrules=CaseOverIf+severity=Info                      ## Warning -> Info
-overloadrules=DisallowCaseZ-ML+severity=Info                ## Error   -> Info
-overloadrules=ConstSig+severity=Info                        ## Warning -> Info
-overloadrules=DeadCode+severity=Info                        ## Warning -> Info
-overloadrules=ResetFlop-ML+severity=Info                    ## Warning -> Info
-overloadrules=W287b+severity=Info                           ## Warning -> Info
-overloadrules=SYNTH_5130+severity=Info                      ## Warning -> Info
-overloadrules=W415a+severity=Info                           ## Error   -> Info  No check in Ascentlint
-overloadrules=W120+severity=Info                            ## Warning -> Info  to match Ascentlint
-overloadrules=W490+severity=Info                            ## Error   -> Info  No check in Ascentlint
-overloadrules=W159+severity=Info                            ## Warning -> Info  No check in Ascentlint
-overloadrules=W175+severity=Info                            ## Warning -> Info  No check in Ascentlint
-overloadrules=W193+severity=Info                            ## Warning -> Info  No check in Ascentlint
-overloadrules=W34+severity=Info                             ## Warning -> Info  Match to Ascentlint
-overloadrules=ParamOverrideMismatch-ML+severity=Info        ## Warning -> Info  No check in Ascentlint
-overloadrules=W402a+severity=Info                           ## Warning -> Info  No check in Ascentlint
-overloadrules=DEEPMUX+severity=Info                         ## Error   -> Info  No check in Ascentlint
-overloadrules=W528+severity=Info                            ## Warning -> Info  to match Ascentlint
-overloadrules=SGDC_waive27+severity=Info                    ## Warning -> Info  Waiver regexp not used
-overloadrules=STARC-2.8.5.2+severity=Info                   ## Warning -> Info  to match Ascentlint
-overloadrules=NoWidthInBasedNum-ML+severity=Info            ## Warning -> Info  No check in Ascentlint


## Hard Macros
## The RTL code for these modules is no synthesised.
-stop TCITSMCN40LPCGHPLLA1        // PLL
-stop TCITSMCN40LPDDRLDLLA1       // DDR DLL
-stop TCITSMCN40LPMATCHA1
-stop mr74046                     // Temp Sensor
-stop "TEF40LP*"                  // Efuse / EfuseESD
-stop sbmult510t40lp6g            // SERDES
-stop top_por300                  // POR
-stop DWC_DDR3PHY_top             // DDR PHY
-stop sfi_clock_gater_xtensa      // Local clock gater derinition
// Check if any other DDR blackboxes need to be added here

## Black box modules from Ascentlint project.waiver.tcl
-stop ram_model_dual_port

## Black-Box all the memory wrappers
-stop "REGF_*_wrapper"
-stop "ROM_*_wrapper"
-stop "SRAM_*_wrapper"

## Black Box Tensilica Processors
-stop SF_Xm_grpu_v2Xttop
-stop SF_Xm_gimpXttop

## Black Box IP From IPCores ECC module in CRYPTO
-stop ipcores_ecc_ECC1_BPC

## Black Box the spare cells
-stop "sfi_spare_*"

