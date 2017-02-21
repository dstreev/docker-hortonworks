d# Build Container
`docker build --tag dstreev/local-repo .`

# Run Container in detached Mode.
> Mount repo directory
> Redirect Exposed Port
> The --rm will remove the container when is shuts down.
`docker run -it --rm --name repo -v /Users/dstreev/projects/local_repo:/www:ro -p 127.0.0.1:80:80 -d dstreev/local-repo`

# Check the Redirected Port
`docker port repo`

# Login to the Container
`docker exec -it repo /bin/bash`


