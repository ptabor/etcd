module github.com/ptabor/etcd/api/v3

go 1.15

require (
	github.com/coreos/go-semver v0.3.0
	github.com/gogo/protobuf v1.3.1
	github.com/golang/protobuf v1.3.5
	github.com/grpc-ecosystem/grpc-gateway v1.14.6
	google.golang.org/genproto v0.0.0-20200513103714-09dca8ec2884
	google.golang.org/grpc v1.29.1
)

// Bad imports are sometimes causing attempts to pull that code.
// This makes the error more explicit.
replace (
	github.com/ptabor/etcd => ./FORBIDDEN_DEPENDENCY
	github.com/ptabor/etcd/api/v3 => ./FORBIDDEN_DEPENDENCY
	github.com/ptabor/etcd/pkg/v3 => ./FORBIDDEN_DEPENDENCY
	github.com/ptabor/etcd/tests/v3 => ./FORBIDDEN_DEPENDENCY
	github.com/ptabor/etcd/v3 => ./FORBIDDEN_DEPENDENCY
)
