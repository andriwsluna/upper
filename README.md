# What is upper?
Upper is a open source back-end framework based on the Dart language.

With it, it is possible to automatically generate a gRPC API for your Postgres database.
Your application can run in `monolithic mode` or `microservices mode`.
 
In addition, you choose whether to deploy on a server itself or in `serverless mode` (G Cloud Run).

# What is gRPC?
gRPC is a modern open source high performance Remote Procedure Call (RPC) framework that can run in any environment. It can efficiently connect services in and across data centers with pluggable support for load balancing, tracing, health checking and authentication. It is also applicable in last mile of distributed computing to connect devices, mobile applications and browsers to backend services.

# How upper works?

You pass the connection parameters to your Postgres database and the framework creates a project with an entry point for each table in your database. Each entry point provides methods for basic data operations (CRUD).

# What is these operations?
* get
* select
* insert
* update
* delete

# With the project created, what do you need to do?
Nothing, only run the `server.dart`

# Is Upper ready for production?
Not yet. But we are working on it.

# Can I use Upper in production?
Yes, at your risk. Most operations with basic data types will work without a problem. But with complex data types (Array e.g.) bugs can occur.

[Quick start](https://github.com/andriwsluna/upper/wiki/Quick-start)
