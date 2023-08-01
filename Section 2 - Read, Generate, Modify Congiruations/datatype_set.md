## Basics of List
- Lists are used to store multiple items in a single variable
- List items are ordered, changeable, and allow duplicate values
- List items are indexed, the first item has index[0], the second item has index[1]

```sh
variable "iam_names" {
  type = list
  default = ["user-01", "user-02", "user-03"]
}
```


## SET
- SET is used to store multiple items in a single variable
- SET items are unordered and no duplicates allowed
- toset function convert the list of values to SET
