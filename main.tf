variable "todo_id" {
  type    = number
  default = 1
}

data "http" "this" {
  url             = "https://jsonplaceholder.typicode.com/todos/${var.todo_id}"
  request_headers = {
    Accept        = "application/json"
  }
}

output "todo" {
  value = data.http.this.body
}
