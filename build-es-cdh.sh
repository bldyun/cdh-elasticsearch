#!/bin/bash
THIS_SCRIPT=$(realpath $(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)/$(basename ${BASH_SOURCE:-$0}))
#automatic detection TOPDIR
SCRIPT_DIR=$(dirname $(realpath ${THIS_SCRIPT}))
TMPDIR=${SCRIPT_DIR}/bld
mkdir -p ${TMPDIR}
ES_URL=https://mirrors.huaweicloud.com/elasticsearch/7.7.1/elasticsearch-7.7.1-linux-x86_64.tar.gz
ES=$(basename ${ES_URL})
wget -c -O ${TMPDIR}/${ES} ${ES_URL}

cd ${SCRIPT_DIR}/elasticsearch-parcel
#POINT_VERSION=6 VALIDATOR_DIR=${SCRIPT_DIR}/cm_ext OS_VER=el7 PARCEL_NAME=ElasticSearch ./build-parcel.sh ${TMPDIR}/${ES}
VALIDATOR_DIR=${SCRIPT_DIR}/cm_ext CSD_NAME=ElasticSearch ./build-csd.sh
cd ${SCRIPT_DIR}

# for f in ELASTICSEARCH-1.0.jar;do curl -u 'user:pass'  http://119.27.176.95:11111/repository/parcel-custom/elasticsearch/7.7.1/${f}  --upload-file ${f} -v ;done
