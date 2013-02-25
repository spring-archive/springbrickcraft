Spring.Echo ("modrules!")

return {

movement = {
  allowGroundUnitGravity=true,
  allowUnitCollisionDamage=false,
  allowUnitCollisionOverlap=false,
},

--bugged in pre 83.x
-- http://springrts.com/phpbb/viewtopic.php?f=14&t=27063
construction = {
    constructionDecay      = true; -- defaults to true
    constructionDecayTime  = 5;  -- defaults to 6.66
    constructionDecaySpeed = 0.01;  -- defaults to 0.03
  },

experience = {
	experienceMult=0;
	powerScale  = 0;  -- defaults to 1.0
    healthScale = 0;  -- defaults to 0.7
    reloadScale = 0;  -- defaults to 0.4
	},


  transportability = {
    transportGround = 1;   -- defaults to 1
    transportHover  = 1;   -- defaults to 0
    transportShip   = 1;  -- defaults to 0
    transportAir    = 1;  -- defaults to 0
  },
  
    featureLOS = {
    -- 0 - no default LOS for features
    -- 1 - gaia features always visible
    -- 2 - allyteam/gaia features always visible
    -- 3 - all features always visible
    -- default 3
    featureVisibility = 0;
  },

  sensors = {
    requireSonarUnderWater = false,  -- defaults to true
    
    los = {
      losMipLevel = 3,  -- defaults to 1
      losMul      = 1,  -- defaults to 1
      airMipLevel = 6,  -- defaults to 2
      airMul      = 6,  -- defaults to 1
    },
  },



}