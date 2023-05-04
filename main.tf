terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.89.0"
    }
  }
}

resource "yandex_kubernetes_node_group" "workers_group" {
  cluster_id  = var.cluster_id
  name        = var.name
  description = "description"
  version = var.k8s_version

  labels = {
    owner = "boangri"
    type  = "worker"
  }

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat                = true
      subnet_ids         = var.subnet_ids
    }

    resources {
      memory = var.memory
      cores  = var.cores
    }

    boot_disk {
      type = "network-hdd"
      size = var.disk_size
    }

    scheduling_policy {
      preemptible = false
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.nodes
    }
  }

  # allocation_policy {
  #   location {
  #     zone = "ru-central1-a"
  #   }
  #   location {
  #     zone = "ru-central1-b"
  #   }
  #   location {
  #     zone = "ru-central1-c"
  #   }
  # }

  # maintenance_policy {
  #   auto_upgrade = true
  #   auto_repair  = true

  #   maintenance_window {
  #     day        = "monday"
  #     start_time = "1:00"
  #     duration   = "3h"
  #   }

  #   maintenance_window {
  #     day        = "friday"
  #     start_time = "1:00"
  #     duration   = "4h30m"
  #   }
  # }
}
