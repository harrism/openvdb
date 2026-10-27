// Copyright Contributors to the OpenVDB Project
// SPDX-License-Identifier: Apache-2.0

// GridHandle over a device buffer in a .cu file compiled by nvcc WITHOUT --extended-lambda (see CMakeLists.txt):
// expected to stop at the static_assert in nanovdb/GridHandle.h that names the missing flag.

#include <nanovdb/cuda/DeviceBuffer.h>
#include <nanovdb/tools/CreatePrimitives.h>

void createDeviceSphere()
{
    auto handle = nanovdb::tools::createLevelSetSphere<float, nanovdb::cuda::DeviceBuffer>(10.0);
    handle.deviceUpload();
}
