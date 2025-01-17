# Projet : Infrastructure GCP avec Terraform, Packer, Ansible et CI/CD

## 🚀 Vue d'ensemble
Ce projet propose une automatisation complète du déploiement d'une infrastructure cloud sur **Google Cloud Platform (GCP)**. Nous utilisons **Terraform**, **Packer** et **Ansible** pour gérer et configurer les ressources, et un pipeline **CI/CD** via **Google Cloud Build** et **Github** pour intégrer le développement et les déploiements en continu.

Les composants principaux incluent :
- **VPC (Virtual Private Cloud)** pour une architecture réseau sécurisée.
- **Groupes d'instances managés (MIG)** pour gérer les instances Compute Engine.
- **Load Balancer régional** pour distribuer le trafic.
- **Artefacts et monitoring** via **Google Artifact Registry** et **Cloud Monitoring**.

## 🔔 Notes importantes
- Ce projet est **en cours de développement** et certaines fonctionnalités pourraient ne pas être totalement opérationnelles.
- Ce projet a été réalisé dans le cadre de mes études, et il illustre les concepts appris dans le domaine de l'infrastructure cloud et de l'automatisation.

## 📂 Structure du projet
```
project-root/
├── ansible/             # Playbooks Ansible pour la configuration des instances
├── docker/              # Fichiers liés à Docker
├── environments/        # Configurations Terraform spécifiques à chaque environnement
│   ├── app/             # Infrastructure applicative
│   └── ops/             # Infrastructure opérationnelle
├── modules/             # Modules Terraform réutilisables
│   ├── artifact_registry/
│   ├── compute/
│   ├── monitoring/
│   ├── networking/
│   ├── storage/
├── packer/              # Configurations Packer pour les images personnalisées
├── src/                 # Code source de l'application
├── cloudbuild.yaml      # Définition du pipeline CI/CD
└── README.md            # Documentation (ce fichier)
```

## 🛠️ Composants clés

### Infrastructure avec **Terraform**
1. **Infrastructure opérationnelle (`ops`) :**
   - Création d'un **bucket GCS** pour stocker les états Terraform.
   - Provision d'un **Artifact Registry** pour stocker les artefacts.
   - Configuration d'un pipeline d'images **Compute Engine** (via Packer et Ansible).

2. **Infrastructure applicative (`app`) :**
   - Configuration d'un **VPC** avec sous-réseaux.
   - Déploiement d'un **Managed Instance Group (MIG)** basé sur une image personnalisée.
   - Configuration d'un **Load Balancer régional**.
   - Mise en place de **Cloud DNS** et tableaux de bord dans **Cloud Monitoring**.

### Images personnalisées avec **Packer** et **Ansible**
- **Packer** génère une image Compute Engine intégrant :
  - L'application configurée comme un service `systemd`.
  - **Google OpsAgent** pour le monitoring.
- **Ansible** gère l'installation et la configuration des dépendances applicatives.

### Pipeline CI/CD avec **Cloud Build**
Le pipeline CI/CD automatise :
1. L'analyse des secrets et vulnérabilités dans le code source.
2. La compilation et le stockage des artefacts dans **Artifact Registry**.
3. La création d'images Compute Engine via **Packer** et **Ansible**.

## ✅ Prérequis
1. **Google Cloud SDK :**
   ```bash
   gcloud auth login
   gcloud config set project YOUR_PROJECT_ID
   ```

2. **Terraform :**
   ```bash
   sudo apt-get install terraform
   ```

3. **Packer :**
   ```bash
   sudo apt-get install packer
   ```

4. **Ansible :**
   ```bash
   sudo apt-get install ansible
   ```

5. **Activation des API nécessaires :**
   ```bash
   gcloud services enable compute.googleapis.com \
       artifactregistry.googleapis.com \
       cloudbuild.googleapis.com \
       monitoring.googleapis.com
   ```

## 📦 Installation et déploiement

### Étape 1 : Initialisation du backend Terraform
- Allez dans le répertoire `environments/ops` et initialisez Terraform :
  ```bash
  cd environments/ops
  terraform init
  ```

### Étape 2 : Déploiement de l'infrastructure opérationnelle
- Déployez l'infrastructure `ops` avec Terraform :
  ```bash
  terraform apply
  ```

### Étape 3 : Création de l'image personnalisée
- Allez dans le répertoire `packer` et lancez la création de l'image :
  ```bash
  packer build packer.json
  ```

### Étape 4 : Déploiement de l'infrastructure applicative
- Allez dans le répertoire `environments/app` et déployez les ressources applicatives :
  ```bash
  cd environments/app
  terraform init
  terraform apply
  ```

### Étape 5 : Lancement du pipeline CI/CD
- Déclenchez le pipeline CI/CD défini dans `cloudbuild.yaml` :
  ```bash
  gcloud builds submit --config=cloudbuild.yaml
  ```

## 📊 Monitoring et maintenance
- Consultez **Cloud Monitoring** pour suivre les métriques (trafic, CPU, RAM).
- Utilisez **Cloud Logging** pour analyser les performances et déboguer.

## 🧹 Nettoyage
Pour éviter des coûts inutiles, détruisez les ressources lorsque vous avez terminé :
```bash
terraform destroy
```
Lancez cette commande dans les répertoires `ops` et `app`.

## ❓ Dépannage
- **Erreurs de permission :** Vérifiez que votre compte dispose des rôles IAM nécessaires (`Storage Admin`, `Compute Admin`, etc.).
- **Problèmes d'initialisation :** Assurez-vous que le bucket GCS pour le backend Terraform est correctement configuré.
- **Échecs Packer :** Vérifiez que les playbooks Ansible et les dépendances réseau sont accessibles.



## 💡 Contribution
Les contributions sont bienvenues ! Ouvrez une **issue** ou soumettez une **pull request** pour proposer des améliorations ou signaler des bugs.

---
**Auteur :** HALLERAY Valentin

**Merci à SWIECH Quentin pour le partage de connaissances et l'élaboration des projets**

