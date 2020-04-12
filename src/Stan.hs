{- |
Copyright: (c) 2020 Kowainik
SPDX-License-Identifier: MPL-2.0
Maintainer: Kowainik <xrom.xkov@gmail.com>

Main running module.
-}

module Stan
       ( runStan
       ) where

import Stan.Analysis (runAnalysis)
import Stan.Cli (CliArgs (..), runStanCli)
import Stan.Hie (readHieFiles)


runStan :: IO ()
runStan = runStanCli >>= \CliArgs{..} -> do
    hieFiles <- readHieFiles cliArgsHiedir
    let analysis = runAnalysis hieFiles
    print analysis

    -- for debugging
    -- whenNotNull hieFiles $ pPrint . head
