# Dockerfile for Apache TomEE on Rocky Linux 8

This Dockerfile sets up an Apache TomEE server running on Rocky Linux 8 with Java 11. TomEE is an application server that implements the Java EE (now Jakarta EE) specification, built on top of Apache Tomcat.

## Features:
- Base Image: Rocky Linux 8
- Installed Software:
  - Apache TomEE 8.0.15 (plus version)
  - OpenJDK 11 (Java Runtime Environment)
- Exposes port `8080` for HTTP access to TomEE
- Automatically runs TomEE on container startup

## Prerequisites:
- Docker installed on your machine. 

## Steps to Build and Run the Docker Image:

### 1. Create a Docker Image

1. Save the Dockerfile into a directory on your local machine.

2. Open a terminal and navigate to the directory containing the Dockerfile.

3. Build the Docker image using the following command:

   ```bash
   docker build -t tomee-rocky-linux .
   ```

   - `tomee-rocky-linux` is the name of the Docker image. You can change it to whatever you prefer.
   - This command will download the necessary packages, extract TomEE, and create the image.

### 2. Run a Docker Container

After successfully building the Docker image, you can run a Docker container based on the image:

1. Run the container using the following command:

   ```bash
   docker run -d -p 8080:8080 --name tomee-container tomee-rocky-linux
   ```

   - The `-d` flag runs the container in detached mode.
   - The `-p 8080:8080` flag maps port 8080 on the host to port 8080 in the container, allowing you to access TomEE via your browser.
   - The `--name tomee-container` flag names the container as `tomee-container`. You can change this name.
   - `tomee-rocky-linux` is the image name (from step 1).

2. To check if the container is running, use:

   ```bash
   docker ps
   ```

3. Now, open a web browser and navigate to:

   ```
   http://localhost:8080
   ```

   You should see the TomEE welcome page if everything is set up correctly.

### 3. Stopping and Removing the Container

If you want to stop the container, use:

```bash
docker stop tomee-container
```

To remove the container, use:

```bash
docker rm tomee-container
```

### 4. Stopping and Removing the Image

If you want to remove the image from your system, use:

```bash
docker rmi tomee-rocky-linux
```

## Notes:
- Make sure you have Docker running with the necessary permissions to build and run containers.
- This Dockerfile uses `wget` to download Apache TomEE from the official Apache mirror. You can adjust the TomEE version or URL if necessary.
- This setup runs TomEE with the default configurations. You may need to customize TomEE configuration files under `/opt/tomcat/conf` for production use.
