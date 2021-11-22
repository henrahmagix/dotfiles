#!/usr/bin/env python3

import asyncio
import iterm2
# This script was created with the "basic" environment which does not support adding dependencies
# with pip.

async def main(connection):
    async with iterm2.VariableMonitor(connection, iterm2.VariableScopes.APP, "effectiveTheme", None) as mon:
        while True:
            print("Block until theme changes...")
            # Block until theme changes
            theme = await mon.async_get()

            # Themes have space-delimited attributes, one of which will be light or dark.
            print("Get theme parts...")
            parts = theme.split(" ")
            if "dark" in parts:
                preset = await iterm2.ColorPreset.async_get(connection, "Solarized Dark")
            else:
                preset = await iterm2.ColorPreset.async_get(connection, "Solarized Light")

            # Update the list of all profiles and iterate over them.
            print("Get profiles...")
            profiles=await iterm2.PartialProfile.async_query(connection)
            for partial in profiles:
                # Fetch the full profile and then set the color preset in it.
                profile = await partial.async_get_full_profile()
                await profile.async_set_color_preset(preset)


# This instructs the script to run the "main" coroutine and to keep running even after it returns.
iterm2.run_forever(main)
