# dotfiles

currently only supports osx and debian (with `apt-get`)

| name             	| linux   	| darwin  	| server    	| config  	|
|------------------	|---------	|---------	|-----------	|---------	|
| zsh              	| &#9745; 	| &#9745; 	| &#9745;   	| &#9745; 	|
| brew             	| &#9745; 	| &#9745; 	| &#9745;   	| &#9745; 	|
| git              	| &#9745; 	| &#9745; 	| &#9745;   	| &#9745; 	|
| mysql workbench  	| &#9745; 	| &#9745; 	|            	|         	|
| slack            	| &#9745; 	| &#9745; 	|           	|         	|
| vscodium         	| &#9745; 	| &#9745; 	|           	| &#9745; 	|
| iterm2           	|         	| &#9745; 	|           	| todo    	|
| macs-fan-control 	|         	| &#9745; 	|           	| todo    	|
| spectacle        	|         	| &#9745; 	|           	|         	|
| pihole           	|         	|         	| &#9745;   	| todo     	|
| minidlna         	|         	|         	| &#9745;   	| &#9745;  	|
| samba            	|         	|         	| &#9745;   	| &#9745;  	|
| deluge           	|         	|         	| &#9745;   	| todo    	|

## usage

`./setup.sh`: regular setup

`./setup.sh server`:  set up for server

`./merge.sh`: merge new changes (uses sdiff)

`./codium/export.sh`: export extensions to `codium/extensions.sh`

`./codium/import.sh`: install exported extensions
