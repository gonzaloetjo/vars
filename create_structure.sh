#!/usr/bin/env bash

folders=("all" "exporter" "firewall" "hadoop" "hbase" "hdfs" "hive" "hue" "jupyterhub" "kafka" "knox" "livy" "livy-spark3" "ranger" "spark" "spark3" "tdp-cluster" "yarn" "zookeeper" "zookeeper-kafka")

files=(
"all.yml"
"exporter.yml"
"firewall.yml"
"hadoop.yml"
"hbase.yml hbase_client.yml hbase_master.yml hbase_regionserver.yml hbase_rest.yml phoenix_queryserver_daemon.yml"
"hdfs.yml hdfs_datanode.yml hdfs_httpfs.yml hdfs_journalnode.yml hdfs_namenode.yml"
"hive.yml hive_client.yml hive_metastore.yml"
"hue.yml"
"jupyterhub.yml"
"kafka.yml"
"knox.yml"
"livy.yml"
"livy-spark3.yml"
"ranger.yml ranger_kms.yml ranger_usersync.yml"
"spark.yml"
"spark3.yml"
"tdp-cluster.yml"
"yarn.yml yarn_apptimelineserver.yml yarn_mapred_jobhistoryserver.yml yarn_nodemanager.yml yarn_resourcemanager.yml"
"zookeeper.yml"
"zookeeper-kafka.yml"
)

source_dir="../tdp-getting-started/tdp_vars"

for i in "${!folders[@]}"; do
    dir="${folders[$i]}"
    mkdir -p "$dir"
    IFS=" " read -ra file_arr <<< "${files[$i]}"
    for file in "${file_arr[@]}"; do
        if [[ -f "$source_dir/$dir/$file" ]]; then
            cat "$source_dir/$dir/$file" > "$dir/$file"
        else
            echo "Warning: $source_dir/$dir/$file does not exist. Skipping."
        fi
    done
done

echo "Directories and files have been created and content has been copied!"
