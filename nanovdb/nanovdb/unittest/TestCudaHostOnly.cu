// Copyright Contributors to the OpenVDB Project
// SPDX-License-Identifier: Apache-2.0

// Host-only code in a .cu file: compiled by nvcc WITHOUT --extended-lambda (see CMakeLists.txt),
// since the host headers below include their CUDA counterparts only when extended lambdas are enabled.

#include <nanovdb/NanoVDB.h>
#include <nanovdb/NodeManager.h>
#include <nanovdb/io/IO.h>
#include <nanovdb/tools/CreateNanoGrid.h>
#include <nanovdb/tools/CreatePrimitives.h>
#include <nanovdb/tools/GridChecksum.h>
#include <nanovdb/tools/GridValidator.h>

int main()
{
    nanovdb::tools::build::Grid<float> srcGrid(0.0f);
    srcGrid.tree().setValue(nanovdb::Coord(1, 2, 3), 1.0f);
    auto handle = nanovdb::tools::createNanoGrid(srcGrid);
    auto *grid = handle.grid<float>();
    nanovdb::tools::updateChecksum(grid, nanovdb::CheckMode::Full);
    auto mgrHandle = nanovdb::createNodeManager(*grid);
    return mgrHandle.mgr<float>()->leafCount() == 1 && nanovdb::tools::isValid(grid, nanovdb::CheckMode::Full) ? 0 : 1;
}
