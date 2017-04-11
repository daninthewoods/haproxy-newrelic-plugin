[![Docker Repository on Quay](https://quay.io/repository/waffleio/haproxy-newrelic-plugin/status "Docker Repository on Quay")](https://quay.io/repository/waffleio/haproxy-newrelic-plugin)

# haproxy-newrelic-plugin
Docker container of the haproxy-newrelic plugin

## Goal
* To be the sidecar container next to haproxy sending metric data to new relic
* Uses the [haproxy newrelic plugin](https://newrelic.com/plugins/railsware-llc/14)
* Currently geared to be utilized inside of kubernetes

## Requirements
* Environmental Variables:
  * `NAMESPACE`
  * `HOSTNAME`
  * `NEWRELIC_TOKEN`
* Take a gander at the configuration to determine how these variables are used
* Suggested configuration for the `NAMESPACE` env var is to use the following
  example:
```
env:
- name: NAMESPACE
  valueFrom:
    fieldRef:
      fieldPath: metadata.namespace
```
* Suggested configuration for the `NEWRELIC_TOKEN` env var is to use a secret:
```
env:
- name: NEWRELIC_TOKEN
  valueFrom:
    secretKeyRef:
      name: newrelic-token
      key: token
```
* The configuration file is very dependent on the haproxy configuration
  * See the plugin documentation for more details
