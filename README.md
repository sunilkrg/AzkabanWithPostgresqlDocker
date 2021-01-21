# AzkabanWithPostgresqlDocker

##Prerequisites
1. Have docker environment in your system
2. Have alpine java 8 image or any other base image with 0 vulnerability in your image

##Steps
Follow the steps in the respective blog : https://codeogeek.medium.com/apache-azkaban-with-postgresql-c167469ac127
1. Update the Dockerfile with the base image URL
2. Build the docker image with docker build -t <registry_url_for_image> .
3. Push your image in the registry
4. Add configmap if needed else update the configuration files of executor and web placed at azkaban_service/azkaban/azkaban-exec/conf/azkaban.properties and azkaban_service/azkaban/azkaban-web/conf/azkaban.properties
5. Update the deployment file as per your requirement and run your image.


