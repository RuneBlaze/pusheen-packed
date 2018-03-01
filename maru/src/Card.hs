{-# LANGUAGE OverloadedStrings, DuplicateRecordFields#-}
{-# LANGUAGE RecordWildCards #-}
module Card where
import           Data.Aeson

data IntroApr = IntroApr {
    months :: Int,
    rate :: Int,
    doesNotApply :: Bool
}

data RegularApr = RegularApr {
    months :: Int,
    rate :: Int,
    variable :: Bool
}

data CreditRange = CreditRange {
    min :: Int,
    max :: Int
}

data CreditScoreRange = CreditScoreRange {
    poor :: Maybe CreditRange,
    medium :: Maybe CreditRange,
    excellent :: Maybe CreditRange
}

data Fee = Fee {
    name :: String,
    fee :: Int,
    caveat :: String
} deriving Show

data Rate = Rate {
    name :: String,
    rate :: Float,
    durationMonths :: Int
} deriving Show

data Card = Card {
    id :: Int,
    merchant :: String,
    name :: String,
    image :: String,
    tags :: [String],
    rate :: Rate,
    fee :: Fee,
    features :: [String]
} deriving Show

instance FromJSON Card where
    parseJSON = withObject "Card" $ \o -> do
        id <- o .: "id"
        name <- o .: "name"
        image <- o .: "image"
        merchant <- o .: "merchant"
        tags <- o .: "tags"
        features <- o .: "features"
        let rate = Rate {name = "Hi", rate = 1.0, durationMonths = 10}
        let fee = Fee {name = "Bye", fee = 12, caveat = "Hello World"}
        return Card{..}
        