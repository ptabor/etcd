package endpoints

import (
	"context"
	"fmt"

	clientv3 "go.etcd.io/etcd/client/v3"
	"go.etcd.io/etcd/client/v3/naming/endpoints/internal"
)

type endpointManager struct {
	// TODO: To be implemented ...
}

func NewManager(client *clientv3.Client, target string) Manager {
	// To be implemented ...
	return &endpointManager{ /*TODO*/ }
}

func (m *endpointManager) Update(ctx context.Context, updates []*UpdateWithOpts) error {
	// TODO: For loop in a single transaction
	internalUpdate := &internal.Update{} // translate UpdateWithOpts into json format.
	switch internalUpdate.Op {
	//case internal.Add:
	//	var v []byte
	//	if v, err = json.Marshal(internalUpdate); err != nil {
	//		return status.Error(codes.InvalidArgument, err.Error())
	//	}
	//	_, err = gr.Client.KV.Put(ctx, target+"/"+nm.Addr, string(v), opts...)
	//case internal.Delete:
	//	_, err = gr.Client.Delete(ctx, target+"/"+nm.Addr, opts...)
	//default:
	//	return status.Error(codes.InvalidArgument, "naming: bad naming op")
	}
	return nil
}

func (m *endpointManager) AddEndpoint(ctx context.Context, key string, endpoint Endpoint, opts ...clientv3.OpOption) error {
	return m.Update(ctx, []*UpdateWithOpts{NewAddUpdateOpts(key, endpoint, opts...)})
}

func (m *endpointManager) DeleteEndpoint(ctx context.Context, key string, opts ...clientv3.OpOption) error {
	return m.Update(ctx, []*UpdateWithOpts{NewDeleteUpdateOpts(key, opts...)})
}

func (m *endpointManager) NewWatchChanel(ctx context.Context) (WatchChannel, error) {
	return nil, fmt.Errorf("Not implemented yet")

	// TODO: Implementation inspired by:
	// Next gets the next set of updates from the etcd resolver.
	//// Calls to Next should be serialized; concurrent calls are not safe since
	//// there is no way to reconcile the update ordering.
	//func (gw *gRPCWatcher) Next() ([]*naming.Update, error) {
	//	if gw.wch == nil {
	//		// first Next() returns all addresses
	//		return gw.firstNext()
	//	}
	//	if gw.err != nil {
	//		return nil, gw.err
	//	}
	//
	//	// process new events on target/*
	//	wr, ok := <-gw.wch
	//	if !ok {
	//		gw.err = status.Error(codes.Unavailable, ErrWatcherClosed.Error())
	//		return nil, gw.err
	//	}
	//	if gw.err = wr.Err(); gw.err != nil {
	//		return nil, gw.err
	//	}
	//
	//	updates := make([]*naming.Update, 0, len(wr.Events))
	//	for _, e := range wr.Events {
	//		var jupdate naming.Update
	//		var err error
	//		switch e.Type {
	//		case etcd.EventTypePut:
	//			err = json.Unmarshal(e.Kv.Value, &jupdate)
	//			jupdate.Op = naming.Add
	//		case etcd.EventTypeDelete:
	//			err = json.Unmarshal(e.PrevKv.Value, &jupdate)
	//			jupdate.Op = naming.Delete
	//		default:
	//			continue
	//		}
	//		if err == nil {
	//			updates = append(updates, &jupdate)
	//		}
	//	}
	//	return updates, nil
	//}
	//
	//func (gw *gRPCWatcher) firstNext() ([]*naming.Update, error) {
	//	// Use serialized request so resolution still works if the target etcd
	//	// server is partitioned away from the quorum.
	//	resp, err := gw.c.Get(gw.ctx, gw.target, etcd.WithPrefix(), etcd.WithSerializable())
	//	if gw.err = err; err != nil {
	//		return nil, err
	//	}
	//
	//	updates := make([]*naming.Update, 0, len(resp.Kvs))
	//	for _, kv := range resp.Kvs {
	//		var jupdate naming.Update
	//		if err := json.Unmarshal(kv.Value, &jupdate); err != nil {
	//			continue
	//		}
	//		updates = append(updates, &jupdate)
	//	}
	//
	//	opts := []etcd.OpOption{etcd.WithRev(resp.Header.Revision + 1), etcd.WithPrefix(), etcd.WithPrevKV()}
	//	gw.wch = gw.c.Watch(gw.ctx, gw.target, opts...)
	//	return updates, nil
	//}
}

func (m *endpointManager) List(ctx context.Context) (Key2EndpointMap, error) {
	// TODO: Implementation
	return nil, nil
}
