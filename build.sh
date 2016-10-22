#!/bin/bash
BUILD=/build/gen
mkdir -p $BUILD/python $BUILD/java $BUILD/go $BUILD/node $BUILD/ruby
cd /build
/usr/local/bin/protoc \
	-I /usr/local/include/protobuf/ \
	-I . \
	--python_out=$BUILD/python --grpc_python_out=$BUILD/python \
	--plugin=protoc-gen-grpc_python=/usr/local/bin/grpc_python_plugin \
	--ruby_out=$BUILD/ruby --grpc_ruby_out=$BUILD/ruby \
	--plugin=protoc-gen-grpc_ruby=/usr/local/bin/grpc_ruby_plugin \
	--js_out=import_style=commonjsbinary:$BUILD/node --grpc_js_out=$BUILD/node \
	--plugin=protoc-gen-grpc_js=/usr/local/bin/grpc_node_plugin \
	--go_out=plugins=grpc:$BUILD/go \
	--java_out=$BUILD/java --grpc_java_out=$BUILD/java \
	--plugin=protoc-gen-grpc_java=/usr/local/bin/grpc_java_plugin \
	$@
