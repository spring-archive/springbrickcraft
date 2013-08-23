local armorDefs = {
--was Normal
default = {
	"tptank",
	"tpjeep",
	"tpfactory",
	"tpfactory2",
	"tpvierling",
	"tpdude",
	"tpdrill",
	"tphubschrauber",
	"tpclocky",
	"tpheliport",
	"tpufo",
	"tpthulsa",
	"tptaktak",
	"tplegocar",
	"tpgunturret",
	"tpturretcenter",
	"tplaunchbox",
	"tpheavytank",
	"tpheavydude",
	"tpsmallfac",
	"tphelidrone",
	"tpgripper",
	"tpbigwheel",
	"tppaddler",
	"tphq",
	"tpconverter",
	"tpscorpion",
	"tphelidronebig",
	"tpplatefactory",	
	"tpoilpump",
	"tpslinger",
	"tpwarpantenne",
	"tpdigmine",
	"tpclocky_small",
	"tptiltjet",
	"tpslinger_mobile",
	"tpwall2x2",
	"tphq_small",
	"tpabfang",
	"tpstealthy",
},

minerals = {
	"tpkristall",
	"tpkristall2",
	"tptetra",
},

NoMineDamage = {
	"tppioneer",
	},
}

for categoryName, categoryTable in pairs(armorDefs) do
  local t = {}
  for _, unitName in pairs(categoryTable) do
    t[unitName] = 1
  end
  armorDefs[categoryName] = t
end

return armorDefs