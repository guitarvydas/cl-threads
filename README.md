An example to show green-thread multi-tasking using closures.

(This is what an O/S does, but using assembler to create closures.  We don't need to know if SBCL uses assembler to create closures.)

The code should appear to be painfully simple.

to start the example:

(cl-threads:@main)

to stop the example: 

(cl-threads:kill-example)


N.B. "@" is legal character in identifiers for CL.  I use the following convention: any ident that begins with "@" is "architectural" (top-level) code.  Everything else is implementation.  "-" is also a legal character in CL - I use it to subsume CamelCase and underscores.

N.B. This code probably can't be used directly for production, but, I hope that it inspires Concurrent Design (see Rob Pike's "Concurrency is not Parallelism").


