project = "nomad-nodejs"

app "nomad-nodejs" {

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "gcr.io/se-kabu/example-nodejs"
        tag = "1"
        local = false
      }
    }
  }

  deploy {
    use "nomad" {
      datacenter = "dc1"
      service_port = 5000
    }
  }
}