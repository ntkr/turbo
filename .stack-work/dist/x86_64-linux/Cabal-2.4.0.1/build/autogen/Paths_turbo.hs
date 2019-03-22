{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_turbo (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ian/Code/Haskell/turbo/.stack-work/install/x86_64-linux/lts-13.13/8.6.4/bin"
libdir     = "/home/ian/Code/Haskell/turbo/.stack-work/install/x86_64-linux/lts-13.13/8.6.4/lib/x86_64-linux-ghc-8.6.4/turbo-0.1.0.0-APoE2v71cQ7AOwszdgAyY"
dynlibdir  = "/home/ian/Code/Haskell/turbo/.stack-work/install/x86_64-linux/lts-13.13/8.6.4/lib/x86_64-linux-ghc-8.6.4"
datadir    = "/home/ian/Code/Haskell/turbo/.stack-work/install/x86_64-linux/lts-13.13/8.6.4/share/x86_64-linux-ghc-8.6.4/turbo-0.1.0.0"
libexecdir = "/home/ian/Code/Haskell/turbo/.stack-work/install/x86_64-linux/lts-13.13/8.6.4/libexec/x86_64-linux-ghc-8.6.4/turbo-0.1.0.0"
sysconfdir = "/home/ian/Code/Haskell/turbo/.stack-work/install/x86_64-linux/lts-13.13/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "turbo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "turbo_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "turbo_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "turbo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "turbo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "turbo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
