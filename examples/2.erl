% manually: 600
{func, "eche", ["burst1"], [{"original-cir", 64}, {"midfft", 16}], []}.
{func, "eche-ic", ["original-cir"], [{"cir", 64}, {"temp-cir", 64}], [["original-cir", "cir"]]}.
{func, "pp", ["cir"], [{"mic-cirs", 64}, {"cir-power", 64},  {"mic-midamble", 2}, {"smg-code", 2}, {"smg-cirs", 32}, {"hs-active-cirs", 32}], []}.
{func, "mid-foe", 
    ["hs-active-cirs", "burst1"], 
    [{"mid-fo", 1}, {"mid-foe-mid", 16}, {"mid-foe-tempfft", 16}, {"mid-foe-tempmid", 16}], []}.
{func, "mic-transpose", ["mic-cirs"], [{"mic-cirsT", 64}], []}.
{func, "mic", 
    ["mic-cirsT", "mic-midamble", "burst1"], 
    [{"burst1-mic", 64}, {"mic-bin-qpsk", 32}, {"mic-v2B", 128}], [["burst1", "burst1-mic"]]}.
{func, "smg-transpose", ["smg-cirs"], [{"smg-cirsT", 32}], []}.
{func, "smg", 
    ["smg-cirsT", "smg-code"], 
    [{"HermB", 64}, {"smg-bin-qpsk", 32}, {"smg-v2B", 128}], []}.
{func, "mf1", 
    ["HermB", "burst1-mic"], 
    [{"MFE1", 44}, {"MFBuffer", 88}, {"activeHermB", 64}], [["activeHermB", "HermB"]]}.
{func, "rmg", ["HermB"], [{"R0T", 32}, {"R1T", 32}], []}.
{func, "cyd", 
    ["R0T", "R1T"], 
    [{"L0T", 24}, {"L1T", 32}, {"L2T", 24}, {"L3T", 32}, {"L4T", 24},
     {"L0C", 24}, {"L1C", 32}, {"L2C", 24}, {"L3C", 32}, {"L4C", 24}], []}.
{func, "eq", 
    ["MFE1", "L0T", "L1T", "L2T", "L3T", "L4T", "L0C", "L1C", "L2C", "L3C", "L4C"], 
    [{"esb", 44}, {"esa", 44}, {"eq-tempbuf", 88}], []}.
{func, "lad", ["esb"], [{"LAD", 1}, {"codePwr", 2}], []}.
{program, 
    [{"burst1", 64}], 
    ["esb", "LAD", "codePwr", "L0T", "L1T", "L2T", "L3T", "L4T", "L0C", "L1C", "L2C", "L3C", "L4C", "mid-fo"],
    ["burst1", "mid-fo"]}.
