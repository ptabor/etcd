package endpoints

import (
	"context"

	clientv3 "go.etcd.io/etcd/client/v3"
)

// Endpoint represents a single address the connection can be established with.
//
// Inspired by: https://pkg.go.dev/google.golang.org/grpc/resolver#Address.
// Please document etcd version since which version each field is supported.
type Endpoint struct {
	// Addr is the server address on which a connection will be established.
	// Since etcd 3.1
	Addr string

	// Metadata is the information associated with Addr, which may be used
	// to make load balancing decision.
	// Since etcd 3.1
	Metadata interface{}
}

type Operation uint8
const (
	// Add indicates an Endpoint is added.
	Add Operation = iota
	// Delete indicates an existing address is deleted.
	Delete
)

type Update struct {
	Op       Operation
	Key      string
	Endpoint Endpoint
}

type Watcher interface {
	Channel() chan []Update
	Close()
}

type UpdateWithOpts struct {
	Update
	Opts []clientv3.OpOption
}

func NewAddUpdateOpts(key string, endpoint Endpoint, opts ...clientv3.OpOption) UpdateWithOpts {
	return UpdateWithOpts{Update: Update{Op: Add, Key: key, Endpoint: endpoint}, Opts: opts};
}

func NewDeleteUpdateOpts(key string, opts ...clientv3.OpOption) UpdateWithOpts {
	return UpdateWithOpts{Update: Update{Op: Delete, Key: key}, Opts: opts};
}

// Manager can be used to add/remove & inspect endpoints stored in etcd.
type Manager interface {
	//AddEndpoint(ctx context.Context, key string, endpoint Endpoint, opts ...clientv3.OpOption) error
	//RemoveEndpoint(ctx context.Context, key string) error
	Update(ctx context.Context, updates []UpdateWithOpts) error

	// Returns a mapping in format: key -> Endpoint
	List() map[string]Endpoint
	NewWatcher(ctx context.Context) Watcher
}

// ManagerAddEndpoint is a syntactic sugar to simplify registration of endpoint in etcd.
func ManagerAddEndpoint(ctx context.Context, m Manager, key string, endpoint Endpoint, opts ...clientv3.OpOption) error {
	return m.Update(ctx, []UpdateWithOpts{ NewAddUpdateOpts(key, endpoint, opts...) } )
}

// ManagerDeleteEndpoint is a syntactic sugar to simplify deletion of endpoint in etcd.
func ManagerDeleteEndpoint(ctx context.Context, m Manager, key string, opts ...clientv3.OpOption) error {
	return m.Update(ctx, []UpdateWithOpts{ NewDeleteUpdateOpts(key, opts...) } )
}


type endpointManager struct {
	// To be implemented ...
}

func NewManager(client *clientv3.Client, target string) Manager {
	// To be implemented ...
	return nil
}