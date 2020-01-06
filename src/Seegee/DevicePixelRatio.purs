module Seegee.DevicePixelRatio where

import Prelude

import Effect (Effect)
import Geometry.Distance (ConversionFactor(..))
import Geometry.Numbers.Positive (Positive) as Numbers
import Seegee.Geometry.Distance.Units (Pixel, Screen) as Units

newtype DevicePixelRatio = DevicePixelRatio Numbers.Positive
derive instance eqDevicePixelRation ∷ Eq DevicePixelRatio

foreign import devicePixelRatio ∷ Effect DevicePixelRatio

conversionFactor ∷ DevicePixelRatio → ConversionFactor Units.Screen Units.Pixel
conversionFactor (DevicePixelRatio dpr) = ConversionFactor dpr
