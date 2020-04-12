# Guid to Setup an  AWS EKS Kubernetes Cluster using Terraform and KOPS and deploy a sample K8S Application

# Introduction

This document describes how to deploy a reliable and high available AWS EKS Kubernetes cluster with Terraform and KOPS.
Amazon Elastic Kubernetes Service (Amazon EKS) is a fully managed Kubernetes service. 
Kubernetes (K8S) is an open-source system for automating deployment, scaling, and management of containerized applications.

In this tutorial, you deploy the following architecture using Terraform and KOPS. You use Terraform for the shared VPC, KOPS resources,ECR and the application environment provisioning. You use KOPS to  as the mechanism to install and manage the EKS cluster in AWS. You use kubectl to manage the K8S application deployment.

# Architecture


The following table maps most of the AWS products used in this tutorial to their use case in EKS cluster.




