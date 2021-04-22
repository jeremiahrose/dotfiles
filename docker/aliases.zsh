alias d='docker'
alias dc='docker-compose'
alias drm='docker-rm'
alias dcl='docker-clean'
alias dcd='dc down'
alias dcb='dc build'
alias db='dc up -d db'

# Produce a .env file from the Docker Compose environment config of the dev service
dc-env() {
  ruby -r yaml -e 'puts YAML.load_file(Dir.glob("docker-compose.y*ml")[0]).fetch("services").fetch("dev").fetch("environment").map { |k,v| val = v.to_s.gsub(/\${.*-(.*)}/, "\\1").gsub("/work/", ""); (val.length == 0 ? "# " : "") + [k, val].join("=") }.compact.join("\n")' >> .env
}
