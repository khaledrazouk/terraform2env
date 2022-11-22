variable "global" {
  type = object({ naming = map(string), config = map(string) })
}