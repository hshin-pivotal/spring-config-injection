# Spring Config Decorator

This is a [supply](https://docs.cloudfoundry.org/buildpacks/understand-buildpacks.html) buildpack
for Cloud Foundry that provides integration with the Spring Cloud Config server *for any programming
language* supported by the platform, and requiring *zero application code changes*.

When this buildpack
is present in your Cloud Foundry deployment, all you will have to do to inject
centrally managed configuration into your applications is bind the application to your Spring Cloud
Config Server instance. Your application will then automatically receive the properties configured
in that server in its environment.

```sh
foo@bar:my-app$ cf push my-app --no-start
foo@bar:my-app$ cf v3-push my-app -b spring_config_injection -b <final_buildpack>

```
