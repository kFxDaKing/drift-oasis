resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "html/index.html"

client_script {
	"driftcounter_c.lua",
	"ui_client.lua"
}

server_scripts {
	'driftcounter_s.lua',
	'ui_server.lua',
	'@mysql-async/lib/MySQL.lua'
}

server_export 'GetScoreboardDriftInfo'

files {
	"html/index.html",
  "html/style.css",
	"html/index.js",
	'stats.xml'
}

data_file 'MP_STATS_DISPLAY_LIST_FILE' 'stats.xml'