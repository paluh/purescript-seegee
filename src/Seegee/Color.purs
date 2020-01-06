module Seegee.Color where

import Prelude

import Data.Foldable (foldMap)
import Data.Int (fromStringAs, hexadecimal, toStringAs)
import Data.Maybe (Maybe(..))
import Data.String (codePointFromChar, fromCodePointArray, toCodePointArray, toLower)

black ∷ Color
black = fromRgb 0 0 0

type Color =
  { r ∷ Int
  , g ∷ Int
  , b ∷ Int
  , a ∷ Int
  -- | XXX: Extract repr out to some dedicated cached object
  , repr ∷ String
  }

fromRgb ∷ Int → Int → Int → Color
fromRgb r g b =
  { r, g, b, a, repr }
  where
    a = 255
    repr = toLower $ foldMap (toStringAs hexadecimal) [ r, g, b, a ]

-- | We should drop rgba as it is handled by opacity in case of SVG
fromRgba ∷ Int → Int → Int → Int → Color
fromRgba r g b a =
  { r, g, b, a, repr }
  where
    repr = toLower $ foldMap (toStringAs hexadecimal) [ r, g, b, a ]

fromRepr ∷ String → Maybe Color
fromRepr repr = case toCodePointArray repr of
  [ r1, r2, g1, g2, b1, b2 ] → build' r1 r2 g1 g2 b1 b2
  [ r1, r2, g1, g2, b1, b2, a1, a2 ] → build r1 r2 g1 g2 b1 b2 a1 a2
  [ r, g, b ] → build' r r g g b b
  [ r, g, b, a ] → build r r g g b b a a
  otherwise → do
    Nothing
  where
    f = codePointFromChar 'f'
    build' r1 r2 g1 g2 b1 b2 = build r1 r2 g1 g2 b1 b2 f f
    build r1 r2 g1 g2 b1 b2 a1 a2 = do
      let
        h c1 c2 = fromStringAs hexadecimal (fromCodePointArray [ c1, c2 ])
        repr' = toLower repr
      r ← h r1 r2
      g ← h g1 g2
      b ← h b1 b2
      a ← h a1 a2
      pure { r, g, b, a, repr: repr' }

