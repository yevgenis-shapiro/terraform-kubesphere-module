
resource "helm_release" "kubesphere" {
  name             = "kubesphere"
  repository       = "https://charts.kubesphere.io/main"
  chart            = "ks-core"
  namespace        = "kubesphere-system"
  create_namespace = true
  force_update     = true
  wait             = true
  timeout          = 300
  

  values = [
    <<EOT

  serviceMonitor:
    enabled: false
  jmx:
    enabled: true

EOT
  ]
}

resource "null_resource" "wait_for_kafka" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the kafka pods to start...\n"
      sleep 5
      until kubectl wait -n ${helm_release.kafka.namespace} --for=condition=Ready pods --all; do
        sleep 2
      done  2>/dev/null
    EOF
  }

  depends_on = [helm_release.kafka]
}
