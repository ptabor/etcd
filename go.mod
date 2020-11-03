module github.com/ptabor/etcd/v3

go 1.15

replace (
	github.com/ptabor/etcd/api/v3 => ./api
	github.com/ptabor/etcd/client/v2 => ./client/v2
	github.com/ptabor/etcd/client/v3 => ./client/v3
	github.com/ptabor/etcd/etcdctl/v3 => ./etcdctl
	github.com/ptabor/etcd/pkg/v3 => ./pkg
	github.com/ptabor/etcd/raft/v3 => ./raft
	github.com/ptabor/etcd/server/v3 => ./server
	github.com/ptabor/etcd/tests/v3 => ./tests
)

require (
	github.com/bgentry/speakeasy v0.1.0
	github.com/dustin/go-humanize v1.0.0
	github.com/etcd-io/gofail v0.0.0-20190801230047-ad7f989257ca // indirect
	github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.2 // indirect
	github.com/jonboulle/clockwork v0.2.2 // indirect
	github.com/kr/pretty v0.2.1 // indirect
	github.com/kr/text v0.2.0 // indirect
	github.com/mattn/go-runewidth v0.0.9 // indirect
	github.com/olekukonko/tablewriter v0.0.4 // indirect
	github.com/prometheus/common v0.10.0 // indirect
	github.com/prometheus/procfs v0.2.0 // indirect
	github.com/ptabor/etcd/api/v3 v3.5.0-alpha.0
	github.com/ptabor/etcd/client/v2 v2.305.0-alpha.0
	github.com/ptabor/etcd/client/v3 v3.5.0-alpha.0
	github.com/ptabor/etcd/pkg/v3 v3.5.0-alpha.0
	github.com/ptabor/etcd/raft/v3 v3.5.0-alpha.0
	github.com/ptabor/etcd/tests/v3 v3.5.0-alpha.0
	github.com/sirupsen/logrus v1.7.0 // indirect
	github.com/spf13/cobra v1.1.1
	github.com/tmc/grpc-websocket-proxy v0.0.0-20200427203606-3cfed13b9966 // indirect
	github.com/urfave/cli v1.22.4 // indirect
	go.etcd.io/bbolt v1.3.5
	go.uber.org/zap v1.16.0
	golang.org/x/crypto v0.0.0-20201002170205-7f63de1d35b0 // indirect
	golang.org/x/lint v0.0.0-20200302205851-738671d3881b // indirect
	golang.org/x/net v0.0.0-20201006153459-a7d1128ccaa0 // indirect
	golang.org/x/time v0.0.0-20200630173020-3af7569d3a1e
	golang.org/x/tools v0.0.0-20201014170642-d1624618ad65 // indirect
	google.golang.org/grpc v1.29.1
	gopkg.in/cheggaaa/pb.v1 v1.0.28
	gopkg.in/yaml.v2 v2.3.0 // indirect
)
