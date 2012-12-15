-- $Id: ModOptions.lua 3323 2008-11-29 19:55:06Z reivanen $

--  Custom Options Definition Table format

--  NOTES:
--  - using an enumerated table lets you specify the options order
--
--  These keywords must be lowercase for LuaParser to read them.
--
--  key:      the string used in the script.txt
--  name:     the displayed name
--  desc:     the description (could be used as a tooltip)
--  type:     the option type
--  def:      the default value
--  min:      minimum value for number options
--  max:      maximum value for number options
--  step:     quantization step, aligned to the def value
--  maxlen:   the maximum string length for string options
--  items:    array of item strings for list options
--  scope:    'all', 'player', 'team', 'allyteam'      <<< not supported yet >>>
--


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local opts= {
	{
	key="startingmetal",
	name="Start Metal (debug)",
	desc="How much metal at start?",
	type   = 'number',	
	def    = 4000,
	min    = 1,
	max    = 40000,
	step   = 1,
	},
	
	{
	key="minercost",
	name="Harvester Metal cost (debug)",
	desc="How much metal does a Harvester cost?",
	type   = 'number',	
	def    = 1500,
	min    = 1,
	max    = 40000,
	step   = 1,
	},
	
	{
	key="pumpmetalmake",
	name="Pump Metal Production (debug)",
	desc="How much metal does a captured pump produce?",
	type   = 'number',	
	def    = 1500,
	min    = 1,
	max    = 40000,
	step   = 1,
	},
}
return opts