# Aggregate Functions

Aggregate functions are functions that define an operation which consumes values from multiple records to a produce a single output. Aggregate functions in SQL are typically used in GROUP BY functions. Aggregate functions are similar to scalar functions and function signatures with a small set of different properties.

Aggregate function signatures contain all the properties defined for [scalar functions](scalar_functions.md). Additionally, they contain the properties below:

| Property                 | Description                                                     | Required                        |
| ------------------------ | --------------------------------------------------------------- | ------------------------------- |
| Inherits                 | All properties defined for scalar function.                     | N/A                             |
| Ordered                  | Whether the result of this function is sensitive to sort order. | Optional, defaults to false     |
| Maximum set size         | Maximum allowed set size as an unsigned integer.                | Optional, defaults to unlimited |
| Decomposable             | Whether the function can be executed in one or more intermediate steps. Valid options are: `NONE`, `ONE`, `MANY`, describing how intermediate steps can be taken. | Optional, defaults to `NONE`     |
| Intermediate Output Type | If the function is decomposable, represents the intermediate output type that is used, if the function is defined as either `ONE` or `MANY` decomposable. Will be a struct in many cases. | Required for `ONE` and `MANY`.      |
| Invocation               | Whether the function uses all or only distinct values in the aggregation calculation. Valid options are: `ALL`, `DISTINCT`. | Optional, defaults to `ALL`     |



## Aggregate Binding

When binding an aggregate function, the binding must include the following additional properties beyond the standard scalar binding properties:

| Property | Description                                                  |
| -------- | ------------------------------------------------------------ |
| Phase    | Describes the input type of the data: [INITIAL_TO_INTERMEDIATE, INTERMEDIATE_TO_INTERMEDIATE, INITIAL_TO_RESULT, INTERMEDIATE_TO_RESULT] describing what portion of the operation is required. For functions that are NOT decomposable, the only valid option will be INITIAL_TO_RESULT. |
| Ordering | Zero or more ordering keys along with key order (ASC\|DESC\|NULL FIRST, etc.), declared similar to the sort keys in an `ORDER BY` relational operation. If no sorts are specified, the records are not sorted prior to being passed to the aggregate function. |

