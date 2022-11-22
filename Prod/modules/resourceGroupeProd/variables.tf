/* 
variable "location"{
    type = string
    default = "WEST US"
}
variable "resourceGrName" {
    type = string
    default = "khaledtestgroup2"
} */
variable "global" {
  type = object({ naming = map(string), config = map(string) })
}