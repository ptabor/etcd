module github.com/ptabor/etcd/etcdctl/v3

go 1.15

require (
	github.com/bgentry/speakeasy v0.1.0
	github.com/dustin/go-humanize v1.0.0
	github.com/gogo/protobuf v1.3.1
	github.com/olekukonko/tablewriter v0.0.4
	github.com/ptabor/etcd/api/v3 v3.5.0-alpha.22
	github.com/ptabor/etcd/client/v2 v2.305.0-alpha.22
	github.com/ptabor/etcd/client/v3 v3.5.0-alpha.22
	github.com/ptabor/etcd/pkg/v3 v3.5.0-alpha.22
	github.com/ptabor/etcd/raft/v3 v3.5.0-alpha.22
	github.com/ptabor/etcd/server/v3 v3.5.0-alpha.22
	github.com/spf13/cobra v1.1.1
	github.com/spf13/pflag v1.0.5
	github.com/urfave/cli v1.22.4
	go.etcd.io/bbolt v1.3.5
	go.uber.org/zap v1.16.0
	golang.org/x/time v0.0.0-20200630173020-3af7569d3a1e
	google.golang.org/grpc v1.29.1
	gopkg.in/cheggaaa/pb.v1 v1.0.28
)

replace (
	github.com/ptabor/etcd/api/v3 => ../api
	github.com/ptabor/etcd/client/v2 => ../client/v2
	github.com/ptabor/etcd/client/v3 => ../client/v3
	github.com/ptabor/etcd/pkg/v3 => ../pkg
	github.com/ptabor/etcd/raft/v3 => ../raft
	github.com/ptabor/etcd/server/v3 => ../server
//	github.com/ptabor/etcd/v3 => ../
)

// Bad imports are sometimes causing attempts to pull that code.
// This makes the error more explicit.
replace (
	github.com/ptabor/etcd => ./FORBIDDEN_DEPENDENCY
	go.etcd.io/tests/v3 => ./FORBIDDEN_DEPENDENCY
)
