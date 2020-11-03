module github.com/ptabor/etcd/client/v2

go 1.15

require (
	github.com/json-iterator/go v1.1.10
	github.com/modern-go/reflect2 v1.0.1
	github.com/ptabor/etcd/api/v3 v3.0.0-00010101000000-000000000000
	github.com/ptabor/etcd/pkg/v3 v3.0.0-00010101000000-000000000000
)

replace (
	github.com/ptabor/etcd/api/v3 => ../../api
	github.com/ptabor/etcd/pkg/v3 => ../../pkg
)

// Bad imports are sometimes causing attempts to pull that code.
// This makes the error more explicit.
replace (
	go.etcd.io/etcd => ./FORBIDDEN_DEPENDENCY
	github.com/ptabor/etcd/v3 => ./FORBIDDEN_DEPENDENCY
	go.etcd.io/tests/v3 => ./FORBIDDEN_DEPENDENCY
)
