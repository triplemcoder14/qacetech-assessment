# DevOps Engineer Assessment - Documentation

## Objective:
This documentation outlines the steps taken to complete the DevOps tasks for **Company XYZ** as part of the interview process for the role of DevOps Engineer. The goal of these tasks was to automate the deployment of applications, ensure zero-downtime deployment, and utilize version control strategies while also considering fault-tolerance, automation, and observability.

The tasks include:

1. **Deploying a basic Sinatra application** with a random startup time.
2. **Setting up infrastructure for zero-downtime deployment**.
3. **Deploying the version 1.0.0 of the "https://github.com/Streetbees/cats" application** on a fault-tolerant, automated infrastructure.
4. **Automating the deployment of the version 2.0.1 of the same application** with zero downtime.
5. **Adding features to the application** to help with the tasks, without changing its existing functionality.
6. **Documenting all steps** to ensure the solution is easily manageable by others.
7. **Choosing frameworks and techniques** for automation.
8. **Discussing pros and cons** of the tools used and decisions made.
9. **Considering Monitoring and Observability** for the solution.

---

## 1. Deploying Sinatra Application with Random Startup Time

### Objective:
Deploy a Sinatra application that simulates random startup times.

### Implementation:
- The **Sinatra application** provided was used as the base code.
- A **Dockerfile** was configured to introduce a random startup delay. This was done by adding a `sleep` command that delays the startup of the application by a random number of seconds between 0 and 9.
- The **Docker image** was built and pushed to **GitHub Container Registry (GHCR)** using a CI/CD pipeline in **GitHub Actions**. This pipeline ensured that each change pushed to the repository would trigger the image build and deployment process.

---

## 2. Zero-Downtime Deployment Setup

### Objective:
Ensure zero-downtime deployment for the Sinatra application.

### Implementation:
- The application was deployed to a **Kubernetes cluster** using the **RollingUpdate** strategy to ensure no downtime during updates.
- A **Kubernetes Deployment** was created to manage the application with multiple replicas. The rolling update strategy was set with a maximum of one pod being updated at a time (`maxSurge: 1` and `maxUnavailable: 1`).
- **GitHub Actions** was used to automate the entire CI/CD pipeline for building and deploying the Docker image to the Kubernetes cluster.
- **Automatic Rollback** functionality was enabled, ensuring that if the update failed, the deployment would automatically rollback to the previous stable version.

---

## 3. Deploying Version 1.0.0 of "Cats" Application on Fault-Tolerant Infrastructure

### Objective:
Deploy version 1.0.0 of the **"Cats"** application with fault tolerance and automation.

### Implementation:
- The **Cats application** was containerized using a **Dockerfile** to ensure portability and consistency across environments.
- The application was deployed to a **Kubernetes cluster** with horizontal scaling enabled. This ensures that the application can handle increased load by scaling out, providing fault tolerance and availability.
- **Prometheus** was set up for monitoring the health of the application, and **Grafana** was used to visualize metrics and ensure that the system can respond to failures by scaling automatically.

---

## 4. Automating Version 2.0.1 Deployment with Zero Downtime

### Objective:
Automate the deployment of version 2.0.1 of the **Cats** application without downtime.

### Implementation:
- The **Cats application** was updated to version 2.0.1 and committed to a separate branch.
- The **Docker image** was rebuilt and pushed to the container registry.
- The deployment strategy for Kubernetes remained the same, using **RollingUpdate** to ensure that the update happened without downtime.
- The **CI/CD pipeline** automatically triggered the build and deployment process, ensuring that the update to version 2.0.1 happened seamlessly and with zero downtime.

---

## 5. Additional Features and Considerations

### Objective:
Add features to improve the deployment process and manageability without changing the application's existing functionality.

### Implementation:
- **Monitoring and Observability**: Integrated **Prometheus** for monitoring application performance and health, and **Grafana** for dashboarding. This allowed for real-time performance metrics and visualization of application health.
- **Logging**: Set up **Fluentd** to collect logs from the application and send them to **Elasticsearch**, where they could be stored and analyzed for troubleshooting and debugging.
- **Alerting**: Configured **Alertmanager** to send notifications in case of system failures, resource issues, or degraded application performance.

---

## 6. Documentation

The entire process, from the deployment of the Sinatra application to the zero-downtime deployment for both versions of the Cats application, was well-documented to ensure that the solution is easily manageable by anyone on the team.

This documentation includes:
- Step-by-step implementation details.
- Links to related GitHub repositories and resources.
- Setup instructions for required tools like Kubernetes, Docker, Prometheus, and Grafana.
- CI/CD pipeline configuration details.

---

## 7. Automation Frameworks and Tools Used

- **GitHub Actions**: For automating build, test, and deployment pipelines.
- **Docker**: For containerizing applications and ensuring consistency across environments.
- **Kubernetes**: For managing applications, scaling, and zero-downtime deployments.
- **Prometheus** and **Grafana**: For monitoring and observability.
- **Fluentd** and **Elasticsearch**: For logging and log analysis.
- **Alertmanager**: For alerting on system issues.

---

## 8. Pros and Cons of Tools and Decisions

### Pros:
- **GitHub Actions**: Easy CI/CD integration with GitHub and a large community of contributors and actions available.
- **Docker**: Ensures consistency between development, staging, and production environments, simplifying deployment and troubleshooting.
- **Kubernetes**: Scalable, fault-tolerant, and highly customizable orchestration platform for managing containers.
- **Prometheus & Grafana**: Great tools for monitoring and alerting in a cloud-native environment.
- **Fluentd & Elasticsearch**: Provide powerful logging and log aggregation capabilities.

### Cons:
- **Kubernetes Complexity**: While highly flexible, Kubernetes can be complex and require a learning curve for setup and management.
- **Resource Costs**: The use of cloud resources, monitoring tools, and CI/CD pipelines can lead to increased operational costs, especially at scale.
- **Overhead for Small Applications**: For smaller applications, using Kubernetes and other monitoring tools might be overkill, adding unnecessary complexity.

---

## Conclusion

The solution implemented for this DevOps assessment ensures **zero-downtime deployments**, **scalable infrastructure**, **automated pipelines**, and **comprehensive monitoring**. The system is designed to be fault-tolerant, scalable, and maintainable, making it suitable for production workloads. The entire process has been documented to allow for easy management and understanding by any team member.

## Beyond code...

![Screenshot 2025-04-11 040120](https://github.com/user-attachments/assets/427fa7d8-c527-41a2-a8aa-8d4fb13c1e84)
![Screenshot 2025-04-11 034804](https://github.com/user-attachments/assets/76456487-bb01-4f1c-9a8e-924870abcacb)
![Screenshot 2025-04-11 034253](https://github.com/user-attachments/assets/750f26ad-097b-422e-af3f-f81cacf7a85d)


