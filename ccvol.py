import argparse
import http.client as http_client
import logging
import time
import sys

import pychromecast


parser = argparse.ArgumentParser(
    description="Example on how to use the Spotify Controller.")
parser.add_argument('--show-debug', help='Enable debug log',
                    action='store_true')
parser.add_argument('--host', help='Chromecast host address', default = "localhost")
parser.add_argument('--volume', help='Volume', default = 0.5)

args = parser.parse_args()

if args.show_debug:
    logging.basicConfig(level=logging.DEBUG)
    # Uncomment to enable http.client debug log
    #http_client.HTTPConnection.debuglevel = 1
try:
    cast = pychromecast.Chromecast(args.host)
except pychromecast.error.ChromecastConnectionError:
    print('ERROR: Failed to connect to Chromecast at "{}"'.format(args.host))
    sys.exit(1)

# Wait for connection to the chromecast
cast.wait()
cast.set_volume(float(args.volume))
