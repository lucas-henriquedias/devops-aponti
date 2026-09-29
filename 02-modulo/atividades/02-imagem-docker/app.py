from http.server import BaseHTTPRequestHandler, HTTPServer


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write("Olá! Meu app Python está rodando em um container Docker.".encode("utf-8"))


if __name__ == "__main__":
    print("Servidor rodando na porta 8000...", flush=True)
    # 0.0.0.0 permite que o container aceite conexões vindas de fora dele
    HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
