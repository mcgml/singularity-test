# Singularity

## Definition file

Singularity defition file is very similar to Dockerfile. A Dockerfile can be converted to Singularity format with [spython](https://pypi.org/project/spython/) but is easy to do manually, see [docs](https://docs.sylabs.io/guides/3.8/user-guide/definition_files.html). Example python definition file [here](singularity.def)

## Build

This step requires root access so cannot be performed on HPC. Options are to use [remote builder](https://cloud.sylabs.io/builder) OR Docker on local machine. Singularity does not run natively on macos/Windows.

Build using Docker on local machine

```
docker \
run \
--privileged \
-it \
-v `pwd`:/app \
quay.io/singularity/singularity:v3.8.4 \
build /app/singularity.sif /app/singularity.def
```

## Execute

Run on BC4

```
module load apps/singularity/3.8.3
singularity exec \
~/singularity.sif \
pytest
```