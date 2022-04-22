alias d='docker'
alias dc='log_and_run_command docker-compose'
alias drm='log_and_run_command docker-rm'
alias dcl='docker-clean'
alias dcd='dc down'
alias dcb='dc build'
alias db='dc up -d db'

# Produce a .env file from the Docker Compose environment config of the dev service
dc-env() {
  ruby -r yaml -e '
    YAML
      .load_file(Dir.glob("docker-compose.y*ml")[0])
      .fetch("services")
      .fetch("dev")
      .fetch("environment")
      .map do |k,v|
        val =
          v
            .to_s
            .gsub(/\${[^-]*-(.*)}/, "\\1")
            .gsub("/work/", "")
        (val.length == 0 ? "# " : "") + [k, val].join("=")
      end
      .compact
      .join("\n")
      .then(&method(:puts))
  ' | tee -a .env
}
