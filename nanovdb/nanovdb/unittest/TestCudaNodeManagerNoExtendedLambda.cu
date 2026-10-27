// Copyright Contributors to the OpenVDB Project
// SPDX-License-Identifier: Apache-2.0

// Device NodeManager in a .cu file compiled by nvcc WITHOUT --extended-lambda (see CMakeLists.txt):
// expected to stop at the #error in nanovdb/cuda/NodeManager.cuh that names the missing flag.

#include <nanovdb/NanoVDB.h>
#include <nanovdb/cuda/NodeManager.cuh>

void createDeviceNodeManager(const nanovdb::NanoGrid<float> *d_grid)
{
    auto handle = nanovdb::cuda::createNodeManager(d_grid);
}
