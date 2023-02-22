NETWORKS_FOLDER=$1
NETWORK_NAME=$2
CLUSTER_NAME=$3
# shellcheck disable=SC2207
folderPaths=($(ls "$NETWORKS_FOLDER/$NETWORK_NAME/editable/"))
partners="["
for i in "${!folderPaths[@]}"; do
  echo $i ${folderPaths[$i]}
  if [ ! "${folderPaths[$i]}" == $CLUSTER_NAME ]; then
    partners="$partners'${folderPaths[$i]}',"
  fi
done
if  [ ! "$partners" == "[" ]; then
  partners=$(echo "$partners" | rev | cut -c2- | rev)
fi
partners="$partners]"
echo $partners