resource "local_file" "exemplo" {
    filename = "exemplo.txt"
    content = var.conteudo
}

data "local_file" "conteudo-exemplo" {
    filename = "exemplo.txt"
}

output "data-source-result" {
    value = data.local_file.conteudo-exemplo.content
}

variable "conteudo" { 
    type = string
    default = "hello world"
}

output "id-do-arquivo" {
    value = resource.local_file.exemplo.id
}

output "conteudo" {
    value = var.conteudo
}