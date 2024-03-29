local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

-- stylua: ignore start
local symbols = {
  { ";a",  "\\alpha"      },
  { ";b",  "\\beta"       },
  { ";g",  "\\gamma"      },
  { ";G",  "\\Gamma"      },
  { ";d",  "\\delta"      },
  { ";D",  "\\Delta"      },
  { ";e",  "\\epsilon"    },
  { ";ve", "\\varepsilon" },
  { ";z",  "\\zeta"       },
  { ";h",  "\\eta"        },
  { ";o",  "\\theta"      },
  { ";vo", "\\vartheta"   },
  { ";O",  "\\Theta"      },
  { ";k",  "\\kappa"      },
  { ";l",  "\\lambda"     },
  { ";L",  "\\Lambda"     },
  { ";m",  "\\mu"         },
  { ";n",  "\\nu"         },
  { ";x",  "\\xi"         },
  { ";X",  "\\Xi"         },
  { ";p",  "\\pi"         },
  { ";P",  "\\Pi"         },
  { ";r",  "\\rho"        },
  { ";vr", "\\varrho"     },
  { ";s",  "\\sigma"      },
  { ";S",  "\\Sigma"      },
  { ";U",  "\\tau"        },
  { ";t",  "\\upsilon"    },
  { ";u",  "\\Upsilon"    },
  { ";f",  "\\phi"        },
  { ";vf", "\\varphi"     },
  { ";F",  "\\Phi"        },
  { ";c",  "\\chi"        },
  { ";i",  "\\psi"        },
  { ";I",  "\\Psi"        },
  { ";w",  "\\omega"      },
  { ";W",  "\\Omega"      },
}
-- stylua: ignore end

local M = {}

-- Automatically generate snippets for greek letters
for i = 1, #symbols do
  table.insert(
    M,
    s({
      trig = symbols[i][1],
      desc = 'shorthand for ' .. symbols[i][2],
      name = symbols[i][2],
      snippetType = 'autosnippet',
    }, { t(symbols[i][2]) })
  )
end

return M
