#   _  __                 ____                                          
#  | |/ /___ _   _ ___   / ___|___ _ __ ___ _ __ ___   ___  _ __  _   _ 
#  | ' // _ \ | | / __| | |   / _ \ '__/ _ \ '_ ` _ \ / _ \| '_ \| | | |
#  | . \  __/ |_| \__ \ | |__|  __/ | |  __/ | | | | | (_) | | | | |_| |
#  |_|\_\___|\__, |___/  \____\___|_|  \___|_| |_| |_|\___/|_| |_|\__, |
#            |___/                                                |___/ 

# Source : https://learn.microsoft.com/fr-fr/azure/key-vault/managed-hsm/quick-create-cli


number_key=$(expr $1 - 1)
cypher="${2:-"rsa"}"
key_length=${3:-2048}
days=${4:-1825}

echo "Generating $1 keys..."
for ((i=0; i <= $number_key; i++))
do
  prefix=$(date +'%Y%m%d%H%M%S')
  file="${prefix}_cert_${i}"

  echo "Generating $cypher($key_length) key"
  openssl req -newkey $cypher:$key_length -nodes -keyout "${file}".key -x509 -days $days -out "${file}".cer
done;

#    ____                                            _____           _ 
#   / ___|___ _ __ ___ _ __ ___   ___  _ __  _   _  | ____|_ __   __| |
#  | |   / _ \ '__/ _ \ '_ ` _ \ / _ \| '_ \| | | | |  _| | '_ \ / _` |
#  | |__|  __/ | |  __/ | | | | | (_) | | | | |_| | | |___| | | | (_| |
#   \____\___|_|  \___|_| |_| |_|\___/|_| |_|\__, | |_____|_| |_|\__,_|
