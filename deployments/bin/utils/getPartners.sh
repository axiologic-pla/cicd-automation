NETWORKS_FOLDER=$1
NETWORK_NAME=$2
CLUSTER_NAME=$3
# shellcheck disable=SC2207
folderPaths=($(find $NETWORKS_FOLDER -path "*/$NETWORK_NAME/editable/$CLUSTER_NAME" | cut -f 3 -d "/"))
partners="["
for i in "${!folderPaths[@]}"; do
  if [ ! "${folderPaths[$i]}" == $CLUSTER_NAME ]; then
    partners="$partners'${folderPaths[$i]}',"
  fi
done
if  [ ! "$partners" == "[" ]; then
  partners=$(echo "$partners" | rev | cut -c2- | rev)
fi
partners="$partners]"
echo $partners