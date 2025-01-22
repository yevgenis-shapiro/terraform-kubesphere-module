![20200410130334](https://github.com/user-attachments/assets/2e52e7dc-f60d-4679-9e7f-d56ad5f07dee)



## Terraform Module - Kubesphere  | ⭐⭐⭐
KubeSphere is a distributed operating system for cloud-native application management, using Kubernetes as its kernel. It provides a plug-and-play architecture, allowing third-party applications to be seamlessly integrated into its ecosystem. KubeSphere is also a multi-tenant container platform with full-stack automated IT operation and streamlined DevOps workflows. It provides developer-friendly wizard web UI, helping enterprises to build out a more robust and feature-rich platform, which includes most common functionalities needed for enterprise Kubernetes strategy.


🚀  Key Features
```
✅ Provisioning Kubernetes Cluster
✅ Kubernetes Multi-cluster Management
✅ Kubernetes DevOps
✅ Cloud Native Observability
✅ Service Mesh (Istio )
✅ App Store
✅ Edge Computing Platform
✅ Metering and Billing
✅ Support Multiple Storage and Networking Solutions
✅ Multi-tenancy
✅ GPU Workloads Scheduling and Monitoring
```


🎯 Focus :
```
```

🔨 Integration :
```
# AWS
# Google
# Azure
# On-Premise
# Oracle OCI
# DigitalOcean
# Equinix
# RackSpace
# SofLayer
```

🧩 Config 
```
---
apiVersion: installer.kubesphere.io/v1alpha1
kind: ClusterConfiguration
metadata:
  name: ks-installer
  namespace: kubesphere-system
  labels:
    version: v3.4.0
spec:
  persistence:
    storageClass: ""       
  authentication:
    # adminPassword: ""    
    jwtSecret: ""
 jwtSecret" on the Host Cluster.
  local_registry: ""        
#  dev_tag: ""              
  etcd:
    monitoring: false      
    endpointIps: localhost 
    port: 2379              
    tlsEnable: true
  common:
    core:
      console:
        enableMultiLogin: true  
        port: 30880
        type: NodePort
    # apiserver:           
    #  resources: {}
    # controllerManager:
    #  resources: {}
    redis:
      enabled: false
      enableHA: false
      volumeSize: 2Gi # Redis PVC size.
    openldap:
      enabled: false
      volumeSize: 2Gi   # openldap PVC size.
    minio:
      volumeSize: 20Gi # Minio PVC size.
    monitoring:
      # type: external   
      endpoint: http://prometheus-operated.kubesphere-monitoring-system.svc:9090 
      GPUMonitoring:     
        enabled: false
    gpu:                 
      kinds:
      - resourceName: "nvidia.com/gpu"
        resourceType: "GPU"
        default: true
    es:   # Storage backend for logging, events and auditing.
      # master:
      #   volumeSize: 4Gi  
      #   replicas: 1     
      #   resources: {}
      # data:
      #   volumeSize: 20Gi  
      #   replicas: 1      
      #   resources: {}
      enabled: false
      logMaxAge: 7            
      elkPrefix: logstash      
      basicAuth:
        enabled: false
        username: ""
        password: ""
      externalElasticsearchHost: ""
      externalElasticsearchPort: ""
    opensearch:   
      # master:
      #   volumeSize: 4Gi  
      #   replicas: 1      
      #   resources: {}
      # data:
      #   volumeSize: 20Gi  
      #   replicas: 1       
      #   resources: {}
      enabled: true
      logMaxAge: 7            
      opensearchPrefix: whizard     
      basicAuth:
        enabled: true
        username: "admin"
        password: "admin"
      externalOpensearchHost: ""
      externalOpensearchPort: ""
      dashboard:
        enabled: false
  alerting:                
    enabled: false        
    # thanosruler:
    #   replicas: 1
    #   resources: {}
  auditing:                
    enabled: false         
    # operator:
    #   resources: {}
    # webhook:
    #   resources: {}
  devops:                  
    enabled: false         
    jenkinsCpuReq: 0.5
    jenkinsCpuLim: 1
    jenkinsMemoryReq: 4Gi
    jenkinsMemoryLim: 4Gi  
    jenkinsVolumeSize: 16Gi
  events:                  
    enabled: false         
    # operator:
    #   resources: {}
    # exporter:
    #   resources: {}
    ruler:
      enabled: true
      replicas: 2
    #   resources: {}
  logging:                
    logsidecar:
      enabled: true
      replicas: 2
      # resources: {}
  metrics_server:                  
    enabled: false                   
  monitoring:
    storageClass: ""                 
    node_exporter:
      port: 9100
    gpu:                           
      nvidia_dcgm_exporter:        
        enabled: false             
        # resources: {}
  multicluster:
    clusterRole: none  
  network:
    networkpolicy: 
      enabled: false 
    ippool: 
      type: none 
    topology: 
      type: none 
  openpitrix: 
    store:
      enabled: false 
  servicemesh:         
    enabled: false     
    istio:  
      components:
        ingressGateways:
        - name: istio-ingressgateway
          enabled: false
        cni:
          enabled: false
  edgeruntime:          
    enabled: false
    kubeedge:        
      enabled: false
      cloudCore:
        cloudHub:
          advertiseAddress: 
            - ""            
        service:
          cloudhubNodePort: "30000"
          cloudhubQuicNodePort: "30001"
          cloudhubHttpsNodePort: "30002"
          cloudstreamNodePort: "30003"
          tunnelNodePort: "30004"
        # resources: {}
        # hostNetWork: false
      iptables-manager:
        enabled: true 
        mode: "external"
        # resources: {}
      # edgeService:
      #   resources: {}
  gatekeeper:        
    enabled: false  
    # controller_manager:
    #   resources: {}
    # audit:
    #   resources: {}
  terminal:
    # image: 'alpine:3.15' 
    timeout: 600         

```
