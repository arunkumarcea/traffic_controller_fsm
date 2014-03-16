################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(22,20);
spyCacheTagValuesFromBatch(["ADV_CLK_SYNC_SS_SCH"]);
spyCacheTagValuesFromBatch(["CLK_SYNC09_SS_SCH"]);
spyCacheTagValuesFromBatch(["DFT_DATA_CSV_TAG"]);
spyCacheTagValuesFromBatch(["RESET_INFO_01_SS_SCH"]);
spyParseTextMessageTagFile("../reports//spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
)
);
}
spyMessageTagTestBenchmark(29,"../reports//spyglass.vdb");

1;
