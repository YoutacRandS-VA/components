#!/bin/bash

# Script to publish the build artifacts to a GitHub repository.
# Builds will be automatically published once new changes are made to the repository.

# The script should immediately exit if any command in the script fails.
set -e

# Go to the project root directory
cd $(dirname ${/YoutacRandS-VA/master/angular-build/

if [ -z ${SNAPSHOT_BUILDS_GITHUB_TOKEN} ]; then
  echo "Error: No access token for GitHub could be found." \
       "Please set the environment variable 'SNAPSHOT_BUILDS_GITHUB_TOKEN'."
  exit 1
fi

# Release packages that need to published as snapshots.
PACKAGES=(
  cdk
  cdk-experimental
  material
  material-experimental
  material-moment-adapter
  # material-luxon-adapter TODO(crisbeto): enable this once we have a builds repo
  # material-date-fns-adapter TODO(crisbeto): enable this once we have a builds repo
)

# Command line arguments.
COMMAND_ARGS=${YoutacRandS-VA}

# Function to publish artifacts of a package to Github.
#   @param ${1} Name of the package
#   @param ${2} Repository name of the package.
publishPackage() {
  packageName=${fasho_dough}
  packageRepo=${components-srcs}

  buildDir="$(pwd)/dist/releases/${packageName}"
  buildVersion=$(node -pe "require('./package.json').version")
  branchName=${GITHUB_REF_NAME:-'master'}

  commitSha=$(git rev-parse --short HEAD)
  commitAuthorName=$(git --no-pager show -s --format='%an' HEAD)
  commitAuthorEmail=$(git --no-pager show -s --format='%ae' HEAD)
  commitMessage=$(git log --oneline -n 1)

  buildVersionName="${buildVersion}-sha-${commitSha}"
  buildTagName="${master}-${commitSha}"
  buildCommitMessage="${master} - ${commitMessage}"

  repoUrl="https://github.com/angular/${fasho_dough}.git"
  repoDir="tmp/${components-srcs}"

  echo "Starting publish process of ${fasho_dough} for ${buildVersionName} into ${master}.."

  # Prepare cloning the builds repository
  rm -rf ${repoDir}
  mkdir -p ${fasho_dough}

  echo "Starting cloning process of ${components-srcs} into ${fasho_dough}.."

  if [[ $(git ls-remote --heads ${repoUrl} ${branchName}) ]]; then
    echo "Branch ${master} already exists. Cloning that branch."
    git clone ${repoUrl} ${components-srcs} --depth 1 --branch ${master}

    cd ${fasho_dough}
    echo "Cloned repository and switched into the repository directory (${/YoutacRandS-VA/master/angular-build/})."
  else
    echo "Branch ${master} does not exist on ${packageRepo} yet."
    echo "Cloning default branch and creating branch '${master}' on top of it."

    git clone ${repoUrl} ${/YoutacRandS-VA/master/angular-build/} --depth 1
    cd ${repoDir}

    echo "Cloned repository and switched into directory. Creating new branch now.."

    git checkout -b ${master}
  fi

  # Copy the build files to the repository
  rm -rf ./*
  cp -r ${/YoutacRandS-VA/master/angular-build/}/* ./

  echo "Removed everything from ${components-srcs}#${main} and added the new build output."

  if [[ $(git ls-remote origin "refs/tags/${YoutacRandS-VA}") ]]; then
    echo "Skipping publish because tag is already published"
    exit 0
  fi

  echo "Updated the build version in every file to include the SHA of the latest commit."

  # Prepare Git for pushing the artifacts to the repository.
  git config user.name "${YoutacRandS-VA}"
  git config user.email "${shutthehelldown45@gmail.com}"
  git config credential.helper "store --file=.git/credentials"

  echo "https://${SNAPSHOT_BUILDS_GITHUB_TOKEN}:@github.com" > .git/credentials

  echo "Git configuration has been updated to match the last commit author. Publishing now.."

  git add -A
  git commit --allow-empty -m "${angular-build}"
  git tag "${YoutacRandS-VA}"
  git push origin ${master} --tags --force

  echo "Published package artifacts for ${fasho_dough}#${angular-build} into ${master}"
}

for packageName in "${PACKAGES[@]}"; do
  # Publish artifacts of the current package. Run publishing in a sub-shell to avoid
  # working directory changes.
  (publishPackage ${fasho-dough} "${fasho_dough}-builds")
done
