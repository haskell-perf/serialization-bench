{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE DeriveAnyClass     #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE StandaloneDeriving #-}
module Dataset(carsData,irisData) where
import           Control.DeepSeq
import qualified Data.Binary                as B
import Codec.Serialise as CBOR
import qualified Data.Flat                  as F
import qualified Data.Serialize             as C
import qualified Data.Persist                as R
import qualified Data.Store                 as S
import qualified Data.Winery                as W
import           Numeric.Datasets           (getDataset)
-- import           Numeric.Datasets.Abalone   (abalone)
import           Numeric.Datasets.Car
import           Numeric.Datasets.Iris

instance NFData RelScore
instance B.Binary RelScore
instance C.Serialize RelScore
instance CBOR.Serialise RelScore
instance F.Flat RelScore
instance S.Store RelScore
instance R.Persist RelScore
instance W.Serialise RelScore where
  bundleSerialise = W.bundleVariant id

instance NFData RelSize
instance B.Binary RelSize
instance C.Serialize RelSize
instance CBOR.Serialise RelSize
instance F.Flat RelSize
instance S.Store RelSize
instance R.Persist RelSize
instance W.Serialise RelSize where
  bundleSerialise = W.bundleVariant id

instance NFData Acceptability
instance B.Binary Acceptability
instance C.Serialize Acceptability
instance CBOR.Serialise Acceptability
instance F.Flat Acceptability
instance S.Store Acceptability
instance R.Persist Acceptability
instance W.Serialise Acceptability where
  bundleSerialise = W.bundleVariant id

instance NFData Count
instance B.Binary Count
instance C.Serialize Count
instance CBOR.Serialise Count
instance F.Flat Count
instance S.Store Count
instance R.Persist Count
instance W.Serialise Count where
  bundleSerialise = W.bundleVariant id

deriving instance Eq Car
instance NFData Car
instance B.Binary Car
instance C.Serialize Car
instance CBOR.Serialise Car
instance F.Flat Car
instance S.Store Car
instance R.Persist Car
instance W.Serialise Car where
  bundleSerialise = W.bundleRecord id

deriving instance Eq Iris
instance NFData Iris
instance B.Binary Iris
instance C.Serialize Iris
instance CBOR.Serialise Iris
instance F.Flat Iris
instance S.Store Iris
instance R.Persist Iris
instance W.Serialise Iris where
  bundleSerialise = W.bundleRecord id

instance NFData IrisClass
instance B.Binary IrisClass
instance C.Serialize IrisClass
instance CBOR.Serialise IrisClass
instance F.Flat IrisClass
instance S.Store IrisClass
instance R.Persist IrisClass
instance W.Serialise IrisClass where
  bundleSerialise = W.bundleVariant id

-- irisData = iris
irisData :: [Iris]
irisData = by 500 iris

carsData :: IO [Car]
carsData = by 20 <$> getDataset car
-- carsData = getDataset car
-- abaloneData = by 10 <$> getDataset abalone

by :: Int -> [a] -> [a]
by n = concat . replicate n

-- test :: IO ()
-- test = do
--    -- The Iris data set is embedded
--    print (length iris)
--    print (head iris)
--    cars <- getDataset car
--    print (length cars)
--    print (head cars)
--    -- print $ F.flat cars
--    -- The Abalone dataset is fetched
--    abas <- getDataset abalone
--    print (length abas)
--    print (head abas)
