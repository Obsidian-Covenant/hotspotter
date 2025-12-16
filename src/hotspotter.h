/*
 * $Id: $
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation. See COPYING for more
 * details.
 *
 * Hotspotter is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

//#define DEBUG 0
#define MAXLINES 30000
#define M_HDR_LEN 24

// prototypes
int handle_ssid(char *ssid, char *last_ssid);
int handle_ap(char *ssid, struct iwreq iwr, int socketfd, int automatic,
              char *interface);
int lookup_hotspot(char *essid);
int become_ap(char *ssid, int socketfd, char *interface);

void cleanup_failure(int sig);
void close_pcap(void);
