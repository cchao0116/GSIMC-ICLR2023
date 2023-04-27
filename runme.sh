#!/usr/bin/env bash
source activate py37

unset SPARK_HOME
export PYSPARK_PYTHON=python3
export SPARK_LOCAL_IP=127.0.0.1
export PYTHONPATH=./src  # the path of the src folder

DATA_HOME=$1  # the path of the data folder
KERNEL=Covariance

spark-submit \
  --master local[8] \
  --conf spark.eventLog.enabled=false \
  --conf spark.driver.bindAddress=127.0.0.1 \
  --conf spark.driver.cores=4 \
  --conf spark.driver.memory=50g \
  --conf spark.executor.memory=20g \
  --conf spark.driver.maxResultSize=50g \
  src/main.py --filter=BLfilter --kernel=$KERNEL \
  --reuse --rank=50 --eta=0 --scale=.7 --sugar=.7 \
  --train=file://${DATA_HOME}/train.csv \
  --test_tr=file://${DATA_HOME}/test_tr.csv \
  --test_te=file://${DATA_HOME}/test_te.csv

spark-submit \
  --master local[8] \
  --conf spark.eventLog.enabled=false \
  --conf spark.driver.bindAddress=127.0.0.1 \
  --conf spark.driver.cores=4 \
  --conf spark.driver.memory=50g \
  --conf spark.executor.memory=4g \
  --conf spark.driver.maxResultSize=50g \
  src/main.py --filter=TRfilter --kernel=$KERNEL \
  --reuse --rank=0 --eta=0 --scale=.7 --sugar=.7 \
  --train=file://${DATA_HOME}/train.csv \
  --test_tr=file://${DATA_HOME}/test_tr.csv \
  --test_te=file://${DATA_HOME}/test_te.csv

spark-submit \
  --master local[8] \
  --conf spark.eventLog.enabled=false \
  --conf spark.driver.bindAddress=127.0.0.1 \
  --conf spark.driver.cores=4 \
  --conf spark.driver.memory=50g \
  --conf spark.executor.memory=4g \
  --conf spark.driver.maxResultSize=50g \
  src/main.py --filter=LDPfilter --kernel=$KERNEL \
  --reuse --rank=50 --eta=0 --scale=.7 --sugar=.7 \
  --train=file://${DATA_HOME}/train.csv \
  --test_tr=file://${DATA_HOME}/test_tr.csv \
  --test_te=file://${DATA_HOME}/test_te.csv

spark-submit \
  --master local[8] \
  --conf spark.eventLog.enabled=false \
  --conf spark.driver.bindAddress=127.0.0.1 \
  --conf spark.driver.cores=4 \
  --conf spark.driver.memory=50g \
  --conf spark.executor.memory=4g \
  --conf spark.driver.maxResultSize=50g \
  src/main.py --filter=LRwfilter --kernel=$KERNEL \
  --reuse --rank=50 --eta=0 --scale=.7 --sugar=.7 \
  --train=file://${DATA_HOME}/train.csv \
  --test_tr=file://${DATA_HOME}/test_tr.csv \
  --test_te=file://${DATA_HOME}/test_te.csv

spark-submit \
  --master local[8] \
  --conf spark.eventLog.enabled=false \
  --conf spark.driver.bindAddress=127.0.0.1 \
  --conf spark.driver.cores=4 \
  --conf spark.driver.memory=50g \
  --conf spark.executor.memory=4g \
  --conf spark.driver.maxResultSize=50g \
  src/main.py --filter=LICfilter --kernel=$KERNEL \
  --reuse --rank=50 --eta=0 --scale=.7 --sugar=.7 \
  --train=file://${DATA_HOME}/train.csv \
  --test_tr=file://${DATA_HOME}/test_tr.csv \
  --test_te=file://${DATA_HOME}/test_te.csv

conda deactivate
