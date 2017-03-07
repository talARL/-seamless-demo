#!/bin/bash
export SPARK_HOME=/opt/apache/pushdown/spark
export PYTHONPATH=$SPARK_HOME/python/:$SPARK_HOME/python/lib/py4j-0.9-src.zip
jupyter nbextension enable --py --sys-prefix widgetsnbextension
