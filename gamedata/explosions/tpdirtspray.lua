return {
  ["spray"] = {
    dirt = {
      air                = true,
      count              = 8,
      ground             = true,
      properties = {
        color              = [[.4, .4, .4]],
        lifetime           = 220,
        pos                = [[-3 r6, r6, -3 r6]],
        size               = 20,--20
        sizeexpansion      = .3,
        slowdown           = 1,
        speed              = [[0.3 r-0.6, 1 r1.0, 0.3 r-0.6]],
      },
    },
  },

  ["tpdirtspray"] = {
    burst = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 i5]],
        explosiongenerator = [[custom:spray]],
        pos                = [[0, 0, 0]],
      },
    },
  },

}

