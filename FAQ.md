# FAQ

* **BrivGemFarm is missing settings. I'd like it to do _X_.**   
Many advanced settings are hidden from the UI to make the new user experience more simple and less overwhelming. To review the hidden advanced settings, see the readme located [here](./Addons/IC_BrivGemFarm_Performance/SETTINGS.md).

* **What are the benefits of IC Script Hub over ModronGUI?** 
  * Its responsiveness has been increased.
  * Its reliability has been improved and is constantly being worked on.
  * It never takes control of the mouse away from the user.
  * It uses virtual keys so you can use your computer without issue while the script is running.
  * The settings are simpler and easier to get started with for new scripters.  
  * Many people see a speed increase using IC Script Hub over ModronGUI.
  * IC Script Hub has loads of auto-detection that ModronGUI never had. One example is automatically detecting "Quick Transitions" (QT) for adventures such as The Everlasting Rime and Tall Tales. 
  * IC Script hub is being actively developed while ModronGUI has been retired. If there's an issue with ModronGUI it is not getting fixed, however IC Script Hub is likely to see any issues resolved.
  * ### AddOns! 
    * Users can easily add and remove what functionality they want in the script through the easy to use Addon Manager. 
    * Easily add new addons by dropping them into the Addons folder.
    * Addons are great for developers. If there is a feature missing, it is relatively easy to create (or ask for someone to create) an Addon that does what you want using generic shared functions.

* **How does BrivGemFarm handle buying and opening chests?**  
  Buying and opening chests are handled by a background ServerCall script to avoid pausing or lagging the main gem farm. The settings allow you to configure:
  * **Buy Chests**: Specify whether the script should buy chests, using a ratio slider to balance gold vs silver chest purchases (e.g. 0.9 Gold / 0.1 Silver).
  * **Open Chests**: Specify whether the script should open chests. You can set a reserve limit for both gold and silver chests so the script doesn't open them below those numbers.
  * **Max Chests Only**: There is an option to only buy/open max chests (250 buy / 1000 open per server call) to optimize server calls.
  * **Gem Reserves**: Specify a gem reserve value under which no chests will be bought.

* **Can I run the Gem Farm script on multiple platforms at the same time?**  
Yes! To run the script on multiple platforms first requires a copy of the entire IC Script Hub for each platform that will be used. Game detection is based on exe name so one platform will need the `IdleDragons.exe` to be renamed (e.g. IdleDragonsSteam.exe) and the `IdleDragons_Data` folder to be renamed in the same way (e.g. IdleDragonsSteam_Data). Set up each script with their own settings. The important thing is to remember to set the Install exe to the new renamed exe in the game location.