#!/usr/bin/env python3

import requests
import lxml.cssselect, lxml.html

url = 'https://packagecontrol.io/installation'
response = requests.get(url)
page_text = lxml.html.fromstring(response.text)
sel = lxml.cssselect.CSSSelector('.code.st2 code')
command_text = sel(page_text)[0].text.strip()

print(command_text)
