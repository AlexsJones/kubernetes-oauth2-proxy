# kubernetes-oauth2-proxy

oauth2 proxy in kubernetes
Fantastic for setting up simple authentication to private services

- upload the oauth2_proxy.cfg as `conf` configmap in the namespace
- Run oauth2 ./deploy.sh
- Redirect host record to new ingress



Here is an example of how you would direct from the primary ingress into the oauth2 proxy; the proxy then directing to your service.
```
#This is an auto generated file
kind: Ingress
apiVersion: extensions/v1beta1
metadata:
  name: l7-ingress
  annotations:
    kubernetes.io/ingress.class: "nginx"
    ingress.kubernetes.io/ssl-redirect: "true"
spec:
  tls:
    - hosts:
      - kibana.myhost.com
      - www.kibana.myhost.com
      secretName: tls-chained
  rules:
  - host: kibana.myhost.com
    http:
      paths:
        - backend:
            serviceName: oauth2
            servicePort: 4180

```
