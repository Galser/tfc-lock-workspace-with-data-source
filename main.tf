variable "todo_id" {
  type    = number
  default = 1
}

variable "api_timeout" {
  type    = number
  default = 1200
}

variable "safety_gap" {
  type    = number
  description = "Safety gap in milliseconds , we can make it negative to...fail on timeout"
  default = -1
}

data "http" "this" {
#  url             = "https://jsonplaceholder.typicode.com/todos/${var.todo_id}"
  url             = "https://httpstat.us/200?sleep=${var.api_timeout}"
  request_headers = {
    Accept        = "application/json"
  }
 request_timeout_ms = var.api_timeout*60+var.safety_gap
}

output "todo" {
  value = data.http.this.body
}
