project = "gcr-nodejs"

app "gcr-nodejs" {
  labels = {
    "service" = "gcr-nodejs",
    "env"     = "dev"
  }

  build {
    use "pack" {
      builder = "gcr.io/buildpacks/builder:v1"
    }

    registry {
      use "docker" {
        image = "gcr.io/se-kabu/gcr-nodejs"
        tag   = "latest"
      }
    }
  }

  deploy {
    use "google-cloud-run" {
      project  = "se-kabu"
      location = "us-east1"

      port = 5000

      static_environment = {
        "NAME" : "World"
      }

      capacity {
        memory                     = 128
        cpu_count                  = 1
        max_requests_per_container = 10
        request_timeout            = 300
      }

      auto_scaling {
        max = 2
      }
    }
  }

  release {
    use "google-cloud-run" {}
  }
}