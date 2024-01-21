# bethcimini/docker-notebook-demo:latest
# docker build -t bethcimini/docker-notebook-demo:latest .
# docker run -it --rm -p 127.0.0.1:8888:8888 bethcimini/docker-notebook-demo:latest
# docker push bethcimini/docker-notebook-demo:latest

# Define an image to start from. This contains some model or program you are interested in
FROM cellprofiler/cellprofiler:4.2.6

# Install jupyter notebook .
# If you worry there are conflicting dependencies, you can pin this to a version from around when your container was made
# But that will assume all the pins are nicely pinned, which you may not be able to assume
RUN python -m pip install notebook

# Expose port 8888. You CAN do this from the command line, but it makes it possible to run entirely in the app
EXPOSE 8888

# Move to the root of the container. This will make it easier to get to your data in the Juptyer interface
WORKDIR /

# Override whatever the default command is in order to run jupyter
ENTRYPOINT ["jupyter"]

# Run the app. Will be accessible at http://localhost:8888/
CMD ["notebook" , "--allow-root", "--ip", "0.0.0.0"]
