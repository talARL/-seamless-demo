#!/bin/bash
if [ "$#" -ne 1 ]; then
	echo "Choose a Version of jupyter, and run \'./prerequisites.bash version\'"
	echo "Exiting..."
	exit 0
fi
# Assuming that a jupyter-notebook is installed.
# installing apache-toree (only scala kernel)
pip install --upgrade pip  # upgrade pip
# pip install toree
# jupyter toree install --spark_home=/opt/apache/pushdown/spark
version="$1"

if [[ $version == '4.0' ]] || [[ $version == '4.1' ]]; then
	# install jupyter-incubator/jupyter_dashboards
	# github: https://github.com/jupyter-incubator/dashboards
	# goal: Arranging notebook outputs in a grid- or report-like layout
	# this matches jupyters version 4.0.x or 4.1.x
	# for version 4.2.x check: http://jupyter-dashboards-layout.readthedocs.io/en/latest/getting-started.html
	pip install jupyter_dashboards
	jupyter dashboards install --user --symlink --overwrite
	jupyter dashboards activate
	#jupyter dashboards deactivate

	# installing jupyter-incubator/contentmanagement
	# github: https://github.com/jupyter-incubator/contentmanagement
	# goal: prerequisites for dashboards_bundlers
	# this matches jupyters version 4.0.x or 4.1.x
	# for version 4.2.x check: https://github.com/jupyter-incubator/contentmanagement
	pip install jupyter_cms
	jupyter cms install --user --symlink --overwrite
	jupyter cms activate
	#jupyter cms deactivate

	# install jupyter-incubator/dashboards_bundlers
	# goal: Bundling notebooks and associated assets for deployment as dashboards
	# this matches jupyters version 4.0.x or 4.1.x
	# for version 4.2.x check: https://github.com/jupyter-incubator/dashboards_bundlers
	pip install jupyter_dashboards_bundlers
	jupyter dashboards_bundlers activate

	# install npm and node if necessary
	sudo apt-get install npm
	sudo apt-get install node 


	# install jupyter-incubator/dashboards_server
	# goal: Serving notebook-defined dashboards as standalone web apps
	# check in the git for prerequisites: https://github.com/jupyter-incubator/dashboards_server
	npm install -g jupyter-dashboards-server	

	# install plotly
	# pip install plotly
	# pip install plotly --upgrade

	# install ipywidgets
	pip install ipywidgets
	jupyter nbextension enable --py --sys-prefix widgetsnbextension # needs to enable it 
																	# everytime at the beginning

	#install Bokeh with conda																
	conda install bokeh
fi
if [[ $version == '4.2' ]]; then
	pip install jupyter_dashboards
	jupyter dashboards quick-setup --sys-prefix
	
	pip install jupyter_cms
	jupyter cms quick-setup --sys-prefix
	
	pip install jupyter_dashboards_bundlers
	jupyter dashboards_bundlers quick-setup --sys-prefix
	
	sudo apt-get install npm
	sudo apt-get install node
	
	npm install -g jupyter-dashboards-server
	
	pip install ipywidgets
	jupyter nbextension enable --py --sys-prefix widgetsnbextension
	
	#install Bokeh with conda																
	conda install bokeh
	
else
	echo "No Version" $1 "for jupyter"
fi
