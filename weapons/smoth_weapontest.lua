-- Missile Rack Base Class
local MissileRackClass = Weapon:New{
   weaponVelocity      = 400,
   startVelocity      = 400,
   weaponAcceleration   = 300,
   areaOfEffect      = 32,
   impulseFactor      = 0,
   craterMult         = 0,
   turret            = true,
   noSelfDamage      = true,
   avoidFriendly      = true,
   collideFriendly      = false,
   SmokeTrail         = true,
   burnblow         = true,
   --cegTag            = "missiletrail2_light",
   --explosionGenerator   = "custom:MISSILE_EXPLOSION",
   model            = "projmedium.s3o",
   range            = 500,
   reloadtime         = 3,
   --soundHit         = "explode2",
   --soundStart         = "rocket",
   --texture1         = "flash1",
   --texture2         = "flash2",
   --texture3         = "flash3",
   weapontype          = "MissileLauncher",
   trajectoryheight   = 2,
   weaponTimer         = 3,
   projectiles          = 6,
   customparams = {
      effect1         = "smallgreymuzzle",
      effect2         = "rocketlaunchsmall",
      damagetype      = "explosive",   
      count         = 6,
      vlaunchrack      = "x_axis",
      noturret      = true,
      animation      = "headers/weapons/missilerack.lua"
   },         
   damage = {
      default         = 100,
   },
}


local MissileRack_8count = MissileRackClass:New{
   accuracy         = 2100,
   dance            = 100,
   reloadtime         = 4,
   projectiles          = 4,
   burst            = 2,
   burstrate          = 0.6,
   name            = "8 Missle rack",
   
   customparams = {
      recoilless      = true,
   },   
}
  
  
-- Return only the full weapons
return lowerkeys({
   MissileRack_8count   = MissileRack_8count,
})