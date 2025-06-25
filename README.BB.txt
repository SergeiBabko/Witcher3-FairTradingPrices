[size=5][b]Note[/b][/size]
All changes made by this mod are based on the clean, unmodified Witcher 3 game code, without any leftovers or dependencies from other mods. This ensures maximum compatibility and stability.



[size=5][b]Features[/b][/size]

[list]
[*]Toggle between original prices and mod-adjusted prices
[*]Adjustable price modifier (from 10 = less profit for player, to 100 = same as shop price)
[*]Adjustable price multiplier (from 0.5 = lower prices, to 10 = higher prices)
[*]Optional infinite money for merchants
[*]Fully configurable in-game via mod settings menu
[*]Multiple presets included
[/list]

[size=5][b]Presets[/b][/size]

[list]
[*][b]Same Prices[/b] (100%)
Items are sold at full price - same as merchants pay. Perfect for testing or cheat-like fairness.
[*][b]Fair Trade[/b] (80%)
Balanced gameplay - merchants offer most of the item's value. Recommended default.
[*][b]Hard Bargain[/b] (70%)
Merchants pay less, representing tougher negotiations or market pressure.
[*][b]Desperate Deal[/b] (50%)
Merchants only pay half the item's value. Use when gold should feel more earned.
[*][b]Exploitation[/b] (40%)
Severe profit loss when selling - reflects a merchant-dominated economy.
[*][b]Fleeced Alive[/b] (30%)
You're being ripped off. Only a third of the value is returned on sale.
[*][b]Utter Robbery[/b] (20%)
Brutal setting - merchants exploit you fully. Gold is hard to come by.
[/list]

[size=5][b]Installation Guide[/b][/size]

1. [b]Extract the contents[/b] into your Witcher 3 game directory using this structure:
[list]
[*][b][i]The Witcher 3\mods[/i][/b]
[*][b][i]The Witcher 3\bin\config\r4game\user_config_matrix\pc[/i][/b]
[/list]
[code]The Witcher 3\
├── mods\
│   └── mod001FairTradingPrices\ (*)
│       └── [mod content here]
├── bin\
│   └── config\
│       └── r4game\
│           └── user_config_matrix\
│               └── pc\
│                   ├── dx11filelist.txt
│                   ├── dx12filelist.txt
│                   └── FairTradingPrices.xml (*)[/code]


4. [b]Edit the filelists[/b]:
Add the following line to both: [b][i]"FairTradingPrices.xml"[/i][/b]
[list]
[*][b][i]dx11filelist.txt[/i][/b]
[*][b][i]dx12filelist.txt[/i][/b]
[/list]
3. [b]Enable the mods[/b] in The Witcher 3 Launcher.
4. [b]Launch the game[/b], go to [b][i]"Options → Mods"[/i][/b], and configure your desired settings.


[size=5][b]Localization[/b][/size]

[list]
[*]Current translations included: [b][i]English, Russian, Polish, Simplified Chinese, Traditional Chinese[/i][/b]
[*]Translations are managed via CSV files.
[*]Check the [b][i]"localization"[/i][/b] folder and see the internal README for instructions on compiling or submitting translations.
[*]Compiled [b][i]".w3strings"[/i][/b] are required for translations to take effect.
[/list]

[size=5][b]Contributing Translations[/b][/size]

[list]
[*]Edit the appropriate CSV file in the [b][i]"translations"[/i][/b] folder
[*]Compile your changes using [b][i]"#ConvertCSVtoWS.bat"[/i][/b]
[*]Submit a [url=https://github.com/SergeiBabko/Witcher3-FairTradingPrices/pulls]GitHub pull request[/url] or [url=https://github.com/SergeiBabko/Witcher3-FairTradingPrices/issues]open an issue[/url] with your translated files
[/list]

[size=5][b]Credits[/b][/size]

Original Mod Author: [url=https://github.com/SergeiBabko]GitHub[/url] | [url=https://next.nexusmods.com/profile/Segich]NexusMods[/url]
Original Mod Link: [url=https://www.nexusmods.com/witcher3/mods/10941]NexusMods FTP Mod[/url]
Original Repository: [url=https://github.com/SergeiBabko/Witcher3-FairTradingPrices]Witcher3-FairTradingPrices on GitHub[/url]
Special Thanks: [url=https://www.nexusmods.com/witcher3/mods/484]ScriptMerger[/url] | [url=https://www.nexusmods.com/witcher3/mods/1055]w3strings encoder[/url]
