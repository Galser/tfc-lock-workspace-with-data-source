variable "todo_id" {
  type    = number
  default = 1
}

data "http" "this" {
  url             = "https://jsonplaceholder.typicode.com/todos/${var.todo_id}"
  request_headers = {
    Accept        = "application/json"
  }
 request_timeout_ms = 3000
}

output "todo" {
  value = data.http.this.body
}
