
{{/*
Expand the name of the chart.
*/}}
{{- define "kdp-metastore.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}



{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kdp-metastore.fullname" -}}
{{- if .Values.fullNameOverride }}
{{- .Values.fullNameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kdp-metastore.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "kdp-metastore.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kdp-metastore.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kdp-metastore.labels" -}}
helm.sh/chart: {{ include "kdp-metastore.chart" . }}
{{ include "kdp-metastore.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Create the name of the cluster postgreql
*/}}
{{- define "kdp-metastore.pgClusterName" -}}
{{- default (printf "%s-pg" (include "kdp-metastore.fullname" .)) .Values.pgclusterName }}
{{- end }}


{{/*
Create the name of the s3 secret, if created here
*/}}
{{- define "kdp-metastore.s3SecretName" -}}
{{- default (printf "%s-s3-secret" (include "kdp-metastore.fullname" .)) .Values.pgclusterName }}
{{- end }}
