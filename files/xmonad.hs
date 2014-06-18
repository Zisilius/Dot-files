-- XMonad configuration file
-- written by Kevin Morris and modified by Alexey Golubev
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.Dmenu
import XMonad.Actions.CycleWS
import XMonad.Actions.CycleWindows
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import Data.List
import Text.Regex.Posix ((=~))
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.LayoutHints

import qualified XMonad.StackSet as W

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

myTerminal = "urxvtcd"

myModMask = mod4Mask

myBorderWidth = 1 

myLayout = smartBorders (tall)
	where tall = Grid ||| ThreeCol 1 (3/100) (1/2) ||| Tall 1 (3/100) (1/2)

q ~? x = fmap (=~ x) q

myConfig = ewmh defaultConfig {
 	  terminal = myTerminal
	, modMask = myModMask
	, borderWidth = myBorderWidth
	, focusedBorderColor = "#77FF29"
--	, normalBorderColor = "#7D7D7D"
  , normalBorderColor = "#5D5D5D"
	, layoutHook = myLayout 
	, manageHook = composeAll [
--        isFullscreen --> doFullFloat,
        isFullscreen --> (doF W.focusDown <+> doFullFloat),
        className =? "MPlayer" --> doFloat,
        className =? "Dia" --> doFloat,
        className =? "Gimp" --> doFloat,
        className =? "Fbmessenger" --> doFloat,
        className =? "SimplistAnimationTest" --> doFloat,
        className =? "TexMaker" --> doFloat,
        className =? "Main-EscapeCCSF" --> doFloat,
        className =? "Vncviewer" --> doFloat,
        className =? "qemu-system-x86_64" --> doFloat,
        className ~? "libreoffice" --> doFloat
	]
	, handleEventHook = handleEventHook defaultConfig <+> docksEventHook
}
	`additionalKeysP`
	[ ("M-d", spawn "dmenu_run")
    , ("M-C-<Return>", spawn "urxvtcd -name URxvtd")
    , ("M-n", spawn "mpc next")
    , ("M-p", spawn "mpc toggle")
    , ("M-<Left>", windows W.focusUp)
    , ("M-<Right>", windows W.focusDown)
    , ("M-S-<Up>", rotFocusedDown)
    , ("M-S-<Down>", rotFocusedUp)
    , ("M-<Up>", rotUnfocusedDown)
    , ("M-<Down>", rotUnfocusedUp)
	]
