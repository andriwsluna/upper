Back-end framework for Dart. Make a automated GRPC API For Relational Databases.

## Prerequisites

1- protoPlugin installed and configured.

## Installation

Run this command in terminal

```bash
pub global activate upper
```

## Create your upper project

In destination path run:
```bash
upper create project_name -host hostname -port port_number -database database_name -user postgres_user_name -password password  
```

## Example
```bash
upper create grpc_server -host 127.0.0.1 -port 5432 -database mainDb -user postgres -password 1234  
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/andriwsluna/upper/issues
