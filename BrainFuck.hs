-- Copyright (c) 2012 Yohsuke YUKISHITA, https://github.com/ykst
-- 
-- Permission is hereby granted, free of charge, to any person obtaining
-- a copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
-- LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-- WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module BrainFuck where
import Text.Parsec
import Control.Applicative hiding ((<|>),many,optional)
import Control.Monad.Trans (liftIO)
import Control.Arrow (first, second)
import Control.Monad (when)
import Data.Char (ord,chr)
import Data.Word (Word8) 

type UState = ([Word8],Int)
initialUState = (replicate 3000000 0,0) :: UState 

expr :: Bool ->  ParsecT String UState IO [()]
expr b =  many $ (when b . doAction =<< (oneOf "<>+-.," <* spaces)) <|> whileExpr
  where whileExpr = do 
          inp <- getInput
          pos <- getPosition
          getState >>= between (char '[' <* spaces) (char ']' <* spaces) . expr . loopCond 
          getState >>= flip when (setInput inp >> setPosition pos) . loopCond
          where  loopCond  =  (b &&) . (0 /=) . uncurry (!!)
        doAction o = case o of
          '.' -> liftIO . putChar . chr . fromIntegral . uncurry (!!)  =<< getState 
          ',' -> modifyState . update . const .  fromIntegral . ord =<< liftIO getChar 
          '>' -> modifyState (second succ)
          '<' -> modifyState (second pred)
          '+' -> modifyState (update (1+))
          '-' -> modifyState (update (-1+))
          where update f (a,b)  = (upd a b,b)
                  where upd (l:ls) 0 = f l : ls
                        upd (l:ls) i = l : upd ls (i-1)

brainFuck :: String -> IO ()
brainFuck input = do
  res <- runParserT (expr True >> eof) initialUState "BRAINFUCK" input
  case res of
    Left err -> print err
    otherwise -> return ()

fromFile :: FilePath -> IO ()
fromFile p = readFile p >>= brainFuck
