#!/bin/sh

echo "=== Entrypoint for Zookeeper ==="

SCRIPT="${ZK_DIR}/bin/zkServer.sh"

echo " ## Preperties created by endpoint script
tickTime=${TICK_TIME}
initLimit=${INIT_LIMIT}
syncLimit=${SYNC_LIMIT}
dataDir=${ZK_DIR}
clientPort=${CLIENT_PORT}
" > ${ZK_DIR}/conf/zoo.cfg

if [[ ! -z ${NODES_LIST} ]] && [[ ! -z ${NODE_ID} ]]
then
    for NODE in $NODES_LIST
    do
        echo "${NODE}" >> ${ZK_DIR}/conf/zoo.cfg
    done

    echo "${NODE_ID}" >> ${ZK_DIR}/myid

    echo "= Quorum mode enable ="
    echo "Nodes: "
    echo "${NODES_LIST}"
    echo "Node ID: ${NODE_ID}"
fi

cd ${ZK_DIR}

exec java -cp zookeeper-3.4.10.jar:lib/*:conf \
org.apache.zookeeper.server.quorum.QuorumPeerMain \
conf/zoo.cfg