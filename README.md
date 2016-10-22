# protoc

A prebuilt Docker container that makes it easily to generate gRPC code from
proto files.

## Usage

    docker run -v $(pwd):/build stackmachine/protoc example.proto

## Limitations

The .proto file must be in the current directory
