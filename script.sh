#!/bin/bash
#this is a simple script to fix the elasticsearch pending status for securityonion 2.4 up to .90
#pulls the replicated shards that cause the pending status and creates a list to be iterated on
for i in $(sudo so-elasticsearch-query _cat/shards | grep UN | awk '{print $1}'); 
	#de-replicates the shards
	do sudo so-elasticsearch-query $i/_settings -d '{"number_of_replicas":0}' -XPUT
	done;
	
