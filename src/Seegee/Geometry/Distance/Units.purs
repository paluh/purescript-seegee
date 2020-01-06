module Seegee.Geometry.Distance.Units where

import Geometry (kind SpaceUnit)

foreign import data Canvas ∷ SpaceUnit

foreign import data Pixel ∷ SpaceUnit

-- | Logical pixels - used by CSS.
-- | For example to get exact image resolution
-- | required for a on a screen with `dpr = 2`
-- | you should provide conversion factor:
-- | ```
-- | c ∷ ConversionFactor Screen Pixel
-- | c = ConversionFactor (Integer.Positive.reflectPos (Proxy ∷ Proxy d2))
-- | ```
foreign import data Screen ∷ SpaceUnit

foreign import data Svg ∷ SpaceUnit

-- | We want to drop this unit probably
foreign import data Scene ∷ SpaceUnit



