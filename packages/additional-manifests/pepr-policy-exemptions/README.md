Due to an upstream bug ([tracked here](https://github.com/defenseunicorns/pepr/issues/745)) in pepr, each exemption needs to be installed sequentially 1 at a time and the easiest way to do that is separate zarf files.

TODO - track progress against that issue, and return the nutanix-csi-exemption to the parent additional-manifests zarf package when the issue is resolved.