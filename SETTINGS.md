# Script Hub Settings File
## Description:
These are the currently available advanced settings in Settings.json.

## Advanced Settings: 

* **NoCtrlKeypress**: 0 / 1 (Default: 0)
If this is set to 1, ctrl keypresses will not be used for functions within IC_SharedFunctions_Class (e.g., when leveling click damage).

* **WaitForProcessTime**: 0+ (Default: 0)
Time in milliseconds the script will wait after running the game. This can be used as a workaround for process ID changes (e.g. on Kartridge).

* **WindowXPosition**: 0+ (Default: 0)
Sets the horizontal (X) screen coordinate where the Script Hub window will appear.

* **WindowYPosition**: 0+ (Default: 0)
Sets the vertical (Y) screen coordinate where the Script Hub window will appear.

* **WindowTitle**: \<string\> (Default: "")  
Adds custom text to the Script Hub window title. Useful for differentiating multiple running instances of the script.

* **CheckForUpdates**: 0 / 1 (Default: 1)
Determines if Script Hub checks for updates on startup. Can be set to 0 to disable automatic version checks.

* **ExeName**: \<string\> (Default: "IdleDragons.exe")
The executable name of the game, used by the script to target and read memory.

* **FontSize**: \<integer\> (Default: 8)
Configures the base font size for the Script Hub GUI.

* **InstallPath**: \<string\>
The local filepath to the game's executable, used to launch the game automatically.

* **RunHidden**: 0 / 1 (Default: 0)
Allows launching the game with the Hide modifier. This hides cmd/shell windows that pop up during launching (e.g., when launching via legendary).

* **TabControlHeight**: \<integer\> (Default: 900)
Customizes the height of the main tab control window in the GUI.

* **TabControlWidth**: \<integer\> (Default: 430)
Customizes the width of the main tab control window in the GUI.