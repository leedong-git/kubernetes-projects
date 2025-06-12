# 📦 Monitoring Stack GitOps 배포 구조

Argo CD 기반 GitOps 방식으로 Prometheus, Loki, Tempo, OpenTelemetry 등 모니터링 스택을 배포합니다.

---

## 📁 폴더 구조

```
cd-repo/
└── apps/
├── argocd/
│ └── application/
│ └── {test, dev, prd}/
│ ├── app-of-apps.yaml
│ ├── prometheus.yaml
│ ├── loki.yaml
│ ├── tempo.yaml
│ ├── otel.yaml
│ └── otel-col.yaml
├── monitoring/
│ ├── grafana-dashboard/
│ │ ├── dashboard.yaml
│ │ └── kustomization.yaml
│ ├── kube-prometheus-stack/
│ │ └── values/
│ │ └── values-{test,dev,prd}.yaml
│ ├── loki-stack/
│ │ └── values/
│ │ └── values-{test,dev,prd}.yaml
│ └── tempo/
│ └── values/
│ └── values-{test,dev,prd}.yaml
└── otel/
└── opentelemetry-operator/
├── values/
│ └── values-{test,dev,prd}.yaml
├── instrumentation.yaml
├── otel-col.yaml
├── sm.yaml
└── kustomization.yaml
```

---

## 🚀 App-of-Apps 예시 (`app-of-apps.yaml`)

```bash
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: app-of-apps
  namespace: argocd
spec:
  project: default
  source:
    repoURL: git@bitbucket.org:dencomm4900/cd-repo.git
    targetRevision: HEAD
    path: apps/argocd/application/test
    directory:
      recurse: true
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## 📌 유의사항
app-of-apps.yaml 파일은 각 환경별 BastionVM에 있고, 수동으로 실행합니다.
app-of-apps는 directory.recurse: true 설정이 있어야 하위 앱을 자동 인식합니다.
ServerSideApply=true로 CRD가 큰 경우 오류 회피 가능

---