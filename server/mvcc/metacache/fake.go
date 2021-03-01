// Copyright 2015 The etcd Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package metacache

import (
	"sync/atomic"

	"go.etcd.io/etcd/server/v3/mvcc/backend"
)

func NewFakeConsistentIndex(index uint64) RaftMetadataCache {
	return &fakeConsistentIndex{index: index}
}

type fakeConsistentIndex struct{ index uint64 }

func (f *fakeConsistentIndex) ConsistentIndex() uint64 { return f.index }

func (f *fakeConsistentIndex) SetConsistentIndex(index uint64) {
	atomic.StoreUint64(&f.index, index)
}

func (f *fakeConsistentIndex) UnsafeSave(tx backend.BatchTx) {}
func (f *fakeConsistentIndex) SetBatchTx(tx backend.BatchTx) {}
